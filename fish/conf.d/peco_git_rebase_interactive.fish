function peco_git_rebase_interactive
    set -l hash (git log --oneline peco cut -d " " -f 1)
    if test $hash
        git rebase -i "$hash"
    end
end
