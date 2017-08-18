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
