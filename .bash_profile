# .bash_profile
# testing
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi


# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));

    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}


PS1="\[\033[38;5;214m\]⛤ \[\033[0m\]\[\033[1;33m\]\u\[\033[0m\]\[\033[38;5;120m\]: \[\033[0m\]\[\033[38;5;119m\]\w\[\033[0m\] \[\033[0m\]\[\033[1;94m\]\$(git_branch)\[\033[0;95m\]\$(git_since_last_commit)\[\033[0m\]\[\033[38;5;231m\]♘ \[\033[0m\]" 

