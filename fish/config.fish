if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
fish_add_path /opt/homebrew/bin

alias gcloud_login 'gcloud auth login && gcloud auth application-default login'

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export JAVA_HOME=$(/usr/libexec/java_home)
