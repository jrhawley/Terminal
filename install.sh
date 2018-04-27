
STDFILES=(bash_aliases vimrc tmux.conf)
for f in ${STDFILES[@]};
do
    ln -s $HOME/.$f $f
done

## change what it's named as, depending on OS
if [ "$(uname)" == "Darwin" ]; then
    # cp bashrc $HOME/.bash_profile
    ln -s $HOME/.bash_profile bashrc
    cp DefaultKeyBinding.dict $HOME/Library/KeyBindings/

    source $HOME/.bash_profile
else
    # cp bashrc $HOME/.bashrc
    ln -s $HOME/.bashrc bashrc
    source $HOME/.bashrc
fi

echo "Done installation"