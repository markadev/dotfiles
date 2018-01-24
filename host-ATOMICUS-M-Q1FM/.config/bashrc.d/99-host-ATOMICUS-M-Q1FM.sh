export PS1="\u@\h:\w\$ "
export CLICOLOR=1
export PGHOST="127.0.0.1"
export PGUSER="postgres"
export PATH="${PATH}:/usr/local/opt/postgresql@9.4/bin"
export TF_PLUGIN_CACHE_DIR="${HOME}/.cache/terraform-plugin-cache"

npvenv()
{
    . ${HOME}/src/platform-core/npvenv/bin/activate
}

alias bgrep="grep --exclude='*.pyc' --exclude='tags' --exclude='*.tfstate*' --exclude-dir='.git' --exclude-dir='.build' --exclude-dir='.venv' --exclude-dir='npvenv' --exclude-dir='.terraform' --exclude-dir=.tox"
alias ecr_login="aws --region=us-east-1 ecr get-login |sh"
