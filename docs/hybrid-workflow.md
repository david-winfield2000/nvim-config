# Neovim vs VS Code — hybrid workflow

Use **Neovim** for fast, minimal editing. Use **VS Code** when you need IDE-style tooling (especially debugging).

## Prefer Neovim

- Quick edits, navigation, and keyboard-heavy work
- Low overhead: configs, scripts, small changes, logs
- Terminal-native flow (`tmux`, shell, SSH)
- Light resource use and long sessions

## Prefer VS Code

- **Debugging** — breakpoints, stacks, variables, attach to process
- Extensions that matter for your stack (notebooks, cloud tools, previews)
- Shared team setup (`launch.json`, tasks, extensions)

## Rule of thumb

| Tool    | Best for                                      |
|---------|-----------------------------------------------|
| Neovim  | Editing, speed, everywhere / remote editing   |
| VS Code | Runtime inspection, debugger, extension-heavy |

Keep Neovim config lean (LSP basics are enough); avoid duplicating full IDE features if VS Code already covers them.
