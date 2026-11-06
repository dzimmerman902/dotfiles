# Zsh configuration

The repository's `.zshrc` and `.zprofile` are symlinked into your home directory.
`~/.config/zsh` points to this directory (or `$XDG_CONFIG_HOME/zsh` when set).
`.zshrc` sources `functions/*.zsh` from that location.

- `.zshrc`: interactive settings, Avit theme, Git/Homebrew plugins, NVM, editor,
  optional work certificate, personal PATH entries and shell functions.
- `.zprofile`: login-shell setup for Homebrew, Python 3.13 and SnowSQL when installed.
- `functions/aws-sso.zsh`: logs in and updates `AWS_PROFILE` only after success.

New shell functions go in `functions/` with a `.zsh` extension. Standalone
commands go in the repository's `scripts/` directory. Keep credentials and the
certificate itself outside this repository.

## Install

Run from the repository root after backing up existing files or directories
at the three destination paths:

```sh
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
ln -s "$PWD/.zshrc" "$HOME/.zshrc"
ln -s "$PWD/.zprofile" "$HOME/.zprofile"
ln -s "$PWD/zsh" "${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
```

The old `~/.zsh_functions` directory is replaced by the functions directory above.
Open a new terminal to load the configuration. Oh My Zsh, NVM and fonts are
separate installations; they are not copied into this repository.
