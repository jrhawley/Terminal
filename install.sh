#!/bin/bash
source bashlib/lib/message.bash
STDFILES=(bash_aliases vimrc tmux.conf spacemacs)

OTHER_FILES=("emacs.d")
OTHER_TARGETS=("$HOME/.emacs.d/private/personal-config")

function backup_cp {
    messageInfo "$1 -> $2"
    if [ -e $2 ]; then
        today=$(date "+%Y-%m-%d.%H-%M-%S")
        backup_fn=$(basename $2.${today}.bak)
        backup_fn=${backup_fn#"."}
        backup_target="$HOME/.backups/${backup_fn}"
        if [ ! -d "$HOME/.backups" ]; then
            messageInfo "\tMaking $HOME/.backups/"
            mkdir -p $HOME/.backups
        fi
        messageInfo "\tBackup: $2 -> $backup_target"
        mv $2 $backup_target
    fi
    cp -rf $1 $2
}

# copy standard files to $HOME as hidden
for f in ${STDFILES[@]};
do
    backup_cp $f $HOME/.$f
done

# copy non-standard files to a given target
for (( i=0; i < ${#OTHER_FILES[@]}; i++ ));
do
    backup_cp ${OTHER_FILES[$i]} ${OTHER_TARGETS[$i]}
done


if [ $SHELL == "bash" ]; then
    ## change what it's named as, depending on OS
    if [ "$(uname)" == "Darwin" ]; then
        backup_cp bashrc $HOME/.bash_profile
        backup_cp DefaultKeyBinding.dict $HOME/Library/KeyBindings/DefaultKeyBinding.dict
        source $HOME/.bash_profile
    else
        backup_cp bashrc $HOME/.bashrc
        source $HOME/.bashrc
    fi
elif [ $SHELL == "zsh" ]; then
    backup_cp zshrc $HOME/.zshrc
    source $HOME/.zshrc
fi
source $HOME/.bash_aliases

messageInfo "Done installation"
