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

| ANSI Colour  | Hex Value | RGB Value   |
| ------------ | --------- | ----------- |
| background   | #1E2127   | 30,33,39    |
| foreground   | #CDCDCD   | 205,205,205 |
| brightBlack  | #5C6370   |             |
| brightBlue   | #61AFEF   | 97,175,239  |
| brightCyan   | #56B6C2   | 86,182,194  |
| brightGreen  | #98C379   | 152,195,121 |
| brightPurple | #C678DD   | 198,120,221 |
| brightRed    | #E06C75   | 224,108,117 |
| brightWhite  | #FFFFFF   | 171,178,191 |
| brightYellow | #D19A66   | 209,154,102 |
| black        | #000000   |             |
| blue         | #61AFEF   | 97,175,239  |
| cyan         | #56B6C2   | 86,182,194  |
| green        | #98C379   | 152,195,121 |
| purple       | #C678DD   | 198,120,221 |
| red          | #E06C75   | 224,108,117 |
| white        | #ABB2BF   | 171,178,191 |
| yellow       | #D19A66   | 209,154,102 |

