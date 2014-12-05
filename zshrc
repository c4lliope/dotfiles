#From oh-my-zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fwalch"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew brew-cask)

source $ZSH/oh-my-zsh.sh

# User configuration

# recommended by brew doctor
source $(brew --prefix nvm)/nvm.sh
eval "$(rbenv init - zsh --no-rehash)"

export PATH="$HOME/.bin"                # Functions in dotfiles
export PATH="$PATH:.git/safe/../../bin" # Binstubs in trusted git repos
export PATH="$PATH:/usr/local/bin"      # Homebrew-installed executables

# Rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.rbenv/shims"
export PATH="$PATH:$HOME/.rbenv/bin"

# NPM
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/opt/nvm/v0.10.31/bin"

export PATH="$PATH:/usr/bin"            # OS X system executables
export PATH="$PATH:/bin"                # Basic shell executables (e.g. ls, cat)

# Root-level system executables (sbin paths)
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"

export PATH="$PATH:/usr/local/opt/nvm/v0.10.31/bin"

export PATH

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Key bindings
bindkey -s ^f '`tree -Fif | selecta`^j'
bindkey -s ^b '`git b -a | sed "s/remotes\\/origin\\///" | selecta`^j'

# Alias definitions.
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

export HOMEBREW_GITHUB_API_TOKEN=108e4060d8e0bee51d3b0fd66813af87f94c1f24

# Keep track of more commands
export HISTFILESIZE=1000000

function top-commands {
  history | awk '($2 ~ /^[[:alnum:]]+$/) { ++a[$2]; t = length($2); if (t > l) l = t; } END { for (i in a) printf("%s%" (l - length(i) + 1) "s%5.2f%%\n", i, " ", (a[i] * 100 / NR)); }' | sort -n -k2 -r | more
}

function top-commands-all {
  history | sed -e 's/ *[0-9][0-9]* *//' | sort | uniq -c | sort -rn | head -10
}
