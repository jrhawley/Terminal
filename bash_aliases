alias reload='source ~/.bashrc'

# Basic structure commands
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias la='ls -A'
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias qfind="find . -name "                 # qfind: Quickly search for file
alias c='clear'                             # c:     Clear terminal display
alias duh='du -h --max-depth 1'             # Size on disk of current directory

# Navigation
alias cd..='cd ../'              # Go back 1 directory level (for fast typers)
alias ..='cd ../'                # Go back 1 directory level
alias ...='cd ../../'            # Go back 2 directory levels
alias .3='cd ../../../'          # Go back 3 directory levels
alias .4='cd ../../../../'       # Go back 4 directory levels
alias .5='cd ../../../../../'    # Go back 5 directory levels
alias .6='cd ../../../../../../' # Go back 6 directory levels
alias ~="cd ~"                   # Go Home

# SGE
alias qrL='qlogin -q lupiengroup -l h_vmem=5G -l mem_requested=5G'
alias qrLM='qlogin -q lupiengroup -l h_vmem=15G -l mem_requested=15G'
alias qrl='qlogin -q light.q'
alias qrd='qlogin -q download.q'
alias qsL='qstat -q lupiengroup -u "*"'
alias qsl='qstat -q light.q -u "*"'
alias qsd='qstat -q download.q -u "*"'
alias qsH='qstat -q highmem.q -u "*"'
alias qst='qstat'

# Git
alias gst='git status'
alias glg='git log --all --graph'
alias gbl='git branch --list'

# Snakemake
alias snkplt='snakemake --rulegraph | graph-easy --as boxart'

# Functions
function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract ."
    else
        if [ -f $1 ]; then
            case $1 in
                *.tar.bz2) tar xvjf ../$1 ;;
                *.tar.gz) tar xvzf ../$1 ;;
                *.tar.xz) tar xvJf ../$1 ;;
                *.lzma) unlzma ../$1 ;;
                *.bz2) bunzip2 ../$1 ;;
                *.rar) unrar x -ad ../$1 ;;
                *.gz) gunzip ../$1 ;;
                *.tar) tar xvf ../$1 ;;
                *.tbz2) tar xvjf ../$1 ;;
                *.tgz) tar xvzf ../$1 ;;
                *.zip) unzip ../$1 ;;
                *.Z) uncompress ../$1 ;;
                *.7z) 7z x ../$1 ;;
                *.xz) unxz ../$1 ;;
                *.exe) cabextract ../$1 ;;
                *) echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
};

function forensics {
    qacct -j $1 | grep -B 9 -P "exit_status\\s+[1-9]";
};

function lastjob {
    qacct -o `whoami` -j | tail -n 45 | grep "jobnumber" | awk '{print $2;}';
};

function pycd {
    pushd `python -c "import os.path, $1; print(os.path.dirname($1.__file__))"`;
};


# Cluster
function scpm {
    scp hawleyj@opennet-33-233.uhnres.utoronto.ca:$1 $2
};

alias mount-mordor="sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/People/hawleyj/ $HOME/Mordor;  sshfs hawleyj@mordor:/mnt/work1/users/home2/hawleyj/ $HOME/Cluster;  sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/People $HOME/Lupiengroup"
alias umount-mordor="umount -f $HOME/Mordor;  umount -f $HOME/Cluster;  umount -f $HOME/Lupiengroup"
