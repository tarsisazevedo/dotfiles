# 1. Shell Integrations (Starship, FZF, Zoxide)
starship init fish | source
fzf --fish | source
zoxide init fish | source

# 2. Paths
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path /Library/Tex/texbin

# 3. Environment Variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx UV_VENV_SEED true
set -gx UV_MANAGED_PYTHON 1
# Work-specific vars (uncomment on work machine):
# set -gx SNOWFLAKE_ACCOUNT "doximity.us-east-1.privatelink"
# set -gx SNOWFLAKE_WAREHOUSE "ADHOC_WH"
# set -gx DOCKER_DEFAULT_PLATFORM "linux/amd64"
# set -gx MORTAR_DOCKERHUB_USER "tarsisazevedo"
# set -gx C_INCLUDE_PATH "/opt/homebrew/Cellar/librdkafka/2.5.0/include/"
# set -gx LIBRARY_PATH "/opt/homebrew/Cellar/librdkafka/2.5.0/lib"

# 4. Secrets (tokens, passwords — never commit this file)
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# 5. Pyenv (correct fish syntax — not bash eval)
set -gx PYENV_ROOT "$HOME/.pyenv"
fish_add_path "$PYENV_ROOT/bin"
pyenv init - fish | source
pyenv virtualenv-init - fish | source

# 6. Abbreviations
abbr -a v   nvim
abbr -a vi  nvim
abbr -a t   tmux
abbr -a ta  'tmux attach -t main'
abbr -a tls 'tmux list-sessions'
abbr -a tk  'tmux kill-session -t'

# 7. Auto-attach to tmux (safe, non-looping — exec replaces the shell process)
if status is-interactive
    if not set -q TMUX
        if tmux has-session -t main 2>/dev/null
            exec tmux attach-session -t main
        else
            exec tmux new-session -s main
        end
    end
end
