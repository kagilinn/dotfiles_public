Set-PSReadLineOption -EditMode Emacs

function     Init-RCS { New-Item -Type Directory -Name RCS }
function Checkout-RCS { co -l @args }
function   Commit-RCS { ci -l @args }

function ga    { git add                                    @args }
function gb    { git branch                                 @args }
# gc だと Get-Content の標準エイリアスと被る.
function gitc  { git commit --verbose                       @args }
function gd    { git diff                                   @args }
function gdca  { git diff --cached                          @args }
function gdft  { git difftool                               @args }
function gf    { git fetch                                  @args }
function glog  { git log --graph --oneline --decorate       @args }
function gloga { git log --graph --oneline --decorate --all @args }
function gmt   { git mergetool                              @args }
function gpsup {
    [string]$branch = git symbolic-ref --short HEAD
    git push --set-upstream origin $branch @args
}
function grs   { git restore                                @args }
function grst  { git restore --staged                       @args }
function gst   { git status                                 @args }
function gsta  { git stash push                             @args }
function gstl  { git stash list                             @args }
function gstp  { git stash pop                              @args }
function gsw   { git switch                                 @args }
function gswc  { git switch --create                        @args }

New-Alias 'unzip' 'Expand-Archive'
New-Alias 'zip'   'Compress-Archive'

function prompt {
    [string]$home_ptn = "^$Env:HOME" -creplace '\\','\\'
    [string]$cwd = $ExecutionContext.SessionState.Path.CurrentLocation -creplace $home_ptn,'~'
    [string]$cwd_last = $cwd -creplace '^.*/',''
    [string]$git_prompt = ''
    if (Get-Command -ErrorAction SilentlyContinue git) {
    if (git rev-parse --is-inside-work-tree) {
        [string]$dotgit = $(git rev-parse --git-dir)
        [string]$branch = git rev-parse --abbrev-ref HEAD
        [string]$unstaged  = ''
        [string]$staged    = ''
        [string]$untracked = ''
        foreach ($l in $(git status --porcelain)) {
            if ($l.Substring(1, 1) -ceq  'M') { $unstaged  = '*' }
            if ($l.Substring(0, 1) -ceq 'M' ) { $staged    = '+' }
            if ($l.Substring(0, 2) -ceq '??') { $untracked = '%' }
        }
        [string]$stashed = $(git stash list) ? '$' : ''
        [string]$status = "$unstaged$staged$stashed$untracked"
        if ($status -cne '') { $status = " $status" }

        [string]$merging = ''
        if (Test-Path "$dotgit/MERGE_HEAD") { $merging = '|MERGING' }

        [string]$conflict = ''
        if ($(git ls-files --unmerged)) { $conflict = '|CONFLICT' }

        $git_prompt = " ($branch$status$merging$conflict)"
    }}
    "`e]0;PowerShell - $cwd_last`aPS $cwd$git_prompt$('>' * ($nestedPromptLevel + 1)) ";
}
