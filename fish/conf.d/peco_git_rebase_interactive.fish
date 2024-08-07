function peco_git_rebase_interactive
    git log --oneline \
        | peco \
        | cut -d " " -f 1 \
        | xargs -I @ git rebase -i --autosquash "@"
end
