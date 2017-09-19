# Terminal Settings

A collection of files that I use across my Mac and Linux computers to keep settings consistent and easily accessible

## Mac keyboard settings

Mac has some unconventional keyboard settings, and they can be addressed by these StackOverflow questions:

* [Link 1](https://apple.stackexchange.com/questions/12997/can-home-and-end-keys-be-mapped-when-using-terminal)
* [Link2](http://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line?answertab=votes#tab-top)

Placing `DefaultKeyBinding.dict` into `~/Library/KeyBindings/` may or may not work, depending on the OS or other settings. Note that these settings don't apply to the Terminal (or some types of text boxes), so you need to change these settings, independently. This can be done by going to Terminal > Preferences > Settings > Keyboard, and setting Home (up left arrow) to `\033OH` and End (down right arrow) to `\033OF`.

## Linux and Mac settings

Place each of the other files in your home directory as `.bash_aliases`, `.vimrc`, `.tmux.conf`, and `.bash_aliases`. Running
```
source ~/.bashrc
```
will complete the rest of the environment, and load these settings for use.

## Anaconda

To make R and Python packages manageable, I use Anaconda.
These files can be found in `Anaconda/`.
