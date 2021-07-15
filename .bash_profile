
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HTTP_PROXY=http://proxy.vmware.com:3128
export HTTPS_PROXY=http://proxy.vmware.com:3128

alias ss="lsof -nP -iTCP -sTCP:LISTEN"

#search '*.js' 'str'
function search() {
  find . -type f -name $1 | xargs grep $2
}

alias serve="python -m SimpleHTTPServer"
alias serves="python ~/code/simple-https-server.py"
#alias branch="git branch | cat"
alias pull="git stash && git pull && git stash pop"
alias py="python3"
alias abbr="python3 ~/code/tools/vm-abbr.py"

function rebase() {
 git stash && git rebase $1 && git stash pop
}

function b() {
  if [ $# -eq 0 ]
    then
      git branch | cat
  else
    git branch | head $1 | tail -1
  fi
}

# k8s
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

alias kcd="kubectl config use-context"
alias kls="kubectl config get-contexts"

function fdiff() {
  git diff $1 --name-only | fzf --preview "git diff $1 --color=always {}"
}

function fshow() {
  git diff-tree $1 -r --name-only | fzf --preview "git show $1 --color=always {}"
}

#flog -10
function flog() {
  git log $1 --pretty=format:"%h" | fzf --preview "git show --color=always {}"
}

function fk() {
  # kubectl get $1 | sed 's/|//' | awk '{print $1}' | fzf --preview "kubectl get $1 {} -o yaml"
  kubectl get $1 | sed 's/|//' | awk '{print $1}' | fzf --preview "kubectl describe $1"
}

function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

#export PATH="/usr/local/mysql-8.0.16-macos10.14-x86_64/bin:$PATH"
export npmPath="/Users/andrewz/.nvm/versions/node/v10.16.2/lib/node_modules"
