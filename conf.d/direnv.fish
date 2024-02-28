if status --is-interactive && test "$DIRENV_DISABLE_HOOKS" != 1
    function _direnv_whitelist_match -a path
        for match in $DIRENV_WHITELIST_MATCH
            if string match -q "$DIRENV_WHITELIST_MATCH/*" "$path/"
                return 0
            end
        end
        return 1
    end

    function _direnv_prompt_event --on-event fish_prompt
        if _direnv_whitelist_match $PWD
            direnv export fish | source

            function _direnv_pwd_event --on-variable PWD
                if status --is-command-substitution
                    return
                end
                direnv export fish | source
            end
        end
    end

    function _direnv_preexec --on-event fish_preexec
        functions --erase _direnv_pwd_event
    end
end
