# WezTerm configuration

## Keybindings

- ⌥⌘R – Prompt to rename the active tab
- ⌥⌘, / ⌥⌘. – Move the current tab left / right
- ⌥⌘\\ / ⌥⌘- – Split pane horizontally / vertically
- ⌥⌘← → ↑ ↓ – Resize the active pane
- ⌥⌘H / J / K / L – Focus pane left / down / up / right
- ⌥⌘W – Show workspace launcher

## Restore

Symlink the configuration so changes in this repository are used by WezTerm:

```sh
mkdir -p ~/.config/wezterm
if [ -e ~/.config/wezterm/wezterm.lua ] && [ ! -L ~/.config/wezterm/wezterm.lua ]; then
  mv ~/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua.backup-$(date +%Y%m%d-%H%M%S)
fi
ln -sfn "$PWD/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
```

Run these commands from the dotfiles repository root. An existing regular config
file is backed up before linking. The configuration uses SauceCodePro Nerd Font.
