export PATH=/usr/local/share/python:$PATH
export ALTERNATE_EDITOR="emacsclient" EDITOR=emacsclient VISUAL=emacsclient
source ~/.git-prompt.sh
PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
