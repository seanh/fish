function fish_title
    if test -n "$FISH_TITLE"
        echo $FISH_TITLE
    else
        echo (status current-command)
    end
end
