set nocompatible        " Use Vim settings rather than Vi.  Must be set first
set ruler               " show the cursor position all the time
set hidden              " change buffers without saving
set autoread            " autoupdate files

filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle bundles  
Plugin 'gmarik/vundle' 
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
Plugin 'ack.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/Command-T'
Plugin 'desert-warm-256'
Plugin 'Syntastic'
" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" CtrlP
Plugin 'kien/ctrlp.vim'
" Tagbar 
Plugin 'majutsushi/tagbar'
Plugin 'gmarik/vim-markdown' 
Plugin 'timcharper/textile.vim' 
Plugin 'a.vim'
Plugin 'brookhong/cscope.vim'
Plugin 'Align'
Plugin 'Tabular'
Plugin 'samsonw/vim-task'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'goldfeld/ctrlr.vim' 
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nfvs/vim-perforce'
Plugin 'COMMENT.vim'

call vundle#end()
filetype plugin indent on
set guifont=Monospace\ 8 
" Backups
set nobackup		        " Don't keep the backup files
"set backup                     " Enable creation of backup file.
set backupdir=~/.vim/.backups   " Where backups will go.
set directory=~/.vim/.tmp       " Where temporary files will go.

" Command line related
set showcmd             " display incomplete commands
set history=200         " keep 200 lines of command line history

" Search related
set incsearch           " do incremental searching (move cursor while typing search string)
set hls                 " Don't highlight searches
set ignorecase          " Ignore case when searching
set smartcase           " If capital letters are used, be case sensitive
set diffopt=iwhite      " don't highligyht whitespace differences in vimdiff

" Sounds, visual artifacts
set nowrap              " don't wrap lines that go beyond the edge of the screen
set noerrorbells        " Stop beeping
set novisualbell        " Turn off visual bell
set t_vb=               " don't flash the screen on errors
set cmdheight=2	      	" Default command height is 1...move to 2 

set tabstop=2           " tabwidth is 2 spaces
set shiftwidth=2        " indent with 2 spaces
set noexpandtab

set buftype=""
set splitright
set splitbelow
" Showmarks
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyz"
let g:all_marks = "abcdefghijklmnopqrstuvwxyz"

if has("gui_running")
        let g:showmarks_enable=1
else
        let g:showmarks_enable=0
        let loaded_showmarks=1
endif

" Spacing
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set et                          " Don't put tab keys in the file, use spaces
set sw=2                        " 4 spaces in smart tab
set smarttab                    " a tab equals the # of spaces in sw above

" Programming Related Section
set showmatch   " Show matching brackets
set tags=$HOME/p4/wk1/sw/src/trunk/tags
set cscopetag
syntax on
filetype plugin on
filetype indent on 
set omnifunc=syntaxcomplete#Complete

if has("autocmd")
    au FileType cpp,c                   set autoindent smartindent cindent number
    au FileType python,perl,sh          set autoindent smartindent cindent number
    au FileType html                    set number smartindent
    
    autocmd BufWritePost .vimrc source %

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif


if has("autocmd")
  augroup Binary
    au!
    au BufReadPre *.bin,*.hex setlocal binary
    au BufReadPost *
          \ if &binary | exe "Hexmode" | endif
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  exe "%!xxd -r" |
          \ endif
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  exe "%!xxd" |
          \  exe "set nomod" |
          \ endif    
  augroup END
endif

    
"set background=dark 
"color mac_classic
"color pencil
color monoacc
highlight Normal guibg=lightblue

" GUI Settings 
if has("gui_running")
    syntax enable 
    "set background=dark 
    " Basics
    set guifont=InconsolataGo\ 9 
    highlight Normal guibg=lightblue
    "color apprentice
    "color earendel 
    "color iceberg
    "color mac_classic
    "color lilypink
    "color industrial
    color lightning
    "set guioptions=ce 
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +  use GUI tabs, not console style tabs
    set guioptions-=T

    " set mousehide " hide the mouse cursor when typing
    set nomousehide " work around missing cursor in gvim

    " Initial screen size
    set columns=160
    set lines=50

    " Font size changes
    map <F11> <ESC>:set guifont=Inconsolata\ 9<CR>
    map <F12> <ESC>:set guifont=Inconsolata\ 10<CR>
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Status Line                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

if version >= 700
    au InsertEnter * hi StatusLine guibg=blue guifg=lightyellow
    au InsertLeave * hi StatusLine guibg=black guifg=lightyellow
    hi statusline guibg=black guifg=lightyellow
endif
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugin Options                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change nerdtree to be on right side
let g:NERDTreeWinPos = "left"

" Fold method 
set foldmethod=indent
set foldlevelstart=20

" Set c styles for the cvim plugin based on the file extension
let g:C_Styles = { '*.c' : 'default', '*.cc,*.cpp,*.hh,*.H,*.h' : 'CPP' }


" Need the status line for vim-powerline
if v:version >= 720
    set laststatus=2
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim
":helptags ~/.vim/bundle/ctrlp.vim/doc
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|d|o)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
let g:ctrlp_max_files=30000
let g:flake8_max_line_length=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Keyboard Shortcuts                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jump in and out of insert mode
imap <C-space> <Esc>
imap jj <ESC>
imap kj <ESC>

" Save the file
imap <C-s> <Esc>:w<CR>i
map <C-s> <ESC>:w<CR>

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

let notabs = 1
nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>

" Shortcuts for plugins
map <A-l> <ESC>:TlistToggle<CR>
map <A-n> <ESC>:NERDTreeToggle<CR><C-w><C-w>


" F1 same as ESC 
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Window move 
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Functions                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find /workspace/jimmy/svn/ -name '".a:name."' | grep -v \".svn/\" | grep -v \"TARGETS\" | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  echo "Before substitution: ".l:line
  let l:line=substitute(l:line, "^[^\t]*\t", "", "")
  echo "After substitution: ".l:line
  execute ":tabe ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")
     

command! -complete=shellcmd -nargs=+ SH call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
endif


" Tagbar 
nnoremap <leader>1 :TagbarToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" ctrlp.vim :CtrlPBuffer - show all open buffers
map  <F2>       :CtrlP<CR>
map  <leader>b  :CtrlPBuffer<CR>
imap <F2>       <ESC>:CtrlP<CR>

" Taglist
map  <F4>      :TlistToggle<CR><C-W><a-right>
imap <F4>      <ESC>:TlistOpen<CR><C-W><a-right>

" a.vim
map  <F6>      :A<CR>
imap <F6>      <ESC>:A<CR>



" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth         = 60
let Tlist_Close_On_Select  = 1

" OmniCompletion
let OmniCpp_NamespaceSearch   = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess        = 1
let OmniCpp_MayCompleteDot    = 1
let OmniCpp_MayCompleteArrow  = 1
let OmniCpp_MayCompleteScope  = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"CommandT
let CommandTMaxFiles =  20000
set wildignore+=*/src/third_party/dma_driver/dma_driver-4.7*/*,*/src/third_party/dma_driver/dma_driver-4.8*/*,*/src/third_party/dma_driver/dma_driver-4.9.2*/*,*/src/third_party/dma_driver/dma_driver-4.9.3*/*  

" Tabularize
if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    nmap <leader>a= :Tabularize /:zs<CR>
    vmap <leader>a= :Tabularize /:zs<CR>
endif

" CScope 
if has ("cscope")
    set csprg=/usr/bin/cscope
	" change this to 1 to search ctags DBs first
	set csto=0
	set cst
	set nocsverb

    if filereadable("cscope.out")
	    cs add /home/jimmyb/p4/wk1/sw/trunk/src/cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif 

" Tags 
"set tags=tags
