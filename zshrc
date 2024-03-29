if [[ "$TERM" == "tramp" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  if whence -w precmd >/dev/null; then
      unfunction precmd
  fi
  if whence -w preexec >/dev/null; then
      unfunction preexec
  fi
  unset RPROMPT
  unset RPS1
  PS1='$ '
  return
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kurot"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux common-aliases last-working-dir virtualenv zbell)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/dotfiles/scripts:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# GUROBI
export GUROBI_HOME=$HOME/.gurobi/linux64
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE=$HOME/.gurobi/gurobi.lic

# Spotify fix
export LC_NUMERIC=en_US.utf8

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper_lazy.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacsclient -s daemon'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias em="emacsclient -s daemon -c"
alias vim="vim --servername VIM"
alias vimrc="vim ~/.vimrc"
alias vi="vim"
alias op="xdg-open"
alias tml="tmuxp load ."
alias ytdlm="youtube-dl -f 'bestaudio' --extract-audio --audio-format mp3 --audio-quality 0"
alias mpvm="mpv --no-video"

# OPAM configuration
. /home/fran/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# z
unalias 'P'
export FZF_DEFAULT_OPTS="--bind 'shift-tab:up,tab:down' --cycle ${DEFAULT_OPTS}"
. /usr/share/z/z.sh
. /usr/share/fz/fz.sh
. /usr/share/fzf-tab-completion/zsh/fzf-zsh-completion.sh
bindkey '^I' fzf_completion

eval $(thefuck --alias)

# tmuxp
export DISABLE_AUTO_TITLE="true"

# vi-mode
# bindkey -v
# export KEYTIMEOUT=1
#
# bindkey '^P' up-history
# bindkey '^N' down-history
#
# # backspace and ^h working even after
# # returning from command mode
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
# bindkey '^w' backward-kill-word
#
# # ctrl-r starts searching history backward
# bindkey '^r' history-incremental-search-backward

# GPG
export GPG_TTY=$(tty)
export LC_TYPE=UTF-8
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi

# Bell on command exit
export PROMPT_COMMAND="echo -n '\a'"
promptcmd() { eval "$PROMPT_COMMAND" }
add-zsh-hook precmd promptcmd

# duckduckgo search
ddg ()
{
    /usr/bin/w3m "https://duckduckgo.com/lite?q=$*&kd=-1"
}

# vterm config
vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
