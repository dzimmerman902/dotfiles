# Interactive shell settings.
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

# Keep personal commands available without duplicating PATH entries.
typeset -U path PATH
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" $path)
export PATH

ZSH_THEME="avit"
plugins=(git brew)
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7
[[ -r "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

if [[ -n "$SSH_CONNECTION" ]] || ! command -v nvim >/dev/null 2>&1; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi
export VISUAL="$EDITOR"

# Trust the work certificate when it is installed on this computer.
if [[ -r "$HOME/LT_CLI_SSL.pem" ]]; then
  export NODE_EXTRA_CA_CERTS="$HOME/LT_CLI_SSL.pem"
fi

# Load NVM once, independently of Oh My Zsh plugins.
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

[[ -r "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# (N) allows the functions directory to be empty without a glob error.
for _zsh_function_file in "${XDG_CONFIG_HOME:-$HOME/.config}"/zsh/functions/*.zsh(N); do
  source "$_zsh_function_file"
done
unset _zsh_function_file
