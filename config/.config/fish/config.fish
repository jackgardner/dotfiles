source $HOME/.cargo/env
alias ls="exa"

if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

function drogo
  cd ~/go/src/github.com/lakahq/drogo
end

function mysql
  mycli -u root -h s3 -p root --auto-vertical-output -t
end

function mysql_stg
  set -lx PASSWORD (lpass show k8s-stg --password)
  set -lx USER (lpass show k8s-stg --user)
  set -lx HOST (lpass show k8s-stg --field=host)
  mycli -u $USER -h $HOST --pass $PASSWORD --auto-vertical-output -t --ssl-ca ~/go/src/github.com/lakahq/drogo/certificates/rds-ca-2019-root.pem
end

function mysql_prd
  set -lx PASSWORD (lpass show k8s-prd --password)
  set -lx USER (lpass show k8s-prd --user)
  set -lx HOST (lpass show k8s-prd --field=host)
  mycli -u $USER -h $HOST --pass $PASSWORD --auto-vertical-output -t --ssl-ca ~/go/src/github.com/lakahq/drogo/certificates/rds-combined-ca-bundle.pem
end

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

set -x CGO_CFLAGS_ALLOW -Xpreprocessor
set -u GOROOT 
set -x GOPATH $HOME/go # :$HOME/Development/IAT/drogo/bazel-drogo/external:$HOME/go
set -x PATH   /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:$HOME/go/bin:$HOME/bin:/usr/local/opt/gnu-tar/libexec/gnubin:$HOME/.cargo/bin
set -x EDITOR nvim
set -x BAT_THEME TwoDark 

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /Users/jack/.nvm/versions/node/v8.12.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jack/Development/google-cloud-sdk/path.fish.inc' ]; . '/Users/jack/Development/google-cloud-sdk/path.fish.inc'; end
