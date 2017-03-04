umask 0022

add_to_path ~/.dwm/bin
add_to_path ~/bin
add_to_path ~/Scripts
add_to_path ~/.local/bin
add_to_path ~/.gem/ruby/2.3.0/bin
add_to_path ~/npm/bin

set -x EDITOR vim
set -x TODOTXT_CFG_FILE $HOME/.todo/todo.cfg

# Tell virtualenv not to modify my shell prompt
# (my prompt already has venv support built in).
set -x VIRTUAL_ENV_DISABLE_PROMPT true

# Virtualfish
# TODO: Eval this only once, and not on re-sourcing this file?
eval (python -m virtualfish projects)
set -x PROJECT_HOME ~/Projects

# These speed up installing global requirements in new virtualenvs.
set -x PIP_USE_WHEEL true
set -x PIP_WHEEL_DIR ~/.pip/wheels
set -x PIP_FIND_LINKS ~/.pip/wheels
set -x PIP_DOWNLOAD_CACHE ~/.pip/cache

source ~/.config/fish/abbreviations.fish

alias standup=~/Gists/standup/standup.py

eval (direnv hook fish)
