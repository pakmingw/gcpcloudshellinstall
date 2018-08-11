###################################################################
# Bash_profile .dotfile - DO NOT make customizations in this file,#
# use .bash_profile_local instead.                                #
###################################################################

## Source the existing bashrc file, make no distiction between
## interactive and non-interactive shells
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Remember the user if there are any tmux sessions running
#TMUX_SESS_NAME="$(tmux list-sessions -F '#{session_name}' 2>/dev/null)"
#if [[ ! -z $TMUX_SESS_NAME ]] && [[ -z $TMUX ]]; then
#  printf "\nThere\'s a tmux session called $TMUX_SESS_NAME, please attach to it\n\n"
#fi

# Open a tmux session if not running or attach to it
if [[ -z $TMUX ]]; then
  tmux new-session -A -s main
fi

# Enable rich color in the terminal
export TERM=xterm-256color

## PROMPT ##
## Enable customized prompt (Bash powerline)
source ~/.prompt


## TMUX ##
## Set tmux status bar to always on
tmux set -g status on &>/dev/null
## and set the right pane title to the active cloud project
printf '\033]2;%s\033\\' "$DEVSHELL_PROJECT_ID"


## FUNCTIONS ##
## Define a function to update working cloud project ID
function project {
  if [ -z "$1" ]; then  
	  gcloud config list project --format="value(core.project)"
  else
	    export DEVSHELL_PROJECT_ID=$1
    gcloud config set project $DEVSHELL_PROJECT_ID
    if [ -n "$TMUX" ]; then
      printf '\033]2;%s\033\\' "$DEVSHELL_PROJECT_ID"
    fi
  fi
}

## Define a function to simplify k8s cluster swap
clusterchange(){
	gcloud container clusters get-credentials $1 --zone europe-west1-d
}


## Define a function to simplify API enablement in GCP
addapi(){
    if [ -z "$1" ]; then
        echo "Use the command passing the APIs you want to enable as arguments"
    else
        for i in "$@"
            do
                echo "Testing for $i API"
                if [[ $(gcloud services list --enabled --filter=$i --format 'yaml') ]]; then
                    echo "API already enabled"
                else
                    echo "Enabling API..."
                    gcloud services enable $i
                    echo "API enabled"
                fi
            done
    fi
}

## Define a function to split the screen with a command executed with watch
function tmw {
  tmux split-window -dv "watch $*"
}

## Substitute the VSCode command by cloud shell editor
function code {
  cloudshell edit $1
}  

## ALIAS ##

alias l="ls -la"       # List in long format, include dotfiles
alias ld="ls -ld */"   # List in long format, only directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vec="virtualenv -p python3 env"
alias vec3=vec
alias vec2="virtualenv -p python2 env"
alias vea="source env/bin/activate"
alias ves="echo $VIRTUAL_ENV"
alias cdd="cd ~/cloud-demos/"
alias py3="source ~/envs/py3/bin/activate"
alias py2="source ~/envs/py2/bin/activate"
alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'
alias gcurl-post='curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json" -d'

# Consider local bin directory as part of the path
export PATH=$PATH:~/bin

# set editor to vim
git config --global core.editor "vim"

## LOCAL BASHRC/BASH_PROFILE ##
source ~/.bash_profile_local

