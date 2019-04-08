source $HOME/.cargo/env

function drogo
  cd ~/Development/IAT/drogo
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


set -x GOPATH $HOME/Development/IAT/drogo/go #$HOME/go
set -x PATH   /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

set -x PATH   $PATH:$GOPATH/bin:$HOME/go/bin:$HOME/bin
set -x PATH   "/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
