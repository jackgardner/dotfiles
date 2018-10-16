emulate sh -c '. ~/.profile'

export GOPATH=$HOME/go:$HOME/Development/IAT/drogo/go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH=$PATH:$HOME/go/bin:$HOME/bin
export NVM_DIR="$HOME/.nvm"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jack/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jack/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jack/google-cloud-sdk/completion.zsh.inc'; fi
