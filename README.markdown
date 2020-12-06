My Fish Shell Config
====================

My [fish shell](https://fishshell.com/) configuration files.

Installation
------------

### Ubuntu 20.04

```terminal
sudo add-apt-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt install --yes fish git
git clone https://github.com/seanh/fish.git ~/.config/fish
```

**Tip**: Instead of changing your login shell to fish (with `chsh`), set `fish`
as a custom command for your terminal emulator (or one profile of your terminal
emulator) to run instead of your login shell. This is a less invasive change,
and if something goes wrong with fish or your fish config then until you fix it
you can just run a different terminal emulator or profile and get bash.
