alias tmux="TERM=screen-256color-bce tmux -u"
alias tma='tmux attach -d -t'
function tmux-new() {
  if [ "$1" != "" ] 
  then
    tmux new -s $1
  else
    tmux new -s $(basename $(pwd))
  fi
}
