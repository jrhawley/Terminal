alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.bash_profile'

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias la='ls -A'
alias less='less -FSRXc'                    # Preferred 'less' implementation

alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias f='open -a Finder ./'                 # f             Opens current directory in MacOS Finder
alias which='type -all'                     # which         Find executables
alias show_options='shopt'                  # Show_options  display bash options settings
alias fix_stty='stty sane'                  # fix_stty      Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic           Make tab-completion case-insensitive

alias qfind="find . -name "                 # qfind         Quickly search for file
alias gst='git status'                      # gst           Shortcut for git status