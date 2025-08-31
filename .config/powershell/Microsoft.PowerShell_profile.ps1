Set-PSReadLineOption -EditMode Emacs

function     Init-RCS { New-Item -Type Directory -Name RCS }
function Checkout-RCS { co -l @args }
function   Commit-RCS { ci -l @args }

function ga    { git add                                    @args }
function gb    { git branch                                 @args }
function gc    { git commit --verbose                       @args }
function gd    { git diff                                   @args }
function gdca  { git diff --cached                          @args }
function gdft  { git difftool @args }
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

Remove-Alias 'cd'
function cd {
    Set-Location @args
    Write-Host "`e]0;PowerShell - $((Get-Location).Path -creplace $Env:HOME,'~')`a"
}
Write-Host "`e]0;PowerShell - $((Get-Location).Path -creplace $Env:HOME,'~')`a"
