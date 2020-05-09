# Terminal Settings

A collection of files that I use across my Mac and Linux computers to keep settings consistent and easily accessible

## Installation

```shell
git clone --recursive git@github.com:jrhawley/Terminal.git
cd Terminal/
./install.sh
```

## Mac keyboard settings

Mac has some unconventional keyboard settings, and they can be addressed by these StackOverflow questions:

* [Link 1](https://apple.stackexchange.com/questions/12997/can-home-and-end-keys-be-mapped-when-using-terminal)
* [Link 2](http://apple.stackexchange.com/questions/16135/remap-home-and-end-to-beginning-and-end-of-line?answertab=votes#tab-top)

Note that these settings don't apply to the Terminal (or some types of text boxes), so you need to change these settings, independently.
This can be done by going to Terminal > Preferences > Settings > Keyboard, and setting Home (up left arrow) to `\033OH` and End (down right arrow) to `\033OF`.

## Anaconda

To make R and Python packages manageable, I use Anaconda.
These files can be found in `Anaconda/`.

## SGE

A collection of scripts that are useful for SGE environments can be found here.
This will be updated to include SLURM and PBS/Torque engines, eventually.

## Terminal theme

| ANSI Colour  | Hex Value |
| ------------ | --------- |
| background   | #1E2127   |
| foreground   | #CDCDCD   |
| brightBlack  | #5C6370   |
| brightBlue   | #61AFEF   |
| brightCyan   | #56B6C2   |
| brightGreen  | #98C379   |
| brightPurple | #C678DD   |
| brightRed    | #E06C75   |
| brightWhite  | #FFFFFF   |
| brightYellow | #D19A66   |
| black        | #000000   |
| blue         | #61AFEF   |
| cyan         | #56B6C2   |
| green        | #98C379   |
| purple       | #C678DD   |
| red          | #E06C75   |
| white        | #ABB2BF   |
| yellow       | #D19A66   |

