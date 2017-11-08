alias ss="lsof -nP -iTCP -sTCP:LISTEN"
function fshow() {
    git diff-tree --name-only -r $1 | fzf --preview "git show --color=always $1 -- {}"
}

function fdiff() {
    git diff --name-only | fzf --preview "git diff --color=always {}"
}
