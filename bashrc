#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=vim
export PROMPT_COMMAND='tput bel'

#path
export PATH=$PATH:~/.scripts

#gurobi
export GUROBI_HOME="/home/fran/.gurobi/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE="/home/fran/.gurobi/gurobi.lic"

#Misc alias
alias em='emacs -nw'
alias ll='ls -l'


# pacman
# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacupg='sudo pacman -Syu'
# Install specific package(s) from the repositories
alias pacin='sudo pacman -S'
# Install specific package not from the repositories but from a file
alias pacins='sudo pacman -U'
# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacre='sudo pacman -R'
# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrem='sudo pacman -Rns'
# Display information about a given package in the repositories
alias pacrep='pacman -Si'
# Search for package(s) in the repositories
alias pacreps='pacman -Ss'
# Display information about a given package in the local database
alias pacloc='pacman -Qi'
# Search for package(s) in the local database
alias paclocs='pacman -Qs'
# List all packages which are orphaned
alias paclo="pacman -Qdt"
# Clean cache - delete all not currently installed package files
alias pacc="sudo pacman -Scc"
# List all files installed by a given packages
alias paclf="pacman -Ql"
