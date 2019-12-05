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

# Slurm
alias sst='squeue'
alias sr='salloc -c 1 -t 10:00:00 --mem=6G'
alias srM='salloc -c 1 -t 10:00:00 --mem=16G'

# Git
alias gst='git status'
alias glg='git log --all --graph'
alias gbl='git branch --list'


# Anaconda
alias sce='conda env export --no-builds'

# Snakemake
alias snkplt='snakemake --rulegraph | graph-easy --as boxart'
alias mvsnk='mv snakejob.* Logs/'

# SSHFS
alias mount-mordor='sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/People/hawleyj/ $HOME/Mordor; sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/Projects/RawData/ $HOME/MordorData;'
alias umount-mordor='umount -f $HOME/Mordor; umount -f $HOME/MordorData;'

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

function qsha {
    find -type f -exec shasum '{}' \;
};
