# Mainly Notes For Myself

## Installation

`brew info emacs` says the cask verion's better Cocoa .app

```
  brew install emacs
  brew cask install emacs
```

Since they're separate apps, no need for: `emacs -nw`, for terminal version

```
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

  NOTE: `SPC f e D`, will invoke `spacemacs/ediff-dotfile-and-template`

## Help/Tutorial

  [Quick Start](http://spacemacs.org/doc/QUICK_START.html)

  Help:                `SPC h`
  Tutorial:            `SPC h T`
  Describe functions:  `SPC h d`

  `^g` anytime to "quit" current state

  [FAQ](http://spacemacs.org/doc/FAQ.html)
  [SimpleTutorials](https://simpletutorials.com/c/2883/Spacemacs)

## Customizations

* `init.el` start as copy of `~/.emacs.d/core/templates/.spacemacs.template`, add personalizations
* `user-config.el` contains the bulk of customizations, overriding `spacemacs`'s default behavior
* `user-init.el` ()`It is called immediately after `dotspacemacs/init', before layer configuration executes.`)

Custom keybindings in: `user-config.el`
  * CtrlP     <- HELM Projectile
  * CtrlSpace <- helm-mini
  * NERDTree  <- neo-tree
  * Line numbers on by default

## Vim Equivalents

```
  Vim                   Evil?   Spacemacs       Command
Toggles (SPC t)
  :set nu               x       SPC t n         line-numbers
  :set relativenumber   x       SPC t r         linum-relative-toggle
Buffers (SPC b)
  :buffers              o       SPC b b         helm-mini
  :bn                   o       SPC b n         next-buffer
  :bp                   o       SPC b p         previous-buffer
  :bd                   o       SPC b d (or D)  kill-this-buffer (or ace-kill-this-buffer)
  :b#                   x       SPC TAB         last buffer
Project (SPC p)
Windows (SPC w)
Search
  :Ag                   o       SPC /           smart search
  :Ag                   o       SPC *           smart search w/ input
Theme (SPC T)
  :colorscheme          x       SPC T s         helm-themes
Misc
  :map                  x       SPC ?           show keybindings
  :shell                o       SPC '           open shell (requires 'shell' in dotspacemacs-configuration-layers)
  :so ~/.vimrc          x       SPC f e R       dotspacemacs/sync-configuration-files
```

  * Visual modes (`^v`, `v`, `V`) are the same
  * `:close` seems to work (`C-x k` to `kill buffer`)
  
## Spacemacs Layers
  [layers](https://github.com/syl20bnr/spacemacs/tree/master/layers)

## Tmux
  `evil-tmux-navigator` is available by default

## Ediff (vimdiff)
  limited evil bindings

## UndoTree

## Git
  Git Gutter is available by default
    https://gist.github.com/arronmabrey/344c40a9157e31544d76f092b70a4809

## XDebug
  https://blogs.oracle.com/opal/entry/quick_debugging_of_php_scripts
  https://github.com/ahungry/geben

## Terminal
  `^z` is mapped to evil-toggle-key, by default, override in: `user-init.el`

  Opacity, overridden in: `user-config.el`
  
## References
https://www.reddit.com/r/spacemacs/
