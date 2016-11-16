# @(#)cshrc
umask 077

######################################################################
# PLATFORM DEPENDANT SETUP

switch (`uname -s`)
case SunOS:
	setenv LD_LIBRARY_PATH /usr/local/lib:/lib:/usr/lib:/usr/X/lib
	set path = ( /usr/local/bin /usr/bin /bin /usr/openwin/bin /usr/ccs/bin /usr/ucb /usr/dt/bin /etc /usr/etc /usr/sbin /sbin . $path )
	breaksw
case IRIX*:
	setenv LD_LIBRARY_PATH /usr/local/lib:/usr/local/lib32:/usr/lib:/usr/lib/32
	set path = ( /usr/local/bin /usr/bin /bin /usr/bin/X11 /usr/bsd /etc /usr/etc /usr/sbin /sbin . $path )
	breaksw
case Linux:
	setenv LD_LIBRARY_PATH /usr/local/lib:/lib:/usr/lib:/usr/X11R6/lib
	set path = ( /usr/local/bin /usr/bin /bin /usr/X11R6/bin /etc /usr/etc /usr/sbin /sbin . $path )
	breaksw
default:
	set path = ( /usr/local/bin /usr/bin /usr/sbin /bin /sbin . $path )
	breaksw
endsw

######################################################################
# ENVIRONMENT SETTINGS

if ($?prompt) then
	set		notify
	set		filec
	set		fignore=(.o)
	set		history=256
	set		autologout=120
	alias	h	'history'
	alias	j	'jobs -l'
	alias	pwd	'echo $cwd'
	alias	ls	'ls -F'
	# make the prompt something useful
	set     postprompt="[`hostname`]% "
	set     pcwd="$cwd:h"
	set     prompt="$pcwd:t/$cwd:t $postprompt"
	alias   cd 'cd \!* ; set pcwd="$cwd:h" ; set prompt="$pcwd:t/$cwd:t $postprompt"'

	# personal aliases
	alias	rm		'rm -iv'
	alias	mv		'mv -iv'
	alias	cp		'cp -iv'
	alias 	ll		'ls -FGlAhp'					# Preferred 'ls' implementation
	alias 	la  	'ls -A'
	alias 	l		'ls -CF'
	alias 	lr		'ls -R | grep ":$" | sed -e '\''s/: $//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
	alias 	mkdir	'mkdir -pv'                     # Preferred 'mkdir' implementation
	alias 	less	'less -FSRXc'                   # Preferred 'less' implementation
	alias 	reload	'source ~/.cshrc'
	alias 	cd..	'cd ../'                        # Go back 1 directory level (for fast typers)
	alias 	..		'cd ../'                        # Go back 1 directory level
	alias 	...		'cd ../../'                     # Go back 2 directory levels
	alias 	.3		'cd ../../../'                  # Go back 3 directory levels
	alias 	.4		'cd ../../../../'               # Go back 4 directory levels
	alias 	.5		'cd ../../../../../'            # Go back 5 directory levels
	alias 	.6		'cd ../../../../../../'         # Go back 6 directory levels
	alias 	vscode	'~/bin/VSCode-linux-x64/code'   # run Visual Studio Code
	alias 	alert	'notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

endif

######################################################################
# PERSONNAL SETTINGS
#
# personalize your environment here

switch (`uname -s`)
case SunOS:		# for SUN machines

	breaksw
case IRIX*:		# for SGI machines

	breaksw
case Linux:		# for Linux machines

	breaksw
endsw