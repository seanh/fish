umask 0022

add_to_path ~/.dwm/bin
add_to_path ~/bin
add_to_path ~/Scripts
add_to_path ~/.local/bin
add_to_path ~/.gem/ruby/2.3.0/bin
add_to_path ~/npm/bin

if type -q vim
  set -x EDITOR vim
end

set -x TODOTXT_CFG_FILE $HOME/.todo/todo.cfg

# Tell virtualenv not to modify my shell prompt
# (my prompt already has venv support built in).
set -x VIRTUAL_ENV_DISABLE_PROMPT true

# Virtualfish
if python -c "import virtualfish" 2> /dev/null
    eval (python -m virtualfish projects)
end
set -x PROJECT_HOME ~/Projects

source ~/.config/fish/abbreviations.fish

alias standup=~/Gists/standup/standup.py

if type -q direnv
    eval (direnv hook fish)
end
