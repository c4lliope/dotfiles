# Fix SSH
unset SSH_AUTH_SOCK

# recommended by brew doctor
source $(brew --prefix nvm)/nvm.sh
eval "$(rbenv init - zsh --no-rehash)"

export PATH=""
export PATH="$PATH:.git/safe/../../bin" # Binstubs in trusted git repos
export PATH="$PATH:$HOME/.bin"          # Functions in dotfiles
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

source ~/.aliases
source ~/.colors.zsh
source ~/.docker.zsh
source ~/.history.zsh
source ~/.prompt.zsh

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Don't use Spring for pre-loading the Rails environment
export DISABLE_SPRING=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Key bindings
bindkey -e
bindkey -s ^f '`(git ls-files -o -X .gitignore; git ls-files) | selecta`^j'
bindkey -s ^p '$EDITOR -c "CtrlP"^j'
bindkey -s ^b '`git b -a | sed "s/remotes\\/origin\\///" | selecta`^j'

# Edit the current line in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# [Backspace] - delete backward
bindkey '^?' backward-delete-char
if [[ "${terminfo[kdch1]}" != "" ]]; then
  # [Delete] - delete forward
  bindkey "${terminfo[kdch1]}" delete-char
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Always start inside tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

export HOMEBREW_GITHUB_API_TOKEN=108e4060d8e0bee51d3b0fd66813af87f94c1f24

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
