# neovim configuration

This is environment to start neovim with coc.nvim and C/C++ language server.

## Pre Build

- Install neovim
- Install [ccls](https://github.com/MaskRay/ccls)

## Build configuration

```bash
$ cd ~/.config
$ git clone https://github.com/kmasu0/nvim_config.git ./nvim
$ cd nvim/dein
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh $(pwd -P)
```

