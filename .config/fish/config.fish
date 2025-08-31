if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add mv    mv -i
    abbr --add rm    rm -i
    abbr --add vim   vim -p
    abbr --add view  vim -p -R
    abbr --add ga    git add
    abbr --add gb    git branch
    abbr --add gc    git commit --verbose
    abbr --add gd    git diff
    abbr --add gdca  git diff --cached
    abbr --add gdft  git difftool
    abbr --add gf    git fetch
    abbr --add gloga git log --oneline --decorate --graph --all
    abbr --add gmt   git mergetool
    abbr --add grs   git restore
    abbr --add grst  git restore --staged
    abbr --add gst   git status
    abbr --add gsta  git stash save
    abbr --add gstl  git stash list
    abbr --add gstp  git stash pop
    abbr --add gsw   git switch
    abbr --add gswc  git switch --create
end
