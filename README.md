<!-- markdownlint-disable MD013 -->

# My Dotfiles

These are my configuration files. If you want to read more about how to setup your terminal and code editor to look like this, you can read this post.

## Tools

- [Stow](https://www.gnu.org/software/stow/)
- [TMUX](https://github.com/tmux/tmux/wiki/Installing)
- [Starship](https://starship.rs/)
- [Neofetch](https://github.com/dylanaraps/neofetch)
- [NeoVim](https://github.com/neovim/neovim)
- [LazyVim](https://www.lazyvim.org/)
- [WezTerm](https://wezfurlong.org/wezterm/)
- [Nushell](https://www.nushell.sh/)

There might be configuration files for more tools than the listed here cause I'll be adding as I need them. These are the most important for me tho.

## Installation

To use this configuration, just clone the repo, backup your configuration files, and run the following:

```bash
stow --target=$HOME --dir=/path/to/dotfiles .
```

Make sure that you've installed stow before though.
