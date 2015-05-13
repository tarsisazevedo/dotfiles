alias ipypi_upload='python ./setup.py sdist upload -r ipypi-local'
alias pypi_upload='python ./setup.py sdist upload -r pypi-local'
alias staging='sudo ~/projetos/globo/staging-deploy/scripts/staging.sh'
alias load-virtuoso='cap LOADER_OPTS="-CGrt" ambiente:local base:tudo produto:tudo action:deploylocal'
alias containers="tsuru app-list | grep unit | awk -F '|' '{print \$3}' | awk '{SUM+=\$3} END {print SUM}'"
alias nodes="tsuru-admin docker-node-list | grep http | wc -l"
alias cdtsuru="cd src/github.com/tsuru/tsuru"
alias cdfreela="cd ~/projetos/freela/"
alias cdglobo="cd ~/projetos/globo/"
alias cdpessoal="cd ~/projetos/pessoal/"
alias dns_flush="sudo discoveryutil mdnsflushcache"
