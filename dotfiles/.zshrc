####################################################################################
#                                                                                   #     
#                     Name:        Abdul Rafay                                      #
#                     Email:       99marafay@gmail.com                              # 
#                     GitHub:      github.com/rafay99-epic                          #
#                     website:     https://rafay99.info                             #
#                     Config File: ZSh Config File                                  #
#                                                                                   #
####################################################################################

#-------------------------
#Defaults Paths Variables
#-------------------------
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#-----------------
# Display info
#-----------------
fm6000 -c blue -m 9 -g 9 -l 25
#neofetch

###########################################
#            Startship Promote            #
###########################################
eval "$(starship init zsh)"

#-----------------
# Man Pages Path
#-----------------
# Exporting the Man Pages for ZSH SHEll
export MANPATH="/usr/local/man:$MANPATH"

#--------------
#System Local
#--------------
export LANG=en_US.UTF-8

#----------
#ZSH Theme
#---------
ZSH_THEME="ramdom"

#-------------------------------
# Use case-sensitive completion
#-------------------------------
CASE_SENSITIVE="true"

#-----------------------------------
# Use hyphen-insensitive completion.
#-----------------------------------
HYPHEN_INSENSITIVE="true"

#--------------------------------------
# Disable auto-setting terminal title.
#--------------------------------------
ISABLE_AUTO_TITLE="true"

#--------------------------------
# Enable command auto-correction.
#--------------------------------
ENABLE_CORRECTION="true"

#----------------
#Time and date
#----------------
HIST_STAMPS="dd/mm/yyyy"

#---------------
#Plug for Shell
#---------------
plugins=(
   git
   zsh-autosuggestions
   )
#------------------------------------------------
# Preferred editor for local and remote sessions
#------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='~/.local/bin/lvim'
else
   export EDITOR='nvim'
fi


###########################################
# Importing the Aliases for ZSH SHEll     #
###########################################
if [ -f $HOME/.config/zsh/zshalias ]; then
    source $HOME/.config/zsh/zshalias
else
    print "404: ~/.zsh/zshalias not found."
fi


#--------------------------
# >>> conda initialize >>>
#--------------------------
__conda_setup="$('/home/prometheus/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/prometheus/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/prometheus/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/prometheus/anaconda3/bin:$PATH"
    fi
fi
