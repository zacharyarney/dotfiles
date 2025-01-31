# dotfiles
dotfiles

Install GNU `stow` and run
```
$ ./apply.sh
```
**OR**

Use `stow` to create symlinks to dotfiles with command:
```
$ stow <package name>
```
for each relevant package/directory in the root. Trailing slash omitted.

Currently:
```
$ stow bash
$ stow bin
$ stow clang-format
$ stow ctags
$ stow emacs
$ stow ghostty
$ stow jetbrains
$ stow nvim
$ stow ranger
$ stow tmux
$ stow vim
$ stow wezterm
$ stow zsh
```

Note: `stow` will create symlinks for directories that do not already exist which may lead to future packages being installed into folders within this repo. Make sure directories like `~/.local/share/nvim` exist before running `apply.sh` to avoid having to reinstall plugins, etc.

