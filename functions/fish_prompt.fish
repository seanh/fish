function fish_prompt -d "Write out the prompt"
    # Save the exit status of the last command in a variable
    # (otherwise commands in this function would overwrite it).
    set -l last_status $status

    # Print the exit status of the last command if non-zero.
    if test $last_status -ne 0
        set_color --bold red
        printf "%d! " $last_status
        set_color normal
    end

    # Print the name of the active Python virtual environment if any.
    if set -q VIRTUAL_ENV
        set_color blue
        printf "%s " (basename $VIRTUAL_ENV)
        set_color normal
    end

    # Print the name of the current git branch, if in a git repo.
    set -g __fish_git_prompt_color green
    set -g __fish_git_prompt_color_prefix green
    set -g __fish_git_prompt_color_suffix green
    set -g __fish_git_prompt_color_bare green
    set -g __fish_git_prompt_color_merging green
    set -g __fish_git_prompt_color_branch green
    set -g __fish_git_prompt_color_flags green
    set -g __fish_git_prompt_color_upstream green
    set -g __fish_git_prompt_showdirtystate yes  # Shows + and * for staged and unstaged changes.
    set -g __fish_git_prompt_showuntrackedfiles yes  # Shows % if there are untracked files.
    set -g __fish_git_prompt_shorten_branch_len '10'
    __fish_git_prompt "%s "
    set_color normal

    # Print the path.
    printf "%s> " (prompt_pwd)
end
