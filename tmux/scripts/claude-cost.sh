#!/usr/bin/env bash
# claude-cost.sh — zero-blocking Claude spend tracker for tmux status-right.

# tmux doesn't source shell configs, so npx/python3 may not be on PATH
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

CACHE_FILE="/tmp/claude-cost-cache"
CACHE_TTL=300  # 5 minutes

_compute() {
    local today month
    # Using --no-install ensures npx never stalls downloading a package update on a slow connection
    today=$(npx --yes --no-install ccusage daily -j 2>/dev/null | python3 -c "
import sys, json, datetime
try:
    data = json.load(sys.stdin).get('daily', [])
    t = datetime.date.today().isoformat()
    cost = next((d['totalCost'] for d in data if d.get('period') == t), 0)
    print(f'\${cost:.2f}')
except Exception:
    print('\$0.00')
" 2>/dev/null)

    month=$(npx --yes --no-install ccusage monthly -j 2>/dev/null | python3 -c "
import sys, json, datetime
try:
    data = json.load(sys.stdin).get('monthly', [])
    ym = datetime.date.today().strftime('%Y-%m')
    cost = next((d['totalCost'] for d in data if d.get('period', '').startswith(ym)), 0)
    print(f'\${cost:.2f}')
except Exception:
    print('\$0.00')
" 2>/dev/null)

    local pct=""
    if [[ -n "$month" ]]; then
        pct=$(python3 -c "v=float('${month#\$}');print(f'({v/250*100:.0f}%)')" 2>/dev/null)
    fi
    echo "☁ ${today:-?} / ${month:-?} ${pct}"
}

# 1. If cache exists and is fresh, print it and exit immediately
if [[ -f "$CACHE_FILE" ]]; then
    age=$(( $(date +%s) - $(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0) ))
    if (( age < CACHE_TTL )); then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# 2. If cache is stale, print old data instantly, then trigger an asynchronous update.
# CRITICAL: We redirect stdout/stderr to /dev/null and use 'nohup' so tmux doesn't wait for it.
if [[ -f "$CACHE_FILE" ]]; then
    cat "$CACHE_FILE"
    nohup bash -c "_compute() { $(declare -f _compute); }; _compute > '$CACHE_FILE'" >/dev/null 2>&1 &
else
    # First run fallback if no cache exists yet
    result=$(_compute)
    echo "$result" > "$CACHE_FILE"
    echo "$result"
fi
