set fish_greeting
if [ -f "$HOME/.cargo/env" ]
    bass source "$HOME/.cargo/env"
end
alias ls="exa"
alias g="git"
alias kc="kubectl"
alias bazel="bazelisk"
alias vim="nvim"
export BROWSER=/home/jack/.local/bin/firefox

function drogo
    cd ~/go/src/github.com/lakahq/drogo
end

set -x CGO_CFLAGS_ALLOW -Xpreprocessor
set -u GOROOT
set -x GOPATH $HOME/go
set -x EDITOR nvim
set -x BAT_THEME TwoDark
set -x GO111MODULE on
set -x SLACK_CHANNEL_OVERRIDE @jack
if type -q ip
    set -x DISPLAY (ip route | awk '{ print $3; exit }'):0
end
set -x LIBGL_ALWAYS_INDIRECT 1
set -x GDK_SCALE 1
set -x PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:$GOPATH/bin:$HOME/go/bin:$HOME/bin:/usr/local/opt/gnu-tar/libexec/gnubin:$HOME/.cargo/bin:/opt/homebrew/opt/python/libexec/bin

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]
    env SHELL=fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if [ -f /opt/homebrew/bin/brew ]
    env SHELL=fish /opt/homebrew/bin/brew shellenv | source
end

if [ -f /Users/jack/Development/google-cloud-sdk/path.fish.inc ]
    . /Users/jack/Development/google-cloud-sdk/path.fish.inc
end

bass source ~/.nvm/nvm.sh --no-use
if [ -f '.nvmrc' ]
    nvm use --silent
else
    nvm use --silent default
end
