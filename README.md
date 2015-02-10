```

       ██            ██     ████ ██  ██
      ░██           ░██    ░██░ ░░  ░██
      ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
   ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
  ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
 ░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
 ░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
  ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

 ████▓▓▓▓▓▒▒▒▒░░░░░░

    figlet         > custom 3d font (by xero)
    git            > global git config and aliases
    zsh            > zshell settings, aliases, and custom prompts

 ░░░░░░▒▒▒▒▓▓▓▓▓████
```

> Your dotfiles are how your personalize your system. These are mine.

I tinkered with my dotfiles for some time now. This repository is my personal approach on structuring and organizing the configuration files. I've got inspired by several awesome dotfiles repositories and I would like to [give credit](#thanks) to them.

Basically, I'm structuring the configurations into _topics_ (or _tags_) and use [GNU stow](www.gnu.org/software/stow) (a free, portable, and lightweight symlink farm manager). This allows for having all files in one central versioned directory virtually link them into place. This make sharing these files among different users (including root) and several computers easy.

# install

You'll need `stow` for linking the files (and if you want to use the install script). Is is available for all GNU/Linux and most other Unix distributions via your packager manager. Furthermore, `git` is required for cloning this repository to your machine.

To clone the repository and execute the [install script](## script) run this:
```sh
git clone https://github.com/skaldarnar/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

## concept
By default, `stow` will create symlinks for lies in the parent directory of where you execute the command. This setup assumes the repository is located in the root of your home directory, e.g., `~/.dotfiles`, and all `stow` commands should be executed in that directory. Otherwise, you'll need to use the `-d` flag with the specific location of the repository.

## script
The `install` script will simply (try to) stow all the tags (directories whose name begins with `tag-...`) from the dotfiles repository. For now, system wide tags (directories named `sys-...`) are ignored in the script (they'll need root access in order to install). I'm planning to extend the script to ask you whether a tag should be linked or not, and to included the handling of system wide tags.

Everything located in the `init` directory will be linked first. This is used to exclude all files named `.info` and `*.zsh` from the linking. The info files may contain specific information or explanations for tags. The `*.zsh` files are automatically included in the zsh configuration - have a look at `.zshrc` in `tag-zsh` for more information.

To use the install script, simply run
```sh
./install
```

# topics, tags, and components

# bugs

I want this to work for everyone; that means you should be able to clone the repository to your local machine and it should work - without any guarantees, though! That said, I do use these as _my_ dotfiles and thus it might happen that I break something if I forgot to check for dependencies.

If you experience any problems, regardless if you start from scratch or got problems after an update, please [open an issue](https://github.com/skaldarnar/dotfiles/issues). I'd love to help you and get it fixed!


# thanks

This collection is quite a mix of [Zach Holman's dotfiles](https://github.com/holman/dotfiles) and [Xero's dotfiles](https://github.com/xero/dotfiles).

Since dotfiles are your personal configurations you need to find your own style. Nevertheless, there are a lot of great collections which can bes as inspiration or reference. A decent amount of the dotfiles in this repository came into existence that way and I want to credit some of these awesome collections in the following list:

* [Zach Holman's dotfiles](https://github.com/holman/dotfiles)
* [Ryan Bate's dotfiles](https://github.com/ryanb/dotfiles)
* [Xero's dotfiles](https://github.com/xero/dotfiles)
