"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Template Creator:
"       Amir Salihefendic — @amix3k
" Maintainer:
"       Graham Sider — @grahamsider
"
" Sections:
"    -> General
"    -> Plugin Initialization
"    -> Plugin Settings
"    -> Vim UI
"    -> Colors and Fonts
"    -> Files & Backups
"    -> Text, Tab, Indent
"    -> Visual Mode
"    -> Movement, Tab Management, Windows
"    -> Default Status Line
"    -> Mapping Edits
"    -> Spell Checking
"    -> Misc
"    -> Helper Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Enable line numbers on left
set number

" Enable relative line numbers
set relativenumber

" Hotkey for switching relative/normal numbers
nmap <C-t> :set invrelativenumber<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Leader
let mapleader = ","
let maplocalleader = ";"

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Ensure backspace works properly on all systems
set backspace=indent,eol,start
set t_kb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Initialization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specifies plugin directory
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'edkolev/tmuxline.vim'
Plug 'embear/vim-localvimrc'

" Disabled plugins
" Plug 'sainnhe/gruvbox-material.git'
" Plug 'lervag/vimtex'
" Plug 'https://github.com/Valloric/YouCompleteMe'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'tikhomirov/vim-glsl'

" Initializes plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree
noremap <leader>o :NERDTreeToggle<CR>

" Vim Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Gruvbox Material (Disabled)
" let g:gruvbox_material_background = 'medium'
" let g:gruvbox_material_enable_italic = 0
" let g:gruvbox_material_disable_italic_comment = 0

" Lightline
let g:lightline = {'colorscheme' : 'gruvbox'}

" Auto GLSL Syntax Highlighting
autocmd! BufNewFile,BufRead *.vs,*.fs,*.tcs,*.tes set ft=glsl

" CScope
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	" else add the database pointed to by environment variable 
   elseif $CSCOPE_DB != "" 
		cs add $CSCOPE_DB
	endif
endfunction
au BufEnter /* call LoadCscope()

map <leader>cr :cs reset<cr>

" Tmuxline
let g:tmuxline_powerline_separators = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.hg\*,.svn\*
else
    set wildignore+=*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left (removed)
set foldcolumn=0

" Map code block jumping to a saner search method
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Fix background color erase for 256-color tmux/screen
if &term =~ '256color'
    set t_ut=
endif

" Colorscheme
set background=dark

" Sometimes needed to resolve term/screen errors
" set termguicolors

" Current theme: gruvbox (disabled: gruvbox-material)
try
    colorscheme gruvbox
    " colorscheme gruvbox-material
catch
endtry

" Use terminal background color over colorscheme
hi Normal guibg=NONE ctermbg=NONE

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files & Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup/swapfile off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines


""""""""""""""""""""""""""""""
" => Visual Mode
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Movement, Tab Management, Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Default Status Line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping Edits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Remap CAPS to ESC in insert mode
inoremap <A-k> <ESC>
inoremap <A-j> <ESC>

" Move a line of text using ALT+[jk] or Command+[jk] on mac

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Remap exit term mode to escape
tnoremap <ESC> <C-\><C-N>

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>tp :setlocal paste!<cr>

" Remap clipboard to xclip functions
vnoremap <silent> "+y y:call ClipboardYank()<cr>
vnoremap <silent> "*y y:call ClipboardYank()<cr>
vnoremap <silent> <leader>y y:call ClipboardYank()<cr>

vnoremap <silent> "+d d:call ClipboardYank()<cr>
vnoremap <silent> "*d d:call ClipboardYank()<cr>
vnoremap <silent> <leader>d d:call ClipboardYank()<cr>

vnoremap <silent> "+p p:call ClipboardPaste()<cr>p
vnoremap <silent> "*p p:call ClipboardPaste()<cr>p
vnoremap <silent> <leader>p p:call ClipboardPaste()<cr>p

" Allow relative ctags and .git dir ctags search up to $HOME
set tagrelative
set tags^=.git/tags;$HOME


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy/paste to/from X clipboard buffer
function! ClipboardYank()
    call system('xclip -i -selection clipboard', @@)
endfunction

function! ClipboardPaste()
    let @@ = system('xclip -o -selection clipboard')
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
