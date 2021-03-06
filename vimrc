" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

" TODO:
" 1 ctrlp mappings and settings - probably no need for more
" 5 Tagbar (or something for tags) - probably not needed
" 6 EasyMotion - substituted with incsearch, probably no need for anything
" fancier
" 7 vim-multiple-cursors! - not needed for now
" 8 Customize R-plugin
" 9 dragvisuals
" 10 vis vim
" 11 syntastic
" Fix smart indents - some plugin sets it and the vimrc unsets it, not sure
" what
"
" Available good maps:
" R replace mode - check if useful first
" t/T till / back till - f/F is enough for me (altough it could be useful with
" other commands
" H/M/L screen top/mid/bottom - will become obsolete with easymotion I guess
" Space!!!!! good for leader-like
" Lots of C- are mapped to useless stuff
"

" Leader to comma
let mapleader = ','

"----------------------------------------------------------- 
" Vundle {{{1

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'submode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'haya14busa/incsearch.vim'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'gioele/vim-autoswap'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fran-penedo/python-mode'
Plugin 'tpope/vim-unimpaired'
Plugin 'lervag/vim-latex'
Plugin 'SirVer/ultisnips'
Plugin 'fran-penedo/vim-snippets'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tComment'
Plugin 'EasyGrep'
Plugin 'Solarized'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'albfan/nerdtree-git-plugin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'fran-penedo/vimux-nose-test'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'rhysd/devdocs.vim'
Plugin 'adborden/vim-notmuch-address'
Plugin 'jeetsukumaran/vim-markology'
Plugin 'Shougo/echodoc.vim'
Plugin 'powerman/vim-plugin-AnsiEsc'
Plugin 'Konfekt/FastFold'
Plugin 'python/black'
Plugin 'mbbill/undotree'
Plugin 'machakann/vim-swap'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set showmatch
" set incsearch
" set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Disable welcome message
set shortmess+=I


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Sign column highlight
hi clear SignColumn

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set timeout ttimeout ttimeoutlen=100

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Highlight current line
set cursorline

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" shady characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" System clipboard (only for X window)
" set clipboard=unnamedplus

" Color scheme
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

set tags=./tags;$HOME

set lazyredraw

set foldcolumn=1

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2

noremap <silent> <Leader>W :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

"------------------------------------------------------------
" vim-airline options {{{1
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
" Remap : to ;
nnoremap ; :
" nnoremap : ;

" Map tab to esc only in insert mode
imap <Tab> <Esc>
vmap <Tab> <Esc>
nmap <Tab> <Esc>

nnoremap <F5> :e


" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map L (redraw screen) to also turn off search highlighting until the
" next search
nnoremap Z :nohl<CR><C-L>

nnoremap i  <C-i>
nnoremap o  <C-o>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" move up/down quickly by using Alt-j, Alt-k
" which will move us around by functions
" nnoremap <silent> <A-j> }
" nnoremap <silent> <A-k> {

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> z :bp<CR>
nnoremap <silent> x :bn<CR>
" Make quickfix buffers unlisted so previous commands ignore them
autocmd Filetype qf setlocal nobuflisted

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, K, J
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
nnoremap <silent> ,q <C-w>q
" Close buffer and go to next without closing window
nnoremap ,c :bp<bar>sp<bar>bn<bar>bd<CR>

"(v)im (r)eload
nnoremap <silent> ,vr :so %<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `

" Undo c-w in insert mode
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Some emacs maps that I like
inoremap <c-e> <Esc>A
inoremap <c-d> <Del>

" Command-/ to toggle comments
let g:tcomment_maps = 0
noremap / :TComment<CR>
inoremap / <Esc>:TComment<CR>i

" Use Alt- numbers to pick the tab you want
noremap <silent> ,1 :tabn 1<cr>
noremap <silent> ,2 :tabn 2<cr>
noremap <silent> ,3 :tabn 3<cr>
noremap <silent> ,4 :tabn 4<cr>
noremap <silent> ,5 :tabn 5<cr>
noremap <silent> ,6 :tabn 6<cr>
noremap <silent> ,7 :tabn 7<cr>
noremap <silent> ,8 :tabn 8<cr>
noremap <silent> ,9 :tabn 9<cr>

" Resize windows with movement keys
let g:submode_timeout = 0
call submode#enter_with('resize', 'n', '', '<Leader>r')
call submode#leave_with('resize', 'n', '', '<Esc>')
call submode#map('resize', 'n', '', 'j', '<C-w>-')
call submode#map('resize', 'n', '', 'k', '<C-w>+')
call submode#map('resize', 'n', '', 'h', '<C-w><')
call submode#map('resize', 'n', '', 'l', '<C-w>>')

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

    " We should never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') == 'NERD'
        wincmd c
        return
    endif

    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Programming
nnoremap <F4> :make!<CR>

" Other mappings

" Available: T K X <space>

nnoremap R @@
nnoremap s "_d
vnoremap s "_d
nnoremap ss "_dd
nnoremap S "_D
nnoremap r :%s//g<Left><Left>
nnoremap ` gqip
nnoremap q; q:
nnoremap B :let @"=@+<CR>
nnoremap H :let @+=@"<CR>
nnoremap W :w<CR>

" Plugin config

" fugitive config

" Every time you open a git object using fugitive it creates a new buffer. 
" This means that your buffer listing can quickly become swamped with 
" fugitive buffers. This prevents this from becomming an issue:

autocmd BufReadPost fugitive://* set bufhidden=delete

nnoremap ,ga :Git add %:p<CR><CR>
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit -v -q<CR>
nnoremap ,gt :Gcommit -v -q %:p<CR>
nnoremap ,gd :Gdiff<CR>
"nnoremap ,ge :Gedit<CR>
"nnoremap ,gr :Gread<CR>
"nnoremap ,gw :Gwrite<CR><CR>
nnoremap ,gl :silent! Glog<CR>:bot copen<CR>
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
nnoremap ,gp :Ggr<Space>
nnoremap ,gm :Gmove<Space>
nnoremap ,gb :Git branch<Space>
nnoremap ,go :Git checkout<Space>
nnoremap ,gps :Dispatch! git push<CR>
nnoremap ,gpl :Dispatch! git pull<CR>

" vim-gitgutter config
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow 
highlight GitGutterDelete ctermfg=red 
highlight GitGutterChangeDelete ctermfg=yellow 

" nerdtree config
noremap <C-n> :NERDTreeToggle<CR>

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" ctrlp
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and respects
    " .gitignore
    let g:ctrlp_user_command =
                \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    " Fall back to using git ls-files if Ag is not available
    let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_by_filename = 1
noremap <C-o> :CtrlPTag<CR>
noremap M :CtrlPBuffer<CR>

call ctrlp_bdelete#init()

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" youcompleteme
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/dotfiles/vim/ycm_extra_conf.py'
let g:ycm_auto_trigger = 0
let g:ycm_python_binary_path = 'python'

" Autoformat
nnoremap <F3> :Autoformat<CR><CR>

" python-mode
" let g:pymode_debug = 1
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 88
let g:pymode_rope_completion = 0
let g:pymode_rope = 1
let g:pymode_lint_ignore = ["E501"]
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'mccabe', 'mypy']
let g:pymode_motion = 0
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_folding = 1
" C-c binds don't work
let g:pymode_run_bind = '<leader>e'
let g:pymode_rope_autoimport_bind = '<leader>rra'
let g:pymode_rope_goto_definition_bind = '<leader>rg'
let g:pymode_rope_show_doc_bind = '<leader>rd'
let g:pymode_rope_find_it_bind = '<leader>rf'
let g:pymode_rope_organize_imports_bind = '<leader>rro'
let g:pymode_rope_rename_bind = '<leader>rrr'
let g:pymode_rope_rename_module_bind = '<leader>rr1r'
let g:pymode_rope_module_to_package_bind = '<leader>rr1p'
let g:pymode_rope_extract_method_bind = '<leader>rrm'
let g:pymode_rope_extract_variable_bind = '<leader>rrl'
let g:pymode_rope_inline_bind = '<leader>rri'
let g:pymode_rope__move_bind = '<leader>rrv'
let g:pymode_rope_generate_function_bind = '<leader>rrnf'
let g:pymode_rope_generate_class_bind = '<leader>rrnc'
let g:pymode_rope_generate_package_bind = '<leader>rrnp'
let g:pymode_rope_change_signature_bind = '<leader>rrs'
let g:pymode_rope_use_function_bind = '<leader>rru'

" latex
au BufEnter *.tex setl tw=80
let g:tex_flavor='latex'
let g:vimtex_view_method="general"
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_imaps_snippet_engine="ultisnips"
let g:vimtex_fold_enabled = 1
let g:vimtex_latexmk_options = ' -verbose -pdf -file-line-error -synctex=1 -interaction=nonstopmode --shell-escape'
let g:vimtex_quickfix_method = 'pplatex'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ultisnips_python_style = "numpy"
let g:UltiSnipsUsePythonVersion = 3
autocmd FileType py UltiSnipsAddFiletypes python
"let g:ycm_key_list_previous_completion=[]

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Use uppercase target labels and type as a lower case
" let g:EasyMotion_use_upper = 1

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"

map <Leader> <Plug>(easymotion-prefix)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-overwin-f2)

" Bidirectional & within line 't' motion
nmap t <Plug>(easymotion-bd-tl)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-wl)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
nmap L :VimuxRunLastCommand<CR>

" Vimux nose
map <Leader>vn :RunNoseTest<CR>
map <Leader>vb :RunNoseTestBuffer<CR>
map <Leader>vt :RunNoseTestFocused<CR>

" Tagbar
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" DevDocs
map <Leader>d :DevDocs<Space>

" Markology
let g:markology_include="abcdefzxAB"
let g:markology_hlline_lower=1
let g:markology_hlline_upper=1

" Echodoc
let g:echodoc#enable_at_startup = 1

" BLack
autocmd BufWrite *.py execute ':Black'

" UndoTree
nnoremap U :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
