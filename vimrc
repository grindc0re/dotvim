" ========== Base settings ==========

" Use filetype-aware indent rules instead.
set noautoindent
set nosmartindent

" Don't try to emulate vi
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Allow undo between sessions
set undofile

" Write the undo-files in a separate folder and not in
" the same folder as the edited file.
set undodir=$HOME/.cache/vim-undo

" Do not create swap-files (using undofile is enough)
set noswapfile

" Numbers of commands in history
set history=50

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Incremental searching
set incsearch

" Highlight all search matches
set hlsearch

" Show sign column for info/warning/error diagnostics
set signcolumn=yes

" Always show the line number in the gutter
set number

" The number column should show relative numbers
set relativenumber

" Highlight the line with the cursor
set cursorline

" Display a line at 100 chars for reference
set colorcolumn=99

" Show popup for ex command autocompletion
set wildmenu

" Allow buffers to be hidden
set hidden

" Always default to utf-8 file encoding
set encoding=utf-8

" Do not wrap lines
set nowrap

" Make vim work with the 'crontab -e' command
set backupskip+=/var/spool/cron/*

" Define separators (for windows, buffers, and so on)
set fillchars=stl:\ ,stlnc:\ ,vert:│,fold:-,diff:-

" Activate list mode to show trailing whitespace and tab chars.
set list
" Set chars that should represent tabs and trailing spaces.
set listchars=trail:·,tab:»\ ,

" Improve omnicomplete by
" longest - Insert the longest common text of the matches
" menuone - Use the popop even if there only is one match
" popup - Show extra info about the currently selected match on a separate popup
set completeopt=longest,menuone,popup

" Use system clipboard (if :echo has("clipboard") != 0)
set clipboard^=unnamed,unnamedplus

" Set updatetime till 100ms to speed upp gutter hints
set updatetime=100

" ========== Tab settings ==========

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" ========== Keymap settings ==========

" Set leader key
let mapleader = ","

" Quick save
nnoremap <leader>w <ESC>:wa<CR>

" Close buffer
nnoremap <leader>q <ESC>:bw<CR>

" Open .vimrc
nnoremap <leader>o <ESC>:e ~/.vim/vimrc<CR>

" Run make
map <leader>m <ESC>:make<CR>

" CtrlP fuzzy finder
nnoremap <leader>f :CtrlP<CR>

" Easier indentation
vnoremap < <gv
vnoremap > >gv

" Launch fugitive in new fullscreen tab
nnoremap <leader>g :tab G<CR>

" Quick bufferlist
nnoremap gb :CtrlPBuffer<CR>

" Floating terminal
nnoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>

" Escape last delimiter with jj
inoremap jj <ESC><RIGHT>a
inoremap <C-f> <C-x><C-]>

" Enable escape in terminal
tnoremap <Esc> <C-\><C-n>

" When pressing G, center the last line on the screen
nnoremap G Gzz

" Generate a random UUID when pressing Ctrl+u
inoremap <C-u> <c-r>=trim(system('uuidgen'))<cr>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" CtrlP settings
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/](\.git|node_modules|\.venv)$' }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Fuzzyy
nnoremap <silent> <leader>sb :FuzzyBuffers<CR>
nnoremap <silent> <leader>sc :FuzzyCommands<CR>
nnoremap <silent> <leader>sf :FuzzyFiles<CR>
nnoremap <silent> <leader>sg :FuzzyGrep<CR>
nnoremap <silent> <leader>sh :FuzzyHelp<CR>
nnoremap <silent> <leader>si :FuzzyInBuffer<CR>
nnoremap <silent> <leader>sm :FuzzyMru<CR>
nnoremap <silent> <leader>sp :FuzzyPrevious<CR>
nnoremap <silent> <leader>sr :FuzzyMruCwd<CR>

" ========== quick-scope settings ==========

" Activate quick-scope with these keys
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" Colors
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=40 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" ========== File format specific settings ==========

" Load filetype specific indentation rules
filetype plugin indent on

" Soft linewrapping for markdown
autocmd BufNewFile,BufRead *.md setlocal linebreak | setlocal wrap

" Treat ino (arduino) as C files
au BufRead,BufNewFile *.ino set filetype=c

" Use some django-specific formatting when editing html
autocmd BufNewFile,BufRead *.html :set filetype=htmldjango

" Format all python-code with black
" Use globally installed black
let g:black_use_virtualenv = 0
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py silent! Black
augroup end

" Sort python imports using isort.
autocmd BufWritePre *.py call isort#Isort(0, line('$'), v:null, v:false)

" ========== Colors and theme settings ==========
" Also see Airline section below"

" Set cursor to pipe in insertmode, block in normalmode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Activate syntax highlighting
syntax on

" Use guifg and guibg for the terminal (24bit colors)
set termguicolors

" Use dark version of one color theme
set background=dark
colorscheme one

" Customize highlight rules
highlight CocErrorSign ctermfg=1 guifg=#be5046
highlight CocWarningSign ctermfg=2 guifg=#d19a66
highlight CocInfoSign ctermfg=3 guifg=#56b6c2
highlight CocHintSign ctermfg=4 guifg=#4b5263

" ========== Airline settings ==========

" Set the airline theme to match the vim color theme
let g:airline_theme='onedark'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.colnr = ' '
let g:airline_symbols.dirty = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Ignore file encoding
let g:airline_section_y = ''

" ========== Vimspector settings ==========

" Use :VimspectorInstall debugpy to install python dap
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir='$HOME/.vim/pack/editing/start/vimspector'

" Close the opened tab with Shift+F5
nnoremap <S-F5> :tabclose<CR>

" ========== Gitgutter settings ==========

let gitgutter_set_sign_backgrounds=1
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'

" ========== Autocompletion settings ==========
" These are mostly copied from the CoC docs.

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ========== Custom commands ==========

" PySelectionTo* - Change format between function calls and dicts.
" Turns 'test=1' == into ==>> '"test": 1,'
command PySelectionToDict '<,'>s/\%V\(\s*\)\(.*\):/\1\"\2\":/g
command PySelectionToFunc '<,'>s/\%V\(\s*\)\"\(.*\)\":/\1\2=/g
