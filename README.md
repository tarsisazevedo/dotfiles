# dotfiles

Personal configuration for fish, tmux, and neovim.

## Structure

```
fish/
  config.fish          # shell config: starship, fzf, zoxide, pyenv, tmux auto-attach
tmux/
  .tmux.conf           # tmux config: C-a prefix, sesh switcher, zenwritten status bar
  scripts/
    claude-cost.sh     # Claude daily/monthly spend tracker for status-right
nvim/
  init.lua             # lazy.nvim bootstrap, options, keymaps
  lua/plugins/
    ui.lua             # zenbones theme, lualine, render-markdown, nvim-tree
    editing.lua        # telescope, treesitter, autopairs, vim-tmux-navigator, Comment.nvim
    lsp.lua            # mason, nvim-lspconfig, nvim-cmp
starship.toml          # prompt config
```

## Dependencies

### Fish
- [starship](https://starship.rs) — prompt
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smart cd
- [pyenv](https://github.com/pyenv/pyenv) + pyenv-virtualenv

### Tmux
- [tpm](https://github.com/tmux-plugins/tpm) — plugin manager
- [sesh](https://github.com/joshmedeski/sesh) — fuzzy session/project switcher (`prefix+T`)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) + [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) — session persistence
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) — seamless nvim/tmux pane nav
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank)
- [tmux-agent-status](https://github.com/samleeney/tmux-agent-status)
- `ccusage` (`npm install -g ccusage`) — for claude-cost.sh

### Neovim (0.10+)
Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and installed automatically on first launch.

## Notes

- `fish/config.fish` has work-specific env vars commented out — uncomment on work machines.
- `tmux/scripts/claude-cost.sh` tracks Claude Code CLI spend only (not claude.ai web sessions).
- nvim-treesitter is pinned to the `master` branch; markdown highlight is disabled there since `render-markdown.nvim` owns it and the treesitter injection directive crashes on nvim 0.12.2.
