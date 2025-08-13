Set-PSReadLineOption -EditMode Emacs

function ga    { git add                                    @args }
function gf    { git fetch                                  @args }
function gloga { git log --graph --oneline --decorate --all @args }
function gst   { git status                                 @args }
function gsta  { git stash push                             @args }
function gstl  { git stash list                             @args }
function gstp  { git stash pop                              @args }
function gsw   { git switch                                 @args }

New-Alias 'unzip' 'Expand-Archive'
New-Alias 'zip'   'Compress-Archive'
