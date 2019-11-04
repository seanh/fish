function fish_user_key_bindings
    if functions -n | grep fzf_key_bindings > /dev/null
        fzf_key_bindings
    end
end
