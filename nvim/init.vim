"of course
set nocompatible

"auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Required vim-plug bootstrap
call plug#begin('~/.config/nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'

Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'

Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'

Plug 'pangloss/vim-javascript',{ 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax',{ 'for': 'javascript' }
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'

Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

syntax on
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
set autoread
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme gruvbox
set number
set encoding=utf8

" Search
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers"

" Deoplete
let g:deoplete#enable_at_startup = 1
"" close deoplete preview tab
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"NeoSnippet
imap <C-k>	<Plug>(neosnippet_expand_or_jump)
smap <C-k>	<Plug>(neosnippet_expand_or_jump)

"vim airline config
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
" Tab Setup
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
let mapleader = ","
nmap <silent> <leader>k :NERDTreeToggle<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
"Language specifics
"GoLang
let g:go_fmt_command = "goimports"
