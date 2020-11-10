alias reload="source ~/.bashrc"

# Basic structure commands
alias cp="cp -iv"                           # Preferred "cp" implementation
alias mv="mv -iv"                           # Preferred "mv" implementation
alias mkdir="mkdir -pv"                     # Preferred "mkdir" implementation
alias ll="ls -FGlAhp"                       # Preferred "ls" implementation
alias la="ls -A"
alias less="less -FSRXc"                    # Preferred "less" implementation
alias lr="ls -R | grep ":$" | sed -e "\""s/:$//"\"" -e "\""s/[^-][^\/]*\//--/g"\"" -e "\""s/^/   /"\"" -e "\""s/-/|/"\"" | less"
alias c="clear"                             # c:     Clear terminal display

# Navigation
alias cd..="cd ../"              # Go back 1 directory level (for fast typers)
alias ..="cd ../"                # Go back 1 directory level
alias ...="cd ../../"            # Go back 2 directory levels
alias .3="cd ../../../"          # Go back 3 directory levels
alias .4="cd ../../../../"       # Go back 4 directory levels
alias .5="cd ../../../../../"    # Go back 5 directory levels
alias .6="cd ../../../../../../" # Go back 6 directory levels
alias ~="cd ~"                   # Go Home

# Slurm
alias sst="squeue"
alias sr="salloc -c 1 -t 10:00:00 --mem=6G"
alias srM="salloc -c 1 -t 10:00:00 --mem=16G"
alias srb="salloc -c 1 -t 10:00:00 -p build"
alias srd="salloc -c 1 -t 10:00:00 -p download"
alias mvsnk="for f in $(rg -l "1 of 1 steps (100%) done" slurm-*.out); do mv $f Logs/; done"

# Anaconda
alias sce="conda env export --no-builds"

# Functions
# function for adding to PATH
pathmunge () {
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
};
