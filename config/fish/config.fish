if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Basic config
set -g fish_greeting ''
set -gx PATH $HOME/.local/bin $HOME/bin /usr/local/bin $HOME/dotfiles/scripts $PATH

if set -q SSH_CONNECTION
    set -gx EDITOR 'vim'
else
    set -gx EDITOR 'emacsclient -s daemon'
end

# GUROBI
set -gx GUROBI_HOME $HOME/.gurobi/linux64
set -gx PATH $PATH $GUROBI_HOME/bin
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $GUROBI_HOME/lib
set -gx GRB_LICENSE_FILE $HOME/.gurobi/gurobi.lic

# Spotify fix
set -gx LC_NUMERIC en_US.utf8

# qt
# set -gx QT_QPA_PLATFORMTHEME qt6ct

# thefuck
set -x THEFUCK_OVERRIDDEN_ALIASES 'rm,mv,cp'

# GPG
set -gx GPG_TTY (tty)
set -gx LC_TYPE UTF-8
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null

# vterm
function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end 
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end
function vterm_prompt_end;
    vterm_printf '51;A'(whoami)'@'(hostname)':'(pwd)
end
functions --copy fish_prompt vterm_old_fish_prompt
function fish_prompt --description 'Write out the prompt; do not replace this. Instead, put this at end of your file.'
    # Remove the trailing newline from the original prompt. This is done
    # using the string builtin from fish, but to make sure any escape codes
    # are correctly interpreted, use %b for printf.
    printf "%b" (string join "\n" (vterm_old_fish_prompt))
    vterm_prompt_end
end

# Colors
set fish_color_command normal --bold
set fish_color_param normal

# Direnv
direnv hook fish | source

# Advanced Aliases.
# Use with caution
#

# ls, the common ones I use a lot shortened for rapid fire usage
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias lsr='ls -lARFh' #Recursive list of files and directories
alias lsn='ls -1'     #A column contains name of files and directories

alias t='tail -f'

alias dud='du -d 1 -h'
alias duf='du -sh *'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# archlinux aliases
alias yalocs='yay -Qs'

# misc
alias em="emacsclient -s daemon -c"
alias vim="vim --servername VIM"
alias vimrc="vim ~/.vimrc"
alias vi="vim"
alias op="xdg-open"
alias tml="tmuxp load ."
alias ytdlm="youtube-dl -f 'bestaudio' --extract-audio --audio-format mp3 --audio-quality 0"
alias mpvm="mpv --no-video"
