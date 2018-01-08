alias pypi_upload='python ./setup.py sdist upload -r pypi-local'
alias dns_flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias spark="$SPARK_HOME/bin/"
alias stash-pull="git stash && git pull && git stash pop"
