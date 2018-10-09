# gabo: fast access to .gitattributes boilerplates

**gabo** (short for .gitattributes boilerplates) is a shell script to help you easily access .gitattributes boilerplates from [github.com/alexkaratarakis/gitattributes](https://github.com/alexkaratarakis/gitattributes).

## Typical usage

    $ gabo dump Common CSharp VisualStudio >> .gitattributes

For additional usage instructions, run `gabo help`.

## Installation

### Installation on macOS using [Homebrew](https://brew.sh)

    brew tap jarrodldavis/tap
    brew install gibo

### Installation on other *nix platforms

Just download `gabo` and put it somewhere on your $PATH. Then:

    chmod +x /path/to/gabo   # Make gabo executable
    gabo update              # Initialise gabo

You can automate this with the following one-liner (assuming ~/bin is on your $PATH).

    curl -L https://raw.github.com/jarrodldavis/gabo/master/gabo \
        -so ~/bin/gabo && chmod +x ~/bin/gabo && gabo update

### Installation on Windows

#### git installation

You can download the whole `gabo` repo directly from GitHub:

    md "C:\Users\<Your User>\bin"
    cd /D "C:\Users\<Your User>\bin"
    git clone https://github.com/jarrodldavis/gabo.git gabo

Then add the full gabo directory (`C:\Users\<Your User>\bin\gabo`) to your system's PATH environment variable.

#### Manual installation

To manually install only the `gabo.bat` file, download it to your computer and save it to any directory that is in your PATH.

Right-click [this link](https://raw.githubusercontent.com/jarrodldavis/gabo/master/gabo.bat) and select 'Save target as...' (or 'Save link as...' depending on your browser) to save it to your computer.

A good directory to put the file is `C:\Users\<Your User>\bin` and add that directory to your system's PATH environment variable. Where ever you put it, make sure the batch file is accessible via `where gabo`.

### Installation on Docker

Just type the following command.

    $ docker run --rm jarrodldavis/gabo

## Tab completion in bash, zsh and fish

bash, zsh and fish users can enjoy the deluxe gabo experience by enabling tab completion of available boilerplate names.

Sorry, there is no tab completion support in Windows.

### bash instructions

Copy `gabo-completion.bash` into a `bash_completion.d` folder:

* `/etc/bash_completion.d`
* `/usr/local/etc/bash_completion.d`
* `~/bash_completion.d`

or copy it somewhere (e.g. ~/.gabo-completion.bash) and put the following in your .bashrc:

    source ~/.gabo-completion.bash

### zsh instructions

Copy `gabo-completion.zsh` somewhere in your `$fpath`. The convention for autoloaded functions used in completion is that they start with an underscore, so I suggest you rename it to `_gabo`.

### fish instructions

Copy `gabo.fish` to somewhere in your `$fish_complete_path`.

## Credits

gabo was written by Jarrod Davis ([@jarrodldavis](https://twitter.com/ahylianhuman))

### gibo

gibo was written by Simon Whitaker ([@s1mn](https://twitter.com/s1mn))

Thanks to [yevgenko](https://github.com/yevgenko) for adding the curl-based installation instructions.

Thanks to [kodybrown](https://github.com/kodybrown) for adding the gibo.bat batch file for Windows.
