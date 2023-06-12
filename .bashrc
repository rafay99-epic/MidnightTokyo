##########################################
#    Name: bash Shell Configuration      #                                       
#    Author: Prometheus                  #
#    Version: 3.0                        #
#    Description: Bash Shell             #                
##########################################
#------------
# EXPORT 
#------------
export EDITOR='nvim'
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'
bind "set completion-ignore-case on"
PS1='[\u@\h \W]\$ '
[[ $- != *i* ]] && return

#-------------------------
#Defaults Paths Variables
#-------------------------
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#------------------------------------------
# ex = EXtractor for all kinds of archives
#------------------------------------------
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#---------------------
# Alias for Bash Shell
#---------------------
[[ -f $HOME/.config/bash/bashrc-alias ]] && . ~/.config/bash/bashrc-alias

#-----------------
# Display info
#-----------------
fm6000 -c blue -m 9 -g 9 -l 25
#neofetch

#-----------------
# Starship Prompt
#-----------------
eval "$(starship init bash)"

#--------------------------
# >>> conda initialize >>>
#--------------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/prometheus/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
. "/home/$HOME/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
      export PATH="/home/$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
