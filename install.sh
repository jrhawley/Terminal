
STDFILES=(bash_aliases vimrc tmux.conf)
for f in ${STDFILES[@]};
do
    cp $f $HOME/.$f
done

## change what it's named as, depending on OS
if [ "$(uname)" == "Darwin" ]; then
    cp bashrc $HOME/.bash_profile
    cp DefaultKeyBinding.dict $HOME/Library/KeyBindings/

    source $HOME/.bash_profile
else
    cp bashrc $HOME/.bashrc
    source $HOME/.bashrc
fi

echo "Done installation"