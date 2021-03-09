set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding
set tabstop=4  "4 space tabs
set shiftwidth=4  "4 space shift
set softtabstop=4 "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines
set showmatch  "Highlight matching braces
set ruler  "Show bottom ruler
set equalalways  "Split windows equal size
set formatoptions=croq  "Enable comment line auto formatting
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc "Ignore junk files
set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set cursorline  "Highlight current line
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set lazyredraw  "Don't redraw while running macros (faster)
set lazyredraw  "Don't redraw while running macros (faster)
set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q
" Color Scheme Settings"
let g:molokai_original = 1
colorscheme molokai
let g:rehash256 = 1
"Show Line Number"
set number
"Remove scrollbars
set guioptions=

"Turn off cursor blinking in normal mode
set gcr=n:blinkon0


"font"
set guifont=Monaco\ for\ Powerline:h15

"Vundle Configure"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'


"My Bundles!"
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'tomasr/molokai'
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'tmhedberg/SimpylFold'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'jondkinney/dragvisuals.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"
call vundle#end()


" Syntax highlighting and stuff
filetype plugin indent on
syntax on
set noshowmode

" Quick no highlight
:noremap <silent> <c-i> :nohls<cr><c-i>


"NerdTREE Keybindings"
map <C-n> :NERDTreeToggle<CR>

"relative line numbers"
nnoremap <F3> :NumbersToggle<CR>

"Run current python script"
map <F5> :w<CR>:exe ":!python " . getreg("%") . "" <CR>

" autopep8 settings
let g:autopep8_disable_show_diff=1


"number toggle settings"
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

"Powerline settings"
" let g:Powerline_symbols = 'compatible'
" let g:Powerline_symbols = 'co'

"Always show status line"
:set laststatus=2

"Allow shift + direction keys for selection"
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

"YouCompleteMe Autoclose referce tab"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"Control P settings"
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1

"ControlP Funky Settings"
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.DS_Store

"Tagbar settings
nmap <F6> :TagbarToggle<CR>

" ctags bin settings
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

"For the dragvisuals plugin

runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"Highlight the 81 th column of longer lines
highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%81v', 100)

"Keymappings for gundo
nnoremap <F2> : GundoToggle<CR>

"Settings for delimitMate
let delimitMate_matchpairs = "{:}"

"Latex-box settings
""$pdflatex = 'pdflatex -synctex=1 %O %S'
"let g:LatexBox_viewer = "open -a /Applications/Skim.app"
" let g:LatexBox_latexmk_options = "-pvc -pdfps"

"dictionary for latex
filetype on
au FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set complete+=k

"YCM shift-tab
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
"
"Movement between windows"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Additional Setting for vim-latex
"nnoremap <c-a> <Plug>IMAP_JumpForward
"map <c-a> <Plug>IMAP_JumpForward
"imap <c-a> <Plug>IMAP_JumpForward
"
nnoremap <c-a> <Plug>IMAP_JumpForward|:nohls
map <c-a> <Plug>IMAP_JumpForward|:nohls
imap <c-a> <Plug>IMAP_JumpForward|:nohls
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'
" let g:Tex_CompileRule_pdf= 'latex --output-format=pdf $*'
let g:Tex_CompileRule_pdf= 'pdflatex --synctex=1 $*'
" let g:Tex_CompileRule_pdf= 'pdflatex -interaction=nonstopmode $*'


"Code folding settings
" autocmd FileType c setlocal foldmethod=syntax
" set foldmethod=syntax
" set foldnestmax=1
" set foldcolumn=1
" set mouse=a


"SML Make Settings
" SML make code {{{
autocmd FileType sml setlocal makeprg=sml\ '%'
" }}}

"Conque shell quick commands
"Vertical split
command Tvspl execute 'ConqueTermVSplit bash --login'
"Horizontal split
command Tspl execute 'ConqueTermSplit bash --login'
" let g:ConqueTerm_Color = 1
" let g:ConqueTerm_TERM = 'xterm'
"
"Syntastic Settings
let g:syntastic_error_symbol = "x>"
let g:syntastic_warning_symbol = "!>"
let g:syntastic_style_error_symbol = "x>"
let g:syntastic_style_warning_symbol = "!>"

let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ["tex", "latex"],
                           \ "passive_filetypes": [] }

" Settings for Investigate.vim
let g:investigate_use_dash=1


" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif
