call plug#begin()
"Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
call plug#end()

execute pathogen#infect() 

" Global Sets """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on            " Enable syntax highlight
set nu               " Enable line numbers
set relativenumber
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set autoindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
" set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
" set mouse=a          " Enable mouse support
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any


"------------------------------------------------------------
" Colors
set term=xterm
set t_Co=256
colorscheme monokai

"------------------------------------------------------------
set confirm
set autowriteall
 
"Better command-line completion
set wildmenu
set showcmd
set hlsearch
set nomodeline

"------------------------------------------------------------
"Use case insensitive search, except when using capital letters
set backspace=indent,eol,start
set nostartofline
set ruler
set laststatus=2
set wildmode=full 

"Tags configuration
map <C-T> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-D> :rightb vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Use visual bell instead of beeping when doing something wrong
set visualbell
 
"And reset the terminal code for the visual bell. If visualbell is set, and
"this line is also included, vim will neither flash nor beep. If visualbell
"is unset, this does nothing.
set t_vb=
 
"Enable use of the mouse for all modes
set autoread
 
"Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
"Display line numbers on the left
set relativenumber
 
"Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
"Use <F11> to toggle between paste and nopaste
set pastetoggle=<F11>
 
"------------------------------------------------------------
"Indentation options {{{1
"
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
 
"Indentation settings for using hard tabs for indent. Display tabs as
"four characters wide.
"set shiftwidth=4
"set tabstop=4
 

" Remaps """"""""
" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
inoremap <silent><expr> <c-c> coc#refresh()



" autocmd """"""""""



" AirLine """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



" NerdTree """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-a> :NERDTreeToggle<CR>
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
map Y y$
nnoremap <S-right> gt
nnoremap <S-left> gT
nnoremap <S-L> gt
nnoremap <S-H> gT

" Function Keys Mappings
nnoremap <F3> :nohl<CR>
map      <F4> :redraw!<CR>
nnoremap <F5> <C-W>vgf

" Moving between buffers
nnoremap <C-right> <C-W>l
nnoremap <C-left> <C-W>h
nnoremap <C-down> <C-W>j
nnoremap <C-up> <C-W>k

nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

map <leader>bt :bufdo tab split<CR>

" Copy Selection
vmap <F7> "+ygv"zy`>

" Paste 
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`
cmap <F7> <C-r><C-o>z

" Moving line up or down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

autocmd FocusGained * let @z=@+

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

" Reference to current directory in command mode
cmap dir %:p:h

" Match close brace Mappings
set showmatch
set matchtime=5

inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Folding Mappings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

augroup indentrc
  au BufReadPre  * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
  au BufRead * normal zR
augroup END



"--------------------- Syntax eneble ---------------------

" Actionscript
augroup actionscript_folding
  au!
  au BufNewFile,BufRead *.as   setf actionscript 
  au BufNewFile,BufRead *.vsif set  syntax=actionscript
augroup END

" JavaScript
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" TCL
augroup tcl_folding
  au!
  au BufNewFile,BufRead *.tcl set syntax=tcl
augroup END

"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"------------------------------------------------------------

"
"SystemVerilog Assertions
let mapleader=","
nmap <leader>a o: assert property (<CR>@(posedge clk)<CR><CR>);<Esc><Up><Up><Up>I<Space><Left>
nmap <leader>d o$display($time,"");<Left><Left><Left>
nmap <F5> :!irun -sv -assert +access+rw -timescale 1ns/1ns *.v<CR>
map <F11> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

"---- Enable menu in terminal mode
if !has('gui_running')
  source $VIMRUNTIME/menu.vim
  set wildmenu
  set cpoptions-=<
  set wildcharm=<C-Z>
  map <F4> :emenu <C-Z>
endif

