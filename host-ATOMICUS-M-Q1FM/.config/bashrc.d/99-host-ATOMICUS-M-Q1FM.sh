export PS1="\u@\h:\w\$ "
export CLICOLOR=1
export PGHOST="127.0.0.1"
export PGUSER="postgres"

npvenv()
{
    . ${HOME}/src/platform-core/npvenv/bin/activate
}

alias bgrep="grep --exclude='*.pyc' --exclude='tags' --exclude-dir='.git' --exclude-dir='.build' --exclude-dir='.venv' --exclude-dir='npvenv'"
alias ecr_login="aws --region=us-east-1 ecr get-login |sh"
