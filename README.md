# Vim config, grindc0re style

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
