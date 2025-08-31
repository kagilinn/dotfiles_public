Set-PSReadLineOption -EditMode Emacs

function     Init-RCS { New-Item -Type Directory -Name RCS }
function Checkout-RCS { co -l @args }
function   Commit-RCS { ci -l @args }

function ga    { git add                                    @args }
function gb    { git branch                                 @args }
function gc    { git commit --verbose                       @args }
function gd    { git diff                                   @args }
function gdca  { git diff --cached                          @args }
function gf    { git fetch                                  @args }
function gloga { git log --graph --oneline --decorate --all @args }
function gst   { git status                                 @args }
function gsta  { git stash push                             @args }
function gstl  { git stash list                             @args }
function gstp  { git stash pop                              @args }
function gsw   { git switch                                 @args }

New-Alias 'unzip' 'Expand-Archive'
New-Alias 'zip'   'Compress-Archive'

Remove-Alias 'cd'
function cd {
    Set-Location @args
    Write-Host "`e]0;PowerShell - $((Get-Location).Path -creplace $Env:HOME,'~')`a"
}
Write-Host "`e]0;PowerShell - $((Get-Location).Path -creplace $Env:HOME,'~')`a"
