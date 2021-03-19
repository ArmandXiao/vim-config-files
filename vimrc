"===================================
"   Personalized Keymappings
"===================================
"snippets for mk
source ~/.vim/md-snippets.vim

"WSL vim cursor
"let &t_SI.="\e[5 q"
"let &t_SR.="\e[4 q"
"let &t_EI.="\e[1 q"

"remap of direction keys
noremap J 5j
noremap K 5k

"open man page
noremap M K
"noremap b <nop>

map L $
map H ^

"remap ESC
inoremap jk <ESC>
vnoremap <tab> <ESC>

"remap INSERT MODE functions with CTRL
inoremap <C-l> <ESC>A
inoremap <C-h> <ESC>I

nnoremap ; :
nnoremap ' "

"quick save and quit
map <C-s> :w<CR>
map <C-q> :q<CR>

"normal mode indentation
nnoremap < <<
nnoremap > >>

"split
map <space><space>l :set splitright<CR>:vsplit<CR>
map <space><space>h :set nosplitright<CR>:vsplit<CR>
map <space><space>k :set nosplitbelow<CR>:split<CR>
map <space><space>j :set splitbelow<CR>:split<CR>

"change window
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

"resize windows
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

"brackets
inoremap '<space> ''<><ESC>2hi
inoremap "<space> ""<><ESC>2hi
inoremap (<space> ()<><ESC>2hi
inoremap [<space> []<><ESC>2hi
inoremap {<CR> {<CR>}<CR><ESC>kO

"search
"use easy-motion plugin instead
"noremap <space>f /
noremap <silent> <space>, :nohl<CR>

"tab control
map te :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

"Press j twice to jump to the next '<>' and edit it
"PLACE HOLDER
inoremap <buffer> jj <Esc>/<><CR>:nohlsearch<CR>c2l

"select all
nnoremap <C-a> ggVG

"remap original Ctrl+A to space A
nnoremap <space>a <C-a>

"Buffer control
map <space>1 :b 1<CR>
map <space>2 :b 2<CR>
map <space>3 :b 3<CR>
map <space>4 :b 4<CR>
map <space>5 :b 5<CR>
map <space>6 :b 6<CR>
map <space>7 :b 7<CR>
map <space>8 :b 8<CR>
map <space>9 :b 9<CR>

"QuickFix
map <silent> <space>o :copen<CR>
map <silent> <space>n :cnext<CR>
map <silent> <space>N :cprevious<CR>

" Compile function
noremap R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

"===================================
"       Vim基本配置
"===================================
set termguicolors
set clipboard+=unnamedplus

set relativenumber
set cursorline
set wildmenu

" Search Option
set hlsearch
set incsearch

" Fold mod
set foldmethod=indent
set foldlevel=99
set foldenable
set scrolloff=7

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible

"配置backspace键工作方式
set backspace=indent,eol,start

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"开启语法高亮功能
syntax enable
syntax on

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
set ignorecase

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"设置换行符为unix
set ff=unix

"===================================
"               Plugs
"===================================
"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

"Vundle 配置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"apperance
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
"Plugin 'connorholyday/vim-snazzy'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
Plugin 'mhinz/vim-startify'
"Plugin 'norcalli/nvim-colorizer.lua'
"Plugin 'RRethy/vim-hexokinase'

"auto complete
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'wellle/tmux-complete.vim'
Plugin 'honza/vim-snippets'

"Enter select
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'
"Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/NErdcommenter'
Plugin 'terryma/vim-multiple-cursors'

"md-preview
Plugin 'iamcco/markdown-preview.nvim'

"for windows
Plugin 'christianfosli/wsl-copy'
"for linux
"Plugin 'christoomey/vim-system-copy'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/vim-peekaboo'

"File Navigation
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mbbill/undotree'
Plugin 'pechorin/any-jump.vim'
Plugin 'preservim/nerdtree'

"line changed in git
Plugin 'airblade/vim-gitgutter'

"debug
" Plugin 'puremourning/vimspector'
" Plugin 'metakirby5/codi.vim'

"Editor
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"Firenvim - broswer
"Plugin 'glacambre/firenvim'

"Icon
"shoul have 'nerd-fonts' installed on system
"Plugin 'ryanoasis/vim-devicons'

"Org mode
Plugin 'jceb/vim-orgmode'

call vundle#end()
filetype plugin indent on

"================================
"      Plugins Settings
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
map cp : Wsly<CR>

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
let g:tmuxcomplete#trigger = 'omnifunc'

"vim-spector
let g:vimspector_enable_mappings = 'HUMAN'

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
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
""Easy-motion END ===============

"markdown-vim-table
let mapleader = ' '

"vim-markdown
"let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_new_list_item_indent = 0

"codi.vim
"map cd :Codi!!<CR> 

"coc.nvim ========
"let g:mkdp_browser = 'qutebrowser'
"coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

"coc completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"hexokinase
let g:Hexokinase_highlighters = ['foregroundfull']
"=======================
"       Themes
"=======================
"colorscheme snazzy
"let g:gruvbox_italic=1
set background=dark
colorscheme onedark
"let g:SnazzyTransparent = 0
