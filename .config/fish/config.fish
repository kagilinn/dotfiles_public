if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add mv    mv -i
    abbr --add rm    rm -i
    abbr --add vim   vim -p
    abbr --add view  vim -p -R

    abbr --add rcs-init     mkdir -v RCS
    abbr --add rcs-checkout co -l
    abbr --add rcs-commit   ci -l

    abbr --add ga    git add
    abbr --add gb    git branch
    abbr --add gc    git commit --verbose
    abbr --add gd    git diff
    abbr --add gdca  git diff --cached
    abbr --add gdft  git difftool
    abbr --add gf    git fetch
    abbr --add glog  git log --oneline --decorate --graph
    abbr --add gloga git log --oneline --decorate --graph --all
    abbr --add gmt   git mergetool
    abbr --add gpsup git push --set-upstream origin '(git symbolic-ref --short HEAD)'
    abbr --add grs   git restore
    abbr --add grst  git restore --staged
    abbr --add gst   git status
    abbr --add gsta  git stash save
    abbr --add gstl  git stash list
    abbr --add gstp  git stash pop
    abbr --add gsw   git switch
    abbr --add gswc  git switch --create
end
