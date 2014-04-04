" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <silent> <F3> :TlistToggle<CR>
" nnoremap <silent> <F4> :ts<CR> in vim type :ts <command>
<<<<<<< HEAD
" nnoremap <silent> <F4> :set fdm=syntax<CR>
=======
>>>>>>> 0c36b4a8ab8f4ad8e1f10d1c19f0e38a9df29b63
set modeline
set background=dark

set expandtab
set tabstop=4  
set shiftwidth=4  
set shiftwidth=4  
set wildmode=list:full 
set wildmenu 
set encoding=utf-8
set smarttab
set statusline+=%f
set laststatus=2
set shortmess=atI
set ignorecase
set showmatch
set si
set ai
set autoread
set fdm=syntax
set tags=tags;
set autochdir
" 拷贝过来的代码对齐
" gg=G (command mode)
<<<<<<< HEAD

"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
=======
" 自动缩进当前行
" ==

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
>>>>>>> 0c36b4a8ab8f4ad8e1f10d1c19f0e38a9df29b63

highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}

"""""""""""""""""""""
" Tag list (ctags)
"""""""""""""""""""""
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
let Tlist_Auto_Open = 1


"""""""""""""""""""""
" python
"""""""""""""""""""""
filetype plugin on
let g:pydiction_location = '~/.vim/plugin/complete-dict'
""defalut g:pydiction_menu_height == 15
let g:pydiction_menu_height = 20


"""""""""""""""""""""
" C++
"""""""""""""""""""""
" http://vim.wikia.com/wiki/C++_code_completion
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/include/c++/4.1.2/
" map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" set tags+=~/.vim/tags/tags
" 
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1
" let OmniCpp_MayCompleteDot = 1
" let OmniCpp_MayCompleteArrow = 1
" let OmniCpp_MayCompleteScope = 1
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview
