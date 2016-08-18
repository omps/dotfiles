

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.local/bin:$PATH" # Add powerline PATH for scripting
# The following lines were added by compinstall
zstyle :compinstall filename '/home/omps/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters
. /home/omps/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
export XENVIRONMENT="${HOME}/.Xresources"
