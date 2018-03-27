" Configuration file for vim
" initial author: John Carrino (carrino@amazon.com)
" heavily "mucked around with" by Dave Hillis (dwhillis@gmail.com)
 
" Standard vim options
set autoindent            " always set autoindenting on
set autochdir             " always change the directory to the location of the open file
set backspace=2           " allow backspacing over everything in insert mode
set cindent shiftwidth=4  " Same thing with cindent
set cinoptions=(0,W4      " Don't indent case statements or public/private
set diffopt=filler,iwhite " keep files synced and ignore whitespace
set expandtab             " Get rid of tabs altogether and replace with spaces
set foldcolumn=0          " I hate folding, so don't leave any room for it
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden
set formatoptions=cq      " Use the formatting I like
set guioptions-=T         " Remove toolbar
set guioptions-=m         " Remove menu from the gui
set guioptions-=r         " Remove scrollbar 
set history=50            " keep 50 lines of command line history
set incsearch             " Incremental search
set linebreak             " This displays long lines as wrapped at word boundries
set matchtime=10          " Time to flash the brack with showmatch
set matchpairs+=<:>       " Great for complex C++ templates
set mouse=a               " Make the mouse work sanely
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " disable folds
set nohidden              " close buffers, don't hide them
set nohlsearch            " Don't highlight everything while searching
set noswapfile            " this guy is really annoyoing sometimes
set notimeout             " i like to be pokey
set nottimeout            " take as long as i like to type commands
set nowrap                " Don't wrap lines
set ruler                 " the ruler on the bottom is useful
set scrolloff=1           " dont let the cursor get too close to the edge
set shiftwidth=4          " Set indention level to be the same as softtabstop
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set softtabstop=4         " Why are tabs so big? This fixes that.
set tabstop=4             " Why are tabs so big? This fixes that.
set textwidth=0           " Don't wrap words by default
set timeoutlen=10000      " Time to wait for a map sequence to complete
set ttimeoutlen=10000     " time to wait for a key code to complete
set virtualedit=block     " let blocks be in virtual edit mode
set wildmenu              " This is used with wildmode(full) to cycle options

"Longer Set options
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-    " useful for cscope in quickfix
set listchars=tab:>-,trail:-                  " prefix tabs with a > and trails with -
"set tags+=./.tags,.tags,../.tags,../../.tags, " set ctags

set wildignore+=**/data/**,**/build/**,*.o,**/thirdparty/**,**/bsp/**,*.class,*.orig

set whichwrap+=<,>,[,],h,l,~                  " arrow keys can wrap in normal and insert modes
set wildmode=list:longest,full                " list all options, match to the longest
set helpfile=$VIMRUNTIME/doc/help.txt
set path+=.,..,../..,../../..,../../../..,/usr/include

"Set colorscheme.
colorscheme ron

"GUI options
highlight Pmenu guibg=brown           

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" viminfo options
" read/write a .viminfo file, don't store more than
" 50 lines of registers
set viminfo='20,\"50

"Set variables for plugins to use
 
"vimspell variables
  "don't automatically spell check!
let spell_auto_type=""
 
"rcsvers.vim settings
 "Setup exlcude expressions for rcs
 "By default, exclude everything... this can be overriden user's .vimrc
let g:rvExcludeExpression = '.'
 
" If :w! doesn't work, there's always :w!!
cmap w!! %!sudo tee > /dev/null %

" Search in the current directory
nnoremap  :grep "\<<C-R><C-W>\>" *<CR>

" These are really handy shortcuts, they make vimgrep 100x more awesome
map  :cn<CR>
map  :cp<CR>
map  :cc<CR>

" Esc
inoremap jj <Esc>

"taglist.vim settings
if exists('loaded_taglist')
    set updatetime=1000 "interval to update list window
    map ,jt :!start ctags -R --java-kinds=+p --fields=+iaS --extra=+q .<CR> 
    map ,ct :!start ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

    map <F2> :TlistToggle<CR>
    "let Tlist_Auto_Open=1 "Auto open the list window
    "let Tlist_Compact_Format=1
    let Tlist_Enable_Fold_Column=0 "Turn off the fold column for list window
    "let Tlist_Exit_OnlyWindow=1 "Exit if list is only window
    "let Tlist_File_Fold_Auto_Close=1
    "let shared::time::getTime();Tlist_Show_Menu=1 "Show tag menu in gvim
 
    "maps to close, and open list window
    "map <silent> <Leader>tc :TlistClose<CR>
    "map <silent> <Leader>to :TlistOpen<CR>
endif

" LargeFile.vim settings
" don't run syntax and other expensive things on files larger than NUM megs
let g:LargeFile = 100
 
"Turn on filetype plugins to automagically
  "Grab commands for particular filetypes.
  "Grabbed from $VIM/ftplugin
filetype plugin on
filetype indent on
 
"Turn on syntax highlighting
syntax on
 
"mappings
" , #perl # comments
map ,# :s/^/#/<CR>
" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>
" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>
" c++ java style comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR><Esc>:nohlsearch<CR>

" Title within screen
if $TERM =~ '/screen/'
    exe "set title titlestring=vim:%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

let g:last_path = ""

" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.cap let &bin=1
    au BufReadPost *.cap if &bin | %!xxd
    au BufReadPost *.cap set ft=xxd | endif
    au BufWritePre *.cap if &bin | %!xxd -r
    au BufWritePre *.cap endif
    au BufWritePost *.cap if &bin | %!xxd
    au BufWritePost *.cap set nomod | endif
augroup END

au BufNewFile,BufRead *.gradle setf groovy

" For clang_complete
"let g:clang_use_library = 1
"let g:clang_library_path = "/usr/lib/x86_64-linux-gnu"

" For eclim
let g:EclimCompletionMethod = 'omnifunc'

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

autocmd FileType java setlocal cinoptions=(0,W4

call plug#begin()

Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
" Plug 'vim-utils/vim-husk'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'editorconfig/editorconfig-vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'gavocanov/vim-js-indent'

call plug#end()
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" let g:ycm_extra_conf_globlist = ['~/workspace/*','!~/*']
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = '\v[\/](git|build|node_modules|bower_components)$'
    
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
nmap <C-g> :YcmCompleter GoTo<CR>
autocmd FileType h nmap <C-]> :YcmCompleter GoTo<CR>
autocmd FileType c nmap <C-]> :YcmCompleter GoTo<CR>
autocmd FileType cpp nmap <C-]> :YcmCompleter GoTo<CR>

" Setup neomake to run jscs and jshint automagically on writes
call neomake#configure#automake('nw', 750)
