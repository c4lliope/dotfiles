# Essentials
export EDITOR=vim
export CLICOLOR=1
set -o vi

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  local SUBMODULE_SYNTAX=''
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
    SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  fi
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}
export PS1='\[\e[0;33m\]✪ \[\e[0;22m\]\h\[\e[m\] \[\e[0;33m\]\W\[\e[m\] \[\e[0;34m\]$(git_prompt_info)\[\e[m\] \[\e[0;33m\]>\[\e[m\] '

## other good icons

# PATH Modifications

## For curl bundle
export SSL_CERT_FILE='/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt'

## For Homebrew
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"

## For chruby
source /usr/local/share/chruby/chruby.sh
chruby ruby
source /usr/local/share/chruby/auto.sh

## For user-defined functions
PATH="$HOME/bin:$PATH"
PATH=".git/safe/../../bin:$PATH"
export PATH

export HOMEBREW_GITHUB_API_TOKEN=108e4060d8e0bee51d3b0fd66813af87f94c1f24

# Import other user-defined functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Keep track of more commands
export HISTFILESIZE=1000000

function top-commands {
  history | awk '($2 ~ /^[[:alnum:]]+$/) { ++a[$2]; t = length($2); if (t > l) l = t; } END { for (i in a) printf("%s%" (l - length(i) + 1) "s%5.2f%%\n", i, " ", (a[i] * 100 / NR)); }' | sort -n -k2 -r | more
}

function top-commands-all {
  history | sed -e 's/ *[0-9][0-9]* *//' | sort | uniq -c | sort -rn | head -10
}
