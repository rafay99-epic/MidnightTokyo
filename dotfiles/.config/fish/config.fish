##########################################
#    Name: Fish Shell Configuration      #                                       
#    Author: Prometheus                  #
#    Version: 3.0                        #
#    Description: Fish Shell             #                
##########################################

if status is-interactive
    
    #----------------------
    # Fish greeting diable
    #----------------------
    set fish_greeting
        
    #-----------------
    # Display info
    #-----------------
    # fm6000 -c "blue" -m 9 -g 9 -l 25 
    neofetch
        
    #-----------------
    # Starship Prompt
    #-----------------
    starship init fish | source
        
        
    ######################################
    #           Fish Aliases             #
    ######################################
    
    #-------------------------
    # Terminal and Navigation
    #-------------------------
    alias ls="lsd -ll"
    alias rm="trash-put"
    alias cp="cp -r"
    alias mv="mv -i"
    
    #--------------------------------
    # System health and Power status
    #--------------------------------
    alias health='sudo auto-cpufreq --live'
    alias h='htop'
    
    #------------------------------
    #System Lock, Reboot, Shutdown
    #------------------------------
    alias reboot='sudo reboot'
    alias shutdown='sudo shutdown now'
    alias lock='i3lock -i /$HOME/Pictures/Toky-Wallpapers/tokyo-night33.png'
    alias kernel="uname -r"
    
    #----------------
    # Pacman Aliases
    #-----------------
    alias update="sudo dnf update"
    alias dn="sudo dnf install"
    alias remove="sudo dnf remove"
    
    #----------------------------
    # Code Editior & Development 
    #----------------------------
    alias c="code"
    alias lvim="$HOME/.local/bin/lvim"
    alias n="nvim"
    
    #-----------------
    # Git Aliases
    #-----------------
    alias gs="git status"
    alias g="git"
    alias gc="git clone"
    alias ga="git commit -a"
    alias branch="git branch -r"    
    
    #-----------------
    # System Control
    #-----------------
    alias vol="alsamixer"
    alias net="nmtui"
    alias back="cd ../"
    alias vol_control="pavucontrol"
    
    #-----------------
    # battery Info
    #-----------------
    alias battery="bat /sys/class/power_supply/BAT0/capacity"
    alias battery_check="exec $HOME/.scripts/battery-info.sh"

    
    #----------------------------------
    # Redirect to the GitHub Projects
    #----------------------------------
    alias Project="cd $HOME/GitHub-Projects/"
    alias blog='cd $HOME/GitHub-Projects/Future-Insight'
    alias personal='cd $HOME/GitHub-Projects/Personal-Website'
    alias cyber='cd $HOME/GitHub-Projects/Cyber-Attack-Detection'
    alias detct='cd $HOME/GitHub-Projects/Detect-GPT'
    alias EasyInstall="cd $HOME/GitHub-Projects/EasyInstall"
    
    #---------------------
    # Update Fonts Cache
    #---------------------
    alias update-fc='sudo fc-cache -fv'
    
    #--------------------------
    # Check Firewall Status
    #--------------------------
    alias firewall='sudo ufw status' 
    
    #---------------------------
    # Fire Wall Rules
    # --------------------------
    # sudo ufw limit 22/tcp
    # sudo ufw allow 80/tcp
    # sudo ufw allow 443/tcp
    # sudo ufw default deny incoming
    # sudo ufw default allow outgoing
    # sudo ufw enable   

    #---------------------------------
    # System Folder
    #---------------------------------

    alias downloads= "cd $HOME/Downloads"
    alias picture="cd $HOME/Pictures"
    alias music="cd $HOME/Music"
    alias video="cd $HOME/Videos"
    alias documents="cd $HOME/Documents"
    alias desktop="cd $HOME/Desktop"

    #-------------------------
    # Widnow Manager Blinking
    #-------------------------
    alias clock="peaclock"
    alias visual="cava"

    #----------------------
    # Hugo Server
    #-----------------------
    alias hu-server="hugo server --disableFastRender"
    alias hugo_new_blog="exec $HOME/GitHub-Projects/Future-Insight/blog_post_generator.sh"
    alias git_commit="exec $HOME/.scripts/git_commit.sh"

    #-----------------------
    # Blog Webiste
    #-----------------------
    alias blog_branch='git checkout Blogs'
    alias blog_main='git checkout main'
    alias blog_development='git checkout Development-Branch'


    end
    
    #--------------------------
    # >>> conda initialize >>>
    #--------------------------
    # eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source
