
STDFILES=(bash_aliases vimrc tmux.conf zshrc)
for f in ${STDFILES[@]};
do
    if [ -e $HOME/.$f ]; then
        mv $HOME/.$f $HOME/.$f.bak
    fi
    ln $f $HOME/.$f
done

## change what it's named as, depending on OS
if [ "$(uname)" == "Darwin" ]; then
    if [ -e $HOME/.bash_profile ]; then
        mv $HOME/.bash_profile $HOME/.bash_profile.bak
    fi
    ln bashrc $HOME/.bash_profile
    ln $HOME/.bash_profile $HOME/.bashrc
    cp DefaultKeyBinding.dict $HOME/Library/KeyBindings/

    source $HOME/.bash_profile
else
    if [ -e $HOME/.bashrc ]; then
        mv $HOME/.bashrc $HOME/.bashrc.bak
    fi
    ln bashrc $HOME/.bashrc
    source $HOME/.bashrc
fi

echo "Done installation"
