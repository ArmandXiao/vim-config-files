"====================================
"       Personalized Settings
"====================================

" snippets for markdown
"source ~/.vim/md-snippets.vim

"------------
" Leader KEY |
"------------
" leader is now space
let mapleader = " "

" reload vimrc without quitting
map <LEADER><LEADER>r :source ~/.vim/vimrc<CR>

"------------
" Movements |
"------------
noremap J 5j
noremap K 5k

map L $
map H ^

"-------------
" Operations |
"-------------
inoremap jk <ESC>
"vnoremap <tab> <ESC>

nnoremap ; :
nnoremap ' "

" save and quit
map <C-s> :w<CR>
map Q :q<CR>
map <C-q> :q<CR>

" indentation
nnoremap < <<
nnoremap > >>

" select all
nnoremap <C-a> ggVG
"remap original Ctrl+A to LEADER-a
nnoremap <LEADER>a <C-a>

"---------------
" Screen Split |
"---------------
map <LEADER><LEADER>l :set splitright<CR>:vsplit<CR>
map <LEADER><LEADER>h :set nosplitright<CR>:vsplit<CR>
map <LEADER><LEADER>k :set nosplitbelow<CR>:split<CR>
map <LEADER><LEADER>j :set splitbelow<CR>:split<CR>

"----------------
" Change Window |
"----------------
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

"----------------
" Resize Window |
"----------------
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

"---------------------
" Buffer tab control |
"---------------------
map te :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map <LEADER>1 :b 1<CR>
map <LEADER>2 :b 2<CR>
map <LEADER>3 :b 3<CR>
map <LEADER>4 :b 4<CR>
map <LEADER>5 :b 5<CR>
map <LEADER>6 :b 6<CR>
map <LEADER>7 :b 7<CR>
map <LEADER>8 :b 8<CR>
map <LEADER>9 :b 9<CR>

"------------
" Quick Fix |
"------------
map <silent> <LEADER>o :copen<CR>
map <silent> <LEADER>n :cnext<CR>
map <silent> <LEADER>N :cprevious<CR>

"------------------
" Auto Completion |
"------------------
inoremap {<CR> {<CR>}<ESC>O

"------------
" Functions |
"------------
" check spelling
map cp :set spell spelllang=en_us<CR>
map <silent> <LEADER>, :nohl<CR>

"====================================
"            Vim Settings
"====================================
set termguicolors
set t_Co=256
" enable system clipboard
set clipboard+=unnamedplus

set relativenumber
set cursorline
set wildmenu

" search options
set hlsearch
set incsearch

" Fold mod
set foldmethod=indent
set foldlevel=99
set foldenable
set scrolloff=7

" 关闭vi的一致性模式 避免以前版本的bug和局限
set nocompatible

set backspace=indent,eol,start

" line number
set number
" 右下角光标行列信息
set ruler

set showcmd
set history=1000

" 取消备份 禁止产生临时文件
set nobackup
set noswapfile

" show match of brackets
set showmatch

set autoindent
set cindent

" ignore cases (Capital letter)
set ignorecase

syntax enable
syntax on

" enable mouse operation
set mouse=a

" tab width
set tabstop=4
" auto indent table width
set shiftwidth=4
" deleter 4 spaces at a time
set softtabstop=4
set smarttab
set expandtab

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5
set ff=unix

"====================================
"               Plugs               |
"====================================
"vim-plug
call plug#begin('~/.vim/plugged')

"apperance
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'bling/vim-bufferline'
"Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'mhinz/vim-startify'
"Plug 'norcalli/nvim-colorizer.lua'
"Plug 'RRethy/vim-hexokinase'

"auto complete
"Plug 'ycm-core/YouCompleteMe'
"Plug 'wellle/tmux-complete.vim'
Plug 'honza/vim-snippets'

"Enter select
"Plug 'gcmt/wildfire.vim'
"Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion'
"Plug 'preservim/NErdcommenter'
"Plug 'terryma/vim-multiple-cursors'

"md-preview
"Plug 'iamcco/markdown-preview.nvim'

"for windows
"Plug 'christianfosli/wsl-copy'
"for linux
"Plug 'christoomey/vim-system-copy'
"Plug 'neoclide/coc.nvim'
"Plug 'junegunn/vim-peekaboo'

"File Navigation
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'mbbill/undotree'
"Plug 'pechorin/any-jump.vim'
"Plug 'preservim/nerdtree'

"line changed in git
"Plug 'airblade/vim-gitgutter'

"debug
 "Plug 'puremourning/vimspector'
" Plug 'metakirby5/codi.vim'

"Editor
"Plug 'editorconfig/editorconfig-vim'
"Plug 'dhruvasagar/vim-table-mode'
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'

"Firenvim - broswer
"Plug 'glacambre/firenvim'

"Icon
"shoul have 'nerd-fonts' installed on system
"Plug 'ryanoasis/vim-devicons'

"Org mode
"Plug 'jceb/vim-orgmode'

call plug#end()

"================================
"      Plugins Settings         |
"================================
"vim-airline
