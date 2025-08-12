# Vim config, grindc0re style

## Setup
```bash
git clone --recurse-submodules -j8 https://github.com/grindc0re/dotvim.git ~/.vim
```

## Plugins
Plugins are managed as git submodules using Vims built-in package manager.
Optional plugins (in `**/opt/*`) are loaded when needed using, for example, `packadd devdocs.vim`.

```bash
$ tree -L 2 .
├── docs
│   └── opt
│       └── devdocs.vim
├── editing
│   └── start
│       ├── coc.nvim
│       ├── markdown-preview.nvim
│       ├── quick-scope
│       ├── vim-commentary
│       ├── vim-snippets
│       ├── vimspector
│       └── vim-surround
├── git
│   └── start
│       ├── vim-fugitive
│       └── vim-gitgutter
├── nav
│   └── start
│       ├── ctrlp.vim
│       ├── easyjump.vim
│       ├── fuzzyy
│       └── nerdtree
└── themes
    └── start
        ├── vim-airline
        ├── vim-airline-themes
        └── vim-one

28 directories, 0 files
```

## Dependencies
```bash
sudo apt install libsm-dev libxpm-dev libxt-dev nodejs pandoc python3-dev
```

* libSM-dev
* libXpm-dev
* libXt-dev
* Nodejs
* Pandoc (for optional devdocs)
* Python3 (including -dev)

## Compiling Vim
Compile with *huge* flag to get system clipboard support.

```bash
git clone --depth 1 --branch <tag_name> https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-python3interp --enable-luainterp --enable-perlinterp
make
sudo make install
```

## Additional steps to install plugins

### Markdownpreview.nvim
```bash
cd ~/.vim/pack/editing/start/markdown-preview.nvim
npm i
cd app/
npm i
```

### CoC autocompletion
```
:CocInstall coc-pyright coc-snippets @yaegassy/coc-ruff coc-htmldjango coc-tailwindcss coc-toml coc-json coc-docker coc-css
```
