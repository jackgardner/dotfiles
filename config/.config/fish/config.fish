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
set -x ENCORE_INSTALL ~/.encore
set -x PATH $ENCORE_INSTALL/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:$GOPATH/bin:$HOME/go/bin:$HOME/bin:/usr/local/opt/gnu-tar/libexec/gnubin:$HOME/.cargo/bin:/mnt/c/Program Files/Docker/Docker/resources/bin:$HOME/istio-1.9.4/bin:/opt/homebrew/opt/python/libexec/bin

set --universal nvm_default_version latest

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]
    env SHELL=fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if [ -f /opt/homebrew/bin/brew ]
    env SHELL=fish /opt/homebrew/bin/brew shellenv | source
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jack/Development/google-cloud-sdk/path.fish.inc' ]
    . '/Users/jack/Development/google-cloud-sdk/path.fish.inc'
end
