## OPTIONS
shopt -s checkwinsize

## BASHRC
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

## PLATFORM
if [ $(uname) == 'Linux' ]; then
    PLATFORM='linux'
elif [ $(uname) == 'Darwin' ]; then
    PLATFORM='mac'
    export CLICOLOR=1
    export TERM='xterm-256color'
else
    PLATFORM='unknown'
fi


## PATH
if [ $PLATFORM == 'mac' ]; then
    export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/ruby/bin:$PATH
fi
export PATH=$PATH:$HOME/.node/bin


## PROMPT
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    PS1='\[\e]0;\w\a\]\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\w\$ '
fi


## HISTORY
HISTCONTROL=ignoreboth
HISTSIZE=500000
HISTFILESIZE=100000
HISTIGNORE='&:?:??:mysql*-p[! ]*'
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a' 


## AUTOCOMPLETE
if [ $PLATFORM == 'mac' ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
elif [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


## NAVIGATION
shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null

CDPATH=".:~/Projects"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias .........="cd ../../../../../../../../"
alias ..........="cd ../../../../../../../../../"

## COLORS
if [ $PLATFORM == 'linux' ]; then
    alias ls='ls --color=auto'
elif [ $PLATFORM == 'mac' ]; then
    export CLICOLOR=yes
fi


## OPEN FUNCTION
if [ $PLATFORM == 'linux' ]; then
    function op() {
        for var in "$@"
        do
            xdg-open "$var"
        done
    }
elif [ $PLATFORM == 'mac' ]; then
    alias op="open"
fi


## PYTHON + CONDA

alias ipython='ipython --profile=matt'
export PATH="~/miniconda3/bin:$PATH"
export PATH=/usr/local/opt/python/libexec/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then
    eval "$(pyenv init -)";
fi

vet () {
    if [ -z "$VIRTUAL_ENV" ]; then
        if [ -f "env/bin/activate" ]; then
            source env/bin/activate
        elif [ -f "../env/bin/activate" ]; then
            source ../env/bin/activate
        elif [ -f "../../env/bin/activate" ]; then
            source ../../env/bin/activate
        elif [ -f "../../../env/bin/activate" ]; then
            source ../../../env/bin/activate
        fi
    else
        deactivate
    fi
}

#. ~/.bash/complete/django.sh

function djrs() {(python manage.py runserver $@)}


## GIT
alias gc="git commit"
alias gca="git commit --amend"
alias ga="git add"
alias gs="git status"
alias gb="git branch"
alias gm="git merge"
alias gd="git diff"
alias gds="git diff --staged"
alias gp="git push"
alias gpu="git pull"
alias gch="git checkout"
alias grh="git reset --hard"
alias glog="git log --oneline"
alias gcp="git cherry-pick"
alias gbr="git branch | grep -v "master" | xargs git branch -D"

if hash __git_complete 2>/dev/null; then
    __git_complete gc _git_commit
    __git_complete ga _git_add
    __git_complete gb _git_branch
    __git_complete gm _git_merge
    __git_complete gd _git_diff
    __git_complete gch _git_checkout
    __git_complete gcp _git_cherry_pick
fi


## DOCKER
alias drm='docker rm $(docker ps -a -q) ; docker rmi -f $(docker images -q -a -f dangling=true)'
alias dc='docker-compose'


## MAN
export MANWIDTH=100


## TMUX
alias tma="tmux attach -t"
#. ~/.bash/complete/tma
alias tml="tmux list-sessions"
alias tmn="tmux new-session -s"

# If tmux command exists, and you aren't in a session, then create one using
# the current user's name (or join it if it exists)
if hash tmux 2>/dev/null; then
    if [ -z "$TMUX" ] && [ -n "$SSH_CLIENT" ]; then
        if tmux has-session -t $USER; then
            tmux attach-session -t $USER
        else
            tmux new-session -s $USER
        fi
    fi
fi


## SUBSTITUTE
function sub (){(ag -l $1 | xargs sed -i'' "s/$1/$2/g")}


## RENAME
function ren (){(find . -type f -name "*$1*" -exec rename -s $1 $2 {} \;)}


# SUBSTITUTE AND RENAME
function sar (){(sub "$1" "$2" ; ren "$1" "$2")}


## CLEAN WHITE SPACE
alias cws="sed -i.bak -e 's///g' -e 's/ *$//g'"


## WATCH DIRECTORY
if [ $PLATFORM == 'linux' ]; then
    wd () {
        directory=$1
        excludes=$(find . -exec git check-ignore {} \; -exec echo -e {} \; -prune)
        shift
        command="$@"
        while inotifywait -r -q --format '' $excludes $directory; do
            eval $command || true
        done
    }
elif [ $PLATFORM == 'mac' ]; then
    wd () {
        directory=$1
        excludes=$(find . -exec git check-ignore {} \; -exec echo -e {} \; -prune)
        shift
        command="$@"
        fswatch -0 -r -o $directory $excludes | xargs -0 -n 1 -I % $command || true
    }
fi


## CD SUB
cds () {
    sub="$(find . -name $1 -type d -print -quit)"
    if [ -n "$sub" ]; then
        cd $sub
    else
        echo "No subdirectory named $1"
    fi
}


## ANSIBLE
alias ap="ansible-playbook -l"


## NVM
function nvm () {
    if hash nvm 2>/dev/null; then
        # source only if the command is used
        export NVM_DIR=~/.nvm
        . $(brew --prefix nvm)/nvm.sh
    fi
    nvm $@
}


## LOCAL STUFF
if [ -f ~/.bash_profile_local ]; then
    source ~/.bash_profile_local
fi


## COMPANY SPECIFIC STUFF
if [ -f ~/.company_profiles/.bash_profile_index ]; then
    source ~/.company_profiles/.bash_profile_index
fi

# fzf
export FZF_DEFAULT_COMMAND='ag --ignore *.pyc -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# GO
export GOROOT='~/go'
export PATH=$PATH:$GOROOT/bin

# JAVA
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home'
export PATH=$JAVA_HOME/bin:$PATH


# SILVER SEARCHER
alias ack='ag --ignore *.pyc'

# TASKBOOK
function deleteMultipleTasks() {
    for ((i = $1; i <= $2; i++)); do
        tb -d $i 
    done
}

alias delete_multiple_tasks="deleteMultipleTasks $1 $2"

export PATH=/Users/whittm/Library/Android/sdk/platform-tools/adb:$PATH
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


# DEEP CD 
function deepChangeDirectories() {
    cd $1 >/dev/null;
    numOfFiles=`expr \`ls -l | wc -l\` - 1`;
    firstFile=`ls | head -n 1`;
    while [ $numOfFiles == 1 ]
    do
        dcd $firstFile || break;
    done
}

alias dcd='deepChangeDirectories';

# MAVEN
export PATH=/usr/local/Cellar/maven/3.6.1/bin:$PATH
