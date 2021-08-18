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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/NErdcommenter'
"Plug 'terryma/vim-multiple-cursors'

"md-preview
"Plug 'iamcco/markdown-preview.nvim'

"for windows
"Plug 'christianfosli/wsl-copy'
"for linux
"Plug 'christoomey/vim-system-copy'
"Plug 'neoclide/coc.nvim'
Plug 'junegunn/vim-peekaboo'

"File Navigation
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
"Plug 'pechorin/any-jump.vim'
Plug 'preservim/nerdtree'

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
set laststatus=2
set noshowmode "disable the within nvim --INSERT --
let g:airline_powerline_fonts=1 "suport powerline font
let g:airline#extensions#tablin#enable=1 "show window and buffer
let g:airline_theme = "onedark"

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"nerdTree
:map <space>f :NERDTreeToggle<CR>
"start nerdTree when vim is open
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let NERDTreeShowBookmarks=1

"Undotree
nnoremap U :UndotreeToggle<CR>

"Markdown Preview
map mp :MarkdownPreview<CR>

"wsl-copy
"map cp : Wsly<CR>

"multiple cursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-b>'

"markdown
let g:vim_markdown_fenced_languages = ['c=c','python3=py']

"nerdCommenter
vnoremap <silent> ? :call NERDComment(0,"toggle")<CR>
nnoremap <silent> ? :call NERDComment(0,"toggle")<CR>

let g:NERDCustomDelimiters = {'c': {'left': '//'}, 'py': {'left': '#'},'c++': {'left': '//'}}

"fuzzy finder
nnoremap <space><space>f :Files <CR>

"tmux-complete
"let g:tmuxcomplete#trigger = 'omnifunc'

"vim-spector
"let g:vimspector_enable_mappings = 'HUMAN'

""Easy-motion =================
""Move to line
"map <space>n <Plug>(easymotion-bd-jk)
"nmap <space>n <Plug>(easymotion-overwin-line)
"
""Move to word
"map  <space>w <Plug>(easymotion-bd-w)
"nmap <space>w <Plug>(easymotion-overwin-w)"
"
""match n word
map  <space>/ <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
""Easy-motion END ===============

"markdown-vim-table
let mapleader = ' '

"vim-markdown
"let g:vim_markdown_no_default_key_mappings = 1
"let g:vim_markdown_new_list_item_indent = 0

"codi.vim
"map cd :Codi!!<CR> 

"coc.nvim ========
"coc-yank
"nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"refactory
"nmap <space>rn <Plug>(coc-rename)

"format code
"nmap <space>rf <Plug>(coc-format-selected)
"xmap <space>rf <Plug>(coc-format-selected)

"coc completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"hexokinase
"let g:Hexokinase_highlighters = ['foregroundfull']
"=======================
"       Themes
"=======================
"colorscheme snazzy
"let g:gruvbox_italic=1
set background=dark
colorscheme onedark
"let g:SnazzyTransparent = 0
