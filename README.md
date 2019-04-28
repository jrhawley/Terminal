# Terminal Settings

A collection of files that I use across my Mac and Linux computers to keep settings consistent and easily accessible

## Installation

```shell
sh install.sh
```

## Mac keyboard settings

Mac has some unconventional keyboard settings, and they can be addressed by these StackOverflow questions:

* [Link 1](https://apple.stackexchange.com/questions/12997/can-home-and-end-keys-be-mapped-when-using-terminal)
* [Link2](http://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line?answertab=votes#tab-top)

Note that these settings don't apply to the Terminal (or some types of text boxes), so you need to change these settings, independently.
This can be done by going to Terminal > Preferences > Settings > Keyboard, and setting Home (up left arrow) to `\033OH` and End (down right arrow) to `\033OF`.

## Ubuntu Bash on Windows

A particular colour RGB scheme to customize this terminal emulator are as follows:

* 30, 30, 30
* 114, 159, 207
* 0, 128, 0
* 0, 128, 128
* 128, 0, 0
* 128, 0, 128
* 128, 128, 0
* 192, 192, 192
* 128, 128, 128
* 52, 101, 164
* 0, 255, 0
* 0, 255, 255
* 255, 0, 0
* 255, 0, 255
* 255, 255, 0
* 255, 255, 255

## Anaconda

To make R and Python packages manageable, I use Anaconda.
These files can be found in `Anaconda/`.

## SGE

A collection of scripts that are useful for SGE environments can be found here.
This will be updated to include SLURM and PBS/Torque engines, eventually.

