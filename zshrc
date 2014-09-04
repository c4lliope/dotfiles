export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/usr/local/lib/node_modules"
source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"


### From bashrc
# Alias definitions.
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# For Node Package Manager (npm)
PATH="$PATH:/usr/local/share/npm/bin"
NODE_PATH="/usr/local/lib/node_modules"

# Add OpenSSL certificates, provided by HomeBrew
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt


### From bash_profile
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
#export PS1='\[\e[0;33m\]✪ \[\e[0;22m\]\h\[\e[m\] \[\e[0;33m\]\W\[\e[m\] \[\e[0;34m\]$(git_prompt_info)\[\e[m\] \[\e[0;33m\]>\[\e[m\] '

## other good icons

# PATH Modifications

## For curl bundle
export SSL_CERT_FILE='/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt'

## For Homebrew
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"

## For user-defined functions
PATH="$HOME/bin:$PATH"
PATH=".git/safe/../../bin:$PATH"
export PATH

export HOMEBREW_GITHUB_API_TOKEN=108e4060d8e0bee51d3b0fd66813af87f94c1f24

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/dev/github/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

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
