# Personal commands

Put standalone reusable scripts here, using lowercase names with hyphens.
Include a shebang such as `#!/usr/bin/env bash` or `#!/usr/bin/env python3`.

To make a script available as a command, run from the repository root:

```sh
chmod +x scripts/my-command
mkdir -p ~/.local/bin
ln -s "$PWD/scripts/my-command" "$HOME/.local/bin/my-command"
```

The shell configuration adds `~/.local/bin` to PATH. Functions that need to
change the current shell's environment belong in `zsh/functions/` instead.
