# Zed Vim keymap reference

Recorded: 2026-11-03. Based on the current local `~/.config/zed/keymap.json` and `~/.config/zed/settings.json`, rather than the earlier proposed mappings.

## Reading the shortcuts

- **Leader:** Space. `Space s g` means press Space, then s, then g; do not hold them together.
- **Modifiers:** `Ctrl+h` means hold Control and press h. `Cmd` is macOS Command.
- **Uppercase:** `H`, `L`, `J`, `K`, and `Space E` use Shift. Zed spells these `shift-h`, `shift-l`, etc.
- **Mode/context matters:** the same keys can perform different actions depending on where focus is and which Vim mode is active.
- The tables below list every custom binding in the current file. The action column gives the exact Zed action for later lookup.

## Current Vim settings

| Setting                            | Current value | Effect                                                                      |
| ---------------------------------- | ------------- | --------------------------------------------------------------------------- |
| `vim_mode`                         | `true`        | Vim mode is enabled.                                                        |
| `base_keymap`                      | `Zed`         | Zed’s base shortcuts apply alongside Vim mode and custom mappings.          |
| `vim.toggle_relative_line_numbers` | `true`        | Relative line numbers in normal mode; absolute line numbers in insert mode. |

## Quick workflows

- **Browse files:** Escape to normal mode → `Space e` → `j`/`k` to select → `h`/`l` to collapse/expand → Enter to open. Escape in the explorer returns focus to the editor.
- **Find a file by name:** `Space Space`, type the filename, then Enter.
- **Search project text:** `Space s g`.
- **Move through code:** `gd` to a definition, then Ctrl+O to go back; `gi` for an implementation and `gr` for references.
- **Edit a selection:** enter visual mode, select text, then `J`/`K` to move lines or `<`/`>` to change indentation.
- **Open chat:** Cmd+Shift+/ (Cmd+?) uses the default `agent::ToggleFocus` action. `Space a f` is not currently configured.

## Custom bindings

### Normal mode: editor

Applies in a full editor in normal mode, while no menu is open. LSP actions depend on language-server support; Git actions depend on the active repository and selection.

Context: `Editor && mode == full && vim_mode == normal && !menu`

| Shortcut      | Effect                                                                                     | Zed action                        |
| ------------- | ------------------------------------------------------------------------------------------ | --------------------------------- |
| `Space e`     | Toggle focus between the explorer (Project Panel) and editor.                              | `project_panel::ToggleFocus`      |
| `Space E`     | Reveal the current file in the explorer.                                                   | `pane::RevealInProjectPanel`      |
| `Space Space` | Open the file finder; type part of a filename.                                             | `file_finder::Toggle`             |
| `Space s g`   | Open project-wide text search.                                                             | `pane::DeploySearch`              |
| `Space s d`   | Open project diagnostics.                                                                  | `diagnostics::Deploy`             |
| `Space s k`   | Open the keybinding editor.                                                                | `zed::OpenKeymap`                 |
| `Space s s`   | Open the command palette to find and run actions.                                          | `command_palette::Toggle`         |
| `Space f`     | Format using the configured formatter.                                                     | `editor::Format`                  |
| `Space r f`   | Reveal the current file in macOS Finder.                                                   | `editor::RevealInFileManager`     |
| `Space s v`   | Create an editor split on the right.                                                       | `pane::SplitRight`                |
| `Space s h`   | Create an editor split below.                                                              | `pane::SplitDown`                 |
| `Space s e`   | Reset pane sizes.                                                                          | `vim::ResetPaneSizes`             |
| `Ctrl+h`      | Focus the pane to the left.                                                                | `workspace::ActivatePaneLeft`     |
| `Ctrl+j`      | Focus the pane below.                                                                      | `workspace::ActivatePaneDown`     |
| `Ctrl+k`      | Focus the pane above.                                                                      | `workspace::ActivatePaneUp`       |
| `Ctrl+l`      | Focus the pane to the right.                                                               | `workspace::ActivatePaneRight`    |
| `H`           | Activate the previous tab in this pane.                                                    | `pane::ActivatePreviousItem`      |
| `L`           | Activate the next tab in this pane.                                                        | `pane::ActivateNextItem`          |
| `Space l w`   | Toggle soft wrapping for long lines.                                                       | `editor::ToggleSoftWrap`          |
| `g i`         | Go to the implementation of the symbol under the cursor.                                   | `editor::GoToImplementation`      |
| `g o`         | Go to the type definition.                                                                 | `editor::GoToTypeDefinition`      |
| `g r`         | Find all references to the symbol.                                                         | `editor::FindAllReferences`       |
| `g s`         | Show function signature help.                                                              | `editor::ShowSignatureHelp`       |
| `Space c r`   | Rename the symbol through the language server.                                             | `editor::Rename`                  |
| `Space o f`   | Show hover information, including documentation or diagnostics where available.            | `editor::Hover`                   |
| `Space o l`   | Open project diagnostics.                                                                  | `diagnostics::Deploy`             |
| `] ]`         | Go to the next symbol reference.                                                           | `vim::GoToNextReference`          |
| `[ [`         | Go to the previous symbol reference.                                                       | `vim::GoToPreviousReference`      |
| `Space h p`   | Show/hide selected inline Git diff hunks.                                                  | `editor::ToggleSelectedDiffHunks` |
| `Space h b`   | Show Git blame information in a hover.                                                     | `editor::BlameHover`              |
| `Space h s`   | Toggle staging for the applicable selected change; also unstages staged changes.           | `git::ToggleStaged`               |
| `Space h r`   | Restore the applicable selected Git change, discarding that change.                        | `git::Restore`                    |
| `Space g b`   | Open the Git blame view.                                                                   | `git::Blame`                      |
| `Space g s`   | Toggle focus to/from the Git panel.                                                        | `git_panel::ToggleFocus`          |
| `x`           | Send `"_x`: delete a character into the black-hole register, preserving the yank register. | `workspace::SendKeystrokes`       |

### Insert mode: editor

Applies in a full editor in insert mode. Typing `jk` or `kj` as a chord exits insert mode, so quickly typing those literal pairs is intercepted.

Context: `Editor && mode == full && vim_mode == insert`

| Shortcut     | Effect                                                | Zed action                |
| ------------ | ----------------------------------------------------- | ------------------------- |
| `j k`        | Leave insert mode, like Escape.                       | `vim::NormalBefore`       |
| `k j`        | Leave insert mode, like Escape.                       | `vim::NormalBefore`       |
| `Ctrl+h`     | Move the cursor left while remaining in insert mode.  | `editor::MoveLeft`        |
| `Ctrl+j`     | Move the cursor down while remaining in insert mode.  | `editor::MoveDown`        |
| `Ctrl+k`     | Move the cursor up while remaining in insert mode.    | `editor::MoveUp`          |
| `Ctrl+l`     | Move the cursor right while remaining in insert mode. | `editor::MoveRight`       |
| `Ctrl+Space` | Request the completion menu.                          | `editor::ShowCompletions` |

### Visual mode: editor

Applies in visual mode in a full editor, while no menu is open. `J`/`K` move lines rather than running the normal Vim actions.

Context: `Editor && mode == full && vim_mode == visual && !menu`

| Shortcut  | Effect                                                    | Zed action             |
| --------- | --------------------------------------------------------- | ---------------------- |
| `J`       | Move the selected lines down; no explicit reindent step.  | `editor::MoveLineDown` |
| `K`       | Move the selected lines up; no explicit reindent step.    | `editor::MoveLineUp`   |
| `<`       | Outdent using the editor action, retaining the selection. | `editor::Outdent`      |
| `>`       | Indent using the editor action, retaining the selection.  | `editor::Indent`       |
| `p`       | Paste over the selection with `preserve_clipboard: true`. | `vim::Paste`           |
| `Space f` | Format using the configured formatter.                    | `editor::Format`       |

### Save: shared editor shortcut

Applies in a full editor except Vim’s character-waiting mode (for example, while awaiting the character after `f`).

Context: `Editor && mode == full && vim_mode != waiting`

| Shortcut | Effect                                                      | Zed action        |
| -------- | ----------------------------------------------------------- | ----------------- |
| `Ctrl+s` | Save the active file without intentionally switching modes. | `workspace::Save` |

### Explorer: Project Panel

Applies while navigating the explorer, not while editing a filename. Space E or Escape returns focus to the editor.

Context: `ProjectPanel && not_editing`

| Shortcut      | Effect                                                        | Zed action                     |
| ------------- | ------------------------------------------------------------- | ------------------------------ |
| `Space e`     | Toggle focus between the explorer (Project Panel) and editor. | `project_panel::ToggleFocus`   |
| `escape`      | Toggle focus between the explorer (Project Panel) and editor. | `project_panel::ToggleFocus`   |
| `Space Space` | Open the file finder; type part of a filename.                | `file_finder::Toggle`          |
| `Space s f`   | Open the file finder; type part of a filename.                | `file_finder::Toggle`          |
| `Ctrl+h`      | Focus the pane to the left.                                   | `workspace::ActivatePaneLeft`  |
| `Ctrl+j`      | Focus the pane below.                                         | `workspace::ActivatePaneDown`  |
| `Ctrl+k`      | Focus the pane above.                                         | `workspace::ActivatePaneUp`    |
| `Ctrl+l`      | Focus the pane to the right.                                  | `workspace::ActivatePaneRight` |

### Empty editor pane

Applies when an editor pane has no open item. Useful for opening a file or reaching the explorer after closing the final tab.

Context: `EmptyPane`

| Shortcut      | Effect                                                        | Zed action                     |
| ------------- | ------------------------------------------------------------- | ------------------------------ |
| `Space e`     | Toggle focus between the explorer (Project Panel) and editor. | `project_panel::ToggleFocus`   |
| `Space Space` | Open the file finder; type part of a filename.                | `file_finder::Toggle`          |
| `Space s f`   | Open the file finder; type part of a filename.                | `file_finder::Toggle`          |
| `Ctrl+h`      | Focus the pane to the left.                                   | `workspace::ActivatePaneLeft`  |
| `Ctrl+j`      | Focus the pane below.                                         | `workspace::ActivatePaneDown`  |
| `Ctrl+k`      | Focus the pane above.                                         | `workspace::ActivatePaneUp`    |
| `Ctrl+l`      | Focus the pane to the right.                                  | `workspace::ActivatePaneRight` |

### Terminal

These keys are handled by Zed instead of being sent to the shell or terminal application. In particular, Ctrl+L no longer clears the terminal screen, and Ctrl+H no longer reaches the shell as backspace.

Context: `Terminal`

| Shortcut | Effect                       | Zed action                     |
| -------- | ---------------------------- | ------------------------------ |
| `Ctrl+h` | Focus the pane to the left.  | `workspace::ActivatePaneLeft`  |
| `Ctrl+j` | Focus the pane below.        | `workspace::ActivatePaneDown`  |
| `Ctrl+k` | Focus the pane above.        | `workspace::ActivatePaneUp`    |
| `Ctrl+l` | Focus the pane to the right. | `workspace::ActivatePaneRight` |

### Insert mode: completion menu

Applies while the insert-mode completion menu is visible. These Tab bindings navigate suggestions; when the menu is closed, Zed’s normal snippet/Tab behavior applies.

Context: `Editor && vim_mode == insert && showing_completions`

| Shortcut    | Effect                              | Zed action                  |
| ----------- | ----------------------------------- | --------------------------- |
| `Ctrl+y`    | Accept the selected completion.     | `editor::ConfirmCompletion` |
| `Ctrl+n`    | Select the next suggestion.         | `menu::SelectNext`          |
| `Ctrl+p`    | Select the previous suggestion.     | `menu::SelectPrevious`      |
| `Ctrl+e`    | Cancel/dismiss the completion menu. | `editor::Cancel`            |
| `tab`       | Select the next suggestion.         | `menu::SelectNext`          |
| `Shift+Tab` | Select the previous suggestion.     | `menu::SelectPrevious`      |

## Overrides and differences to remember

Custom mappings apply only in their matching contexts. More specific matching contexts take precedence; for bindings at the same context level, later bindings win. See [Zed’s keybinding precedence rules](https://zed.dev/docs/key-bindings#precedence).

| Shortcut                   | Current behavior                       | Behavior replaced / practical difference                                                                                 |
| -------------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Normal `H` / `L`           | Previous / next tab                    | Vim’s top / bottom of visible screen motions. Zed tabs correspond more closely to buffers than Neovim tab-page layouts.  |
| Normal Ctrl+H/J/K/L        | Pane navigation                        | Existing editor/Vim control-key behavior; insert mode instead uses these for cursor movement.                            |
| `gi`                       | Go to implementation                   | Vim’s return to the previous insertion position.                                                                         |
| `gr`                       | Find references                        | Conflicts with Zed’s longer `gr…` command family; those sequences are not reliable with this mapping.                    |
| `gs`                       | Signature help                         | Zed Vim’s current-file symbol picker.                                                                                    |
| `[[` / `]]`                | Previous / next reference              | Vim’s previous / next code section.                                                                                      |
| Visual `J` / `K`           | Move selected lines                    | Existing visual-mode bindings, including `J` for joining lines. Unlike the Neovim mapping, no explicit reindent follows. |
| Visual `<` / `>`           | Editor indentation actions             | Vim indentation actions; intended to keep the selection active.                                                          |
| Visual `p`                 | Paste and preserve clipboard           | Default paste behavior that can replace clipboard contents with removed text.                                            |
| Normal `x`                 | Delete through the black-hole register | Default character deletion that updates a register.                                                                      |
| Insert Ctrl+H / Ctrl+K     | Cursor left / up                       | Existing backspace / kill-line behavior.                                                                                 |
| Completion Tab / Shift+Tab | Select suggestion                      | Completion acceptance/composition behavior while the menu is visible.                                                    |
| `Space h s`                | Toggle staging                         | Gitsigns’ stage-only operation; invoking it on staged changes can unstage them.                                          |
| `Space h r`                | Restore selected change                | Discards the applicable change; this is not an undo command.                                                             |
| `Space g b`                | Git blame view                         | An approximation of Neovim’s inline blame toggle.                                                                        |

`Space f` formats in normal and visual modes. `Space Space` finds files. `Space s f` is custom-mapped only in the explorer and empty panes; it is absent from the normal-mode editor block.

Some comments in the live JSON refer to earlier proposals (for example, the project-search comment mentions Space S W). This reference follows actual bindings, not those leftover comments.

## Useful built-in shortcuts

These are defaults, not custom entries in the current file. Defaults can change with Zed updates; use `zed: open default keymap` to inspect the installed version.

| Location           | Shortcut               | Action                                       |
| ------------------ | ---------------------- | -------------------------------------------- |
| Explorer           | `j` / `k`, `h` / `l`   | Select entries; collapse/expand directories. |
| Explorer           | Enter; `gg` / `G`; `-` | Open; first/last entry; parent directory.    |
| Editor normal mode | `gd` / `gD`            | Definition / declaration.                    |
| Editor normal mode | Ctrl+O / Ctrl+I        | Back / forward through navigation history.   |
| Editor normal mode | `K`                    | Hover documentation.                         |
| Editor normal mode | `[d` / `]d`            | Previous / next diagnostic.                  |
| Editor normal mode | `[c` / `]c`            | Previous / next Git change.                  |
| Editor normal mode | `gcc`                  | Toggle line comment.                         |
| Workspace          | Cmd+Shift+/            | Toggle agent chat focus.                     |
| Workspace          | Cmd+Shift+P            | Command palette.                             |

References: [Vim keymap](https://github.com/zed-industries/zed/blob/main/assets/keymaps/vim.json), [macOS keymap](https://github.com/zed-industries/zed/blob/main/assets/keymaps/default-macos.json), [Vim settings](https://zed.dev/docs/vim).

## Earlier suggestions absent from the current custom keymap

These were not carried into the active custom mappings: pane resizing with Ctrl+Arrow; close-tab/window and new-tab leader shortcuts; Ctrl+backslash for the terminal dock; custom debugger bindings; custom text-object bindings; Space S W; Space S F in the editor; and Space A F for chat. Their absence does not disable Zed’s built-in shortcuts for those features.

Centered scrolling/search from Neovim was not configured in Zed. F4 and F7 have no custom overrides in the current file.

## Maintaining this reference

- Run `zed: open keymap file` to inspect the live `~/.config/zed/keymap.json`.
- Run `zed: open keymap` to browse actions and assigned shortcuts.
- Run `dev: open key context view` to diagnose which context is active when a shortcut behaves unexpectedly.
- When changing a mapping, update the corresponding row here. This Markdown file is a reference, not a configuration loaded by Zed.

Binding descriptions were checked against the configuration and official documentation; each shortcut has not been tested interactively.
