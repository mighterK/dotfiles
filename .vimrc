" ========================================================================
" plugin
" ========================================================================
if !isdirectory($HOME . '/.vim/dein')
    !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/dein_installer.sh
    !sh ~/.vim/dein_installer.sh ~/.vim/dein
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    call dein#add('~/.vim/dein')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/denite.nvim')

    call dein#add('derekwyatt/vim-scala')
    call dein#add('gre/play2vim')

    call dein#add('tomasiser/vim-code-dark')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tomtom/tcomment_vim')

    call dein#end()
    call dein#save_state()
endif

" let g:deoplete#enable_at_startup = 1
"colorscheme codedark
let g:airline_theme='codedark'
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" ========================================================================= 
" settings
" ========================================================================= 
" use UTF-8
set encoding=utf-8
scriptencoding utf-8
" use vim setting
set nocompatible
" just hide buffur when abondoned
set hidden
" -----------------
" about display:
" show number of line in the left of the window
set number
" show one line in one line
set nowrap
" do not display tabs and the end of line
set nolist
" show title (including in task bar)
set title
" display incomplete commands
set showcmd           
" set height of command line (which is in the bottom) 2
set cmdheight=2
" always show status line of the last window
set laststatus=2
" width of tabs
set tabstop=4
" insert spaces as tab
set expandtab
" use 4 spaces for each step of indent
set shiftwidth=4
" delete indent and end of line by pressing backspace
set backspace=indent,eol,start

au BufNewFile,BufRead \(*.js\|*.html\|*.php\) set shiftwidth=2 tabstop=2 

" keep 50 lines of command line history
set history=50
" do not creat backup files, viminfo files, and undo files.
set nobackup
set viminfo=
set noundofile
"------------------
" about search:
" do incremental searching
set incsearch
" case
set ignorecase
set smartcase
" hilight words you are searching for
set hlsearch
" go back to the top of file after searching the bottom
set wrapscan

" use mouse
set mouse=a
" in terminal
if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif
" show the cursor position all the time
set ruler
" move cursor automatically to where it were when you start editing new line
set autoindent
" use c style indent
set cindent

filetype plugin indent on
syntax on

" I just copied and pasted the following:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" ================================================
" Key mapping and command definition
" ================================================
"" exit insert mode with jj (comment out)
"inoremap <silent> jj <ESC>
" edit vimrc with <Space>.
nnoremap <Space>. <C-w>n:edit $MYVIMRC<CR>
" edit gvimrc with <Space>,
nnoremap <Space>, <C-w>n:edit $MYGVIMRC<CR>
" toggle NERDTree
nnoremap <Space>nt :NERDTreeToggle<CR>
