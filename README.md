# Terminal Settings

A collection of files that I use across my Mac and Linux computers to keep settings consistent and easily accessible

## Mac keyboard settings
Mac has some unconventional keyboard settings, and they can be addressed by these StackOverflow questions [Link 1](https://apple.stackexchange.com/questions/12997/can-home-and-end-keys-be-mapped-when-using-terminal) [Link2](http://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line?answertab=votes#tab-top). Making `~/Library/KeyBindings/DefaultKeyBinding.dict` may or may not work, depending on the OS or other settings.

The above settings don't apply to the Terminal (or some types of text boxes) so you need to set this independently. This can be done by going to Terminal > Preferences > Settings > Keyboard, and setting Home (up left arrow) to \033OH and End (down right arrow) to \033OF

## Linux and Mac settings
Copying each of the other files and placing them in your home directory as `.bash_aliases`, `.vimrc`, `.tmux.conf`, and `.bash_aliases`, followed by running
```
source ~/.bashrc
```
will complete the rest of the environment
