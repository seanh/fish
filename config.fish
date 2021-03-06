umask 0022

add_to_path ~/Projects/dwm/bin
add_to_path ~/bin
add_to_path ~/Scripts
add_to_path ~/.local/bin

if type -q vim
  set -x EDITOR vim
end

set -x TODOTXT_CFG_FILE $HOME/.todo/todo.cfg

# Tell virtualenv not to modify my shell prompt (my prompt already has venv support built in).
set -x VIRTUAL_ENV_DISABLE_PROMPT true

# Virtualfish
set -x PROJECT_HOME ~/Projects

source ~/.config/fish/abbreviations.fish
source ~/.config/fish/aliases.fish

if type -q direnv
    eval (direnv hook fish)
end

if status is-interactive
    switch $TERM
        # Fix DEL key in st
        case 'st*'
            set -gx is_simple_terminal 1
        case "linux"
            set -ex is_simple_terminal
            function fish_prompt
                fish_fallback_prompt
            end
    end

    if set -q is_simple_terminal
        tput smkx ^/dev/null
        function fish_enable_keypad_transmit --on-event fish_postexec
            tput smkx ^/dev/null
        end

        function fish_disable_keypad_transmit --on-event fish_preexec
            tput rmkx ^/dev/null
        end
    end
end

# pyenv
add_to_path ~/.pyenv/bin
if command -v pyenv > /dev/null 2<&1
  set -x PYENV_ROOT $HOME/.pyenv
  status --is-interactive; and pyenv init - | source
  status --is-interactive; and pyenv virtualenv-init - | source
end

set -x RIPGREP_CONFIG_PATH ~/.ripgrep/rc

if command -v pipx > /dev/null 2<&1
  register-python-argcomplete --shell fish pipx | .
end
