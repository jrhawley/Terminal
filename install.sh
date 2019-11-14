#!/bin/bash
source bashlib/lib/message.bash
STDFILES=(bash_aliases vimrc tmux.conf spacemacs)

OTHER_FILES=("emacs.d")
OTHER_TARGETS=("$HOME/.emacs.d/private/personal-config")

function backup_cp {
    today=$(date "+%Y-%m-%d.%H-%M-%S")
    if [ -e $2 ]; then
        messageInfo "\tBackup: $2 -> $2.${today}.bak"
        mv $2 $2.${today}.bak
    fi
    cp -rf $1 $2
}

# copy standard files to $HOME as hidden
for f in ${STDFILES[@]};
do
    messageInfo "$f -> $HOME/.$f"
    backup_cp $f $HOME/.$f
done

# copy non-standard files to a given target
for (( i=0; i < ${#OTHER_FILES[@]}; i++ ));
do
    messageInfo "${OTHER_FILES[$i]} -> ${OTHER_TARGETS[$i]}"
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
