# Git

_"Git is a free and open source distributed version control system designed to
handle everything from small to very large projects with speed and
efficiency."_

* https://git-scm.com/

The `~/.config/dotfiles/git/*.conf` files are include-d from the `~/.gitconfig`
file. The `~/.local/bin` folder is assumed to be in `PATH`, and only git
related scripts/executables should be in this (git) subfolder.

```
  git/
  ├── .config
  │   └── dotfiles
  │       └── git
  │           ├── alias.conf
  │           ├── attributesfile.conf
  │           ├── excludesfile.conf
  │           └── user.conf-example
  ├── .gitconfig
  ├── .local
  │   └── bin
  │       └── git-imgdiff
  └── README.md

  5 directories, 8 files
```
