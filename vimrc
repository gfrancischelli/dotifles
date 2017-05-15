set foldmethod=marker
set encoding=utf8
" Plugins {{{

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
Plugin 'suan/vim-instant-markdown' "Automatic markdown preview

" Motion
Plugin 'easymotion/vim-easymotion'
Plugin 'jeetsukumaran/vim-indentwise' "Movements based on indent level
"Plugin 'dimasg/vim-mark' "Highlight and mark workds

" Search
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'

" Text Objects
Plugin 'wellle/targets.vim'
Plugin 'coderifous/textobj-word-column.vim' "Work on columns

" Editing
Plugin 'tommcdo/vim-exchange' "Text exchange operator
Plugin 'tomtom/tcomment_vim'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

" Generic Programming Support
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'

" Elm Support
Plugin 'ElmCast/elm-vim'
Plugin 'lambdatoast/elm.vim'

" Git Support
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'kablamo/vim-git-log'

" Theme / Interface
Plugin 'airblade/vim-gitgutter'
Plugin 'trevordmiller/nova-vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

" }}}
" Configuration {{{

set cursorline
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
" Show cursor position
set ruler
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set matchtime=3
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set lazyredraw
set showbreak=↪


" Brazilian keyboard better navigation
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ç l

vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ç l

" Tabs, spaces and wrappings
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1j

" }}}
" Elm {{{

let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

nnoremap <F3> :ElmFormat<CR>

" Integration with neocomplete
call neocomplete#util#set_default_dictionary( 
	\ 'g:neocomplete#sources#omni#input_patterns',
	\ 'elm',
	\ '\.')

" }}}
" Editing {{{


" Open vertical buffer and switch
nnoremap <leader>w <C-w>v<C-w>l

" Easy buffer navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ctrl S save
nnoremap <c-s> :w

" Yank to end of the line
nnoremap Y y$

" Break line with enter
nnoremap <CR> o<Esc>

nnoremap gv `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`

" }}}
" Hyper.is {{{

" Hyper is awesome but fkin keymaps...
" God bless Ç
inoremap Çx <C-X>
inoremap Ça <C-A>
inoremap Çk <C-K>
inoremap Çs <C-S>
inoremap Çw <C-W>
inoremap Çv <C-V>
inoremap Çt <C-T>
inoremap Çd <C-D>
inoremap Çr <C-R>
inoremap Çl <C-L>
inoremap Çn <C-N>
inoremap Çx <C-X>
" }}}
" Vim UI {{{


set t_Co=256
set background=dark
colorscheme nova

" Italics on comments and html attrs
highlight Comment gui=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight htmlArg cterm=italic

set foldcolumn=0

" Toggle line numbers
nnoremap <leader>n :setlocal relativenumber!<cr>

" }}}
" Search {{{
set number

" Ack search
nnoremap <leader>a :Ag

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Set Mark
nnoremap <leader>m `

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" }}}
" Copy Pasta {{{

" Toggle Paste mode
set pastetoggle=<F2>

" Clipboard registry defaults to system's
set clipboard=unamed

"Access clipboard registry
nnoremap <leader>c "+

" Reselect pasted text
nnoremap <leader>v V`]

"}}}
" Convenience {{{

" Open and save vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :w<cr> :source $MYVIMRC<cr>

" }}}
" NerdTree Settings {{{

" Refresh NerdTree Folders
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>

map <Leader>N :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 &&  
                   \ exists("b:NERDTreeType") &&
                   \ b:NERDTreeType == "primary") | q | endif


let NERDTreeHighlightCursorline = 1 
let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                   \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                   \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                   \ '^tags$', 'node_modules', 'elm-stuff',
                   \ '.*\.bcf$', '.*\.blg$', '.*\.fdb_latexmk$', '.*\.bbl$', '.*\.aux$', '.*\.run.xml$', ' .*\.fls$',
                   \ '.*\.midi$']

let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 
let NERDChristmasTree = 1 
let NERDTreeChDirMode = 2 
let NERDTreeMapJumpFirstChild = 'gK'

" }}}
" Ctrl P {{{

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_custom_ignore = '\v[\/](node_modules|elm-stuff|target|dist)|(\.(swp|ico|git|svn))$'

" }}}
" UltiSnips {{{

" Trigger configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Default method (variable) does not work. Don't ask me why
" <tab> already used for completion with Neocomplete.
inoremap ç<tab> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
inoremap çb <C-R>=UltiSnips#JumpBackwards()<CR>

" }}}
" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files"

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}
" Incsearch {{{

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>/ <Plug>(incsearch-easymotion-stay)

" Disables hlsearch after search-related motions
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" " }}}
" Instant Markdown {{{
let g:instant_markdown_autostart=0
nnoremap Çmd :InstantMarkdownPreview<CR>
" }}}
" UltiSnips {{{

" Trigger configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Default method (variable) does not work. Don't ask me why
" <tab> already used for completion with Neocomplete.
inoremap ç<tab> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
inoremap çb <C-R>=UltiSnips#JumpBackwards()<CR>

" }}}
" Neocomplete {{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
