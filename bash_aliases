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
alias mvsnk='for f in $(grep -l "1 of 1 steps (100%) done" slurm-*.out); do mv $f Logs/; done'

# Git
alias gst='git status'
alias glg='git log --all --graph'
alias gbl='git branch --list'

# Anaconda
alias sce='conda env export --no-builds'

# Snakemake
alias snkplt='snakemake --rulegraph | graph-easy --as boxart'

# SSHFS
alias mount-mordor='sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/People/hawleyj/ $HOME/Mordor; sshfs hawleyj@mordor:/mnt/work1/users/lupiengroup/Projects/RawData/ $HOME/MordorData;'
alias umount-mordor='umount -f $HOME/Mordor; umount -f $HOME/MordorData;'

# Functions
forensics () {
    qacct -j $1 | grep -B 9 -P "exit_status\\s+[1-9]";
};

lastjob () {
    qacct -o `whoami` -j | tail -n 45 | grep "jobnumber" | awk '{print $2;}';
};

pycd () {
    pushd `python -c "import os.path, $1; print(os.path.dirname($1.__file__))"`;
};

qsha () {
    find -type f -exec shasum '{}' \;
};

# pathmunge function for adding to PATH
pathmunge () {
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
};
