alias reload='source ~/.bashrc'

# Basic structure commands
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias la='ls -A'
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias c='clear'                             # c:            Clear terminal display

# Navigation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~:            Go Home

alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)


# Network
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections

# Programs
alias gst='git status'

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
}

function less-tsv {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: less-tsv TSV"
    else
        if [ -f $1 ]; then
            column -s, -t < $1 | less -#2 -N -S
        else
            echo "$1 - file does not exist"
        fi
    fi
}