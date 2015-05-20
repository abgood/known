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
set wildmenu 
set smarttab
set autoread
set modeline
set autochdir
set showmatch
set ignorecase
set noexpandtab
set fenc=gbk
set nobackup
set tabstop=4  
set cpt=.,w,b
set smartcase
set ignorecase
set cursorline
set tags=tags;
set smartindent
set laststatus=2
set shiftwidth=4  
" set cursorcolumn
set encoding=gbk
set shortmess=atI
set statusline+=%f
set background=dark
set list lcs=tab:\|\ 
set pastetoggle=<F10>
set wildmode=list:full 
set gcr=a:block-blinkon0
set guifont=Lucida_Console:h10:cANSI   
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 150 . 'v.\+', -1)
set fileencodings=gbk,ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
execute 'cd E:\taole\freshblood\config\'

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" nnoremap <silent> <F3> :TlistToggle<CR>
" set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" set fdm=syntax
" set fdm=indent



"######################
"####### 配 色 ########
"######################
syntax on
colorscheme molokai
let g:rehash256 = 1
" let g:molokai_original = 1
" color elflord
" color Tomorrow-Night
" :e!



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
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 40
let g:AutoOpenWinManager = 0
nmap <silent> <F3> :WMToggle<CR>
" let g:winManagerWindowLayout='FileExplorer'
" let g:winManagerWindowLayout='FileExplorer|TagList'


"######################
"###### NERDTree ######
"######################
let g:NERDTree_title="[NERDTree]"  
function! NERDTree_Start()  
	exec 'NERDTree'  
endfunction  
function! NERDTree_IsValid()  
	return 1  
endfunction  

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 设置NERDTree替换winmanager
" 修改winmanager.vim
" toggle showing the explorer plugins.
"
" wincmd H 替换为 wincmd L
"
" function! <SID>ToggleWindowsManager()
" 	if IsWinManagerVisible()
" 		call s:CloseWindowsManager()
" 	else
" 		call s:StartWindowsManager()
" 		以下2行为新增
" 		exe '1wincmd w'
" 		exe 'q'
" 	end
" endfunction
" 
" 以下3行为新增
" if g:AutoOpenWinManager 
" 	autocmd VimEnter * nested call s:ToggleWindowsManager()|1wincmd w|q
" endif



"######################
"###### 索 引 线 ######
"######################
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '|'



"######################
"###### taglist #######
"######################
let Tlist_Show_Menu = 1
let Tlist_Auto_Open = 0
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name" 
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = 'F:\soft\ctags.exe'
" let Tlist_File_Fold_Auto_Close=1



"######################
"##### auto ctags #####
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



"######################
"####### cscope #######
"######################
function Do_CsTag()
	if(executable("cscope") && has("cscope") )
		if(has('win32'))
			silent! execute "!dir /b/s/a *.c,*.cpp,*.h,*.java,*.cs,*.py > cscope.files"
		else
			silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > cscope.files"
		endif
		silent! execute "!cscope -b"
		if filereadable("cscope.out")
			execute "cs add cscope.out"
		endif
	endif
endf
nmap <F4> :call Do_CsTag()<CR>

if  has("cscope")
	cs add E:\taole\freshblood\cscope.out
endif




"######################
"##### 多文件查找 #####
"######################
function Search_Word()
	let w = expand("<cword>") "
	execute "vimgrep " . w . " **"
endf
nmap <C-s> :call Search_Word()<cr>:copen<cr>



"######################
"##### 多文件替换 #####
"######################
" vim里使用
" :args **/*.txt **/*.cpp
" :argdo %s/hate/love/gc | update



"######################
"####### Vundle #######
"######################
set nocompatible
filetype off
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'tomasr/molokai'
Bundle 'davidhalter/jedi-vim'
Bundle 'taglist.vim'
Bundle 'winmanager'



"######################
"#######  ycmd  #######
"######################
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_complete_in_comments=1  
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0  
let g:ycm_seed_identifiers_with_syntax=1  
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_key_invoke_completion = '<M-;>'  



"######################
"#######  jedi  #######
"######################
