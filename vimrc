set nocompatible
source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
    else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"############################################################
"################ 以 下 内 容 为 自 定 义 ###################
"############################################################

"######################
"##### 相 关 设 置 ####
"######################
set si
set ai
set number
set modeline
set ignorecase
set showmatch
set autoread
set wildmenu 
set smarttab
set noexpandtab
set autochdir
set background=dark
set tabstop=4  
set shiftwidth=4  
set shiftwidth=4  
set wildmode=list:full 
set statusline+=%f
set laststatus=2
set shortmess=atI
set fdm=syntax
set tags=tags;
set guifont=Lucida_Console:h10:cANSI   
set pastetoggle=<F10>
set encoding=gbk
set fenc=gbk
set fileencodings=gbk,ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

color elflord

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <silent> <F3> :TlistToggle<CR>



"######################
"#####  状 态 栏 ######
"######################
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}



"######################
"##### winmanager #####
"######################
let g:winManagerWindowLayout='FileExplorer'
let g:winManagerWidth = 40
nmap <silent> <F4> :WMToggle<CR>
" let g:winManagerWindowLayout='FileExplorer|TagList'



"######################
"###### 索 引 线 ######
"######################
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'



"######################
"###### taglist #######
"######################
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_Menu = 1
let Tlist_Auto_Open = 0
let Tlist_Sort_Type = "name" 
let Tlist_Ctags_Cmd = 'F:\soft\ctags.exe'
let Tlist_WinWidth = 40
"let Tlist_File_Fold_Auto_Close=1



"######################
"###### taglist #######
"######################
filetype plugin on
let g:pydiction_location = 'D:\install\Vim\vimfiles\plugin\complete-dict'
let g:pydiction_menu_height = 20

function! AutoLoadCTagsAndCScope()
   let max = 5
   let dir = './'
   let i = 0
   let break = 0
   while isdirectory(dir) && i < max
       if filereadable(dir . 'cscope.out') 
           execute 'cs add ' . dir . 'cscope.out'
           let break = 1
       endif
       if filereadable(dir . 'tags')
           execute 'set tags =' . dir . 'tags'
           let break = 1
       endif
       if break == 1
           execute 'lcd ' . dir
           break
       endif
       let dir = dir . '../'
       let i = i + 1
   endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>




" nnoremap <silent> <F4> :ts<CR> in vim type :ts <command>
" nnoremap <silent> <F4> :set fdm=syntax<CR>
" nmap <F9> <Esc>:!ctags -R *<CR>

" set encoding=utf-8
" 设置gvim的字体和大小，以及配色方案
" 字体设置和Linux稍微有点区别，请使用冒号隔开，或者使用双引号括起来，而不是Linux下的空格转义
" set guifont=Courier_New:h10:cANSI
" colorscheme freya   
" colorscheme lucius   
" colorscheme blackdust   
" colorscheme rainbow_neon
" 为光标所在行添加标识(Windows下为高亮模式，Linux下为下划线)
" setlocal cursorlin
 
" set cursorcolumn
" 拷贝过来的代码对齐
" gg=G (command mode)

" set encoding=utf-8
" set fenc=gbk
" set fileencodings=gbk,ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" if(g:iswindows==1)
"     source $VIMRUNTIME/delmenu.vim
"     source $VIMRUNTIME/menu.vim
"     language messages zh_CN.utf-8
" endif
" if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
"     set ambiwidth=double
" endif
" set nobomb

"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

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
