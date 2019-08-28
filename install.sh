#!/bin/bash
STDFILES=(bash_aliases vimrc tmux.conf)

function backup_cp {
    today=$(date "+%Y-%m-%d")
    if [ -e $2 ]; then
        mv $2 $2.${today}.bak
    fi
    cp $1 $2
}

for f in ${STDFILES[@]};
do
    backup_cp $f $HOME/.$f
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

echo "Done installation"
