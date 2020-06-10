"   VIM - Configurações Básicas
" ------------------------------------

"   BASIC SETUP
" -----------

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on                 " Enable filetype detect
syntax on                   " Enable Sintax Highlight
filetype plugin indent on   " Enable VIM Plugins

" Rebind <Leader> key
" By default leader key is \ (backslash)
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = "\<space>"


" Mouse, backspace and cursor
set mouse=a                 " on OSX press ALT and click
set bs=2                    " make backspace behave like normal again
set cursorline              " Show cursor line

" Disable annoying beeping
set noerrorbells
set vb t_vb=

" Real programmers don't use TABs but spaces
set expandtab               " Convert tabs to spaces
set tabstop=4               " Indent using four spaces.
set softtabstop=4
set shiftwidth=4
set shiftround              " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set autoindent              " New lines inherit the indentation of previous lines


" Showing line numbers, length and wrap
set number                  " show line numbers
set showbreak=...           " add "..." when line wrapping
set tw=79                   " width of document (used by gd)
"set nowrap                 " don't automatically wrap on load
"set fo-=t                  " don't automatically wrap text when typing
set linespace=4             " add some line space for easy reading
set colorcolumn=80
highlight colorcolumn ctermbg=243


" INDETENTION
"-------------
" Set TAB and Shift-TAB
"nnoremap <Tab> >>_
"nnoremap <S-Tab> <<_
"inoremap <S-Tab> <C-D>
"vnoremap <Tab> >gv
"vnoremap <S-Tab> <gv
" Other Options
"" " easier moving of code blocks
"" " Try to go into visual mode (v), thenselect several lines of code here and
"" " then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" SEARCH - Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-l>`` stands for ``CTRL+l``
noremap <C-l> :nohl<CR>
vnoremap <C-l> :nohl<CR>
inoremap <C-l> :nohl<CR>


"   COPY AND PASTE
"----------------------
set clipboard=unnamedplus
" Copy to Clipboard
vnoremap <leader>y "+y
" Paste from Clipboard
noremap <leader>p "+p
" Copy to Primary Area
vnoremap <leader>Y "*y
" Paste from Primary Area
noremap <leader>P "*p


"   OTHER THINGS
"----------------------

set path+=**        " Enable search in sub-folders
set wildmenu        " Display all matching files when we tab complete
set nocompatible    " Use Vim settings, rather then Vi settings (much better!).

set encoding=UTF-8

" Easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" Quicksave command
"" noremap <C-Z> :update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
"" map <c-j> <c-w>j
"" map <c-k> <c-w>k
"" map <c-l> <c-w>l
"" map <c-h> <c-w>h


"==============================================================================
" Omnifunction
"==============================================================================
"set omnifunc=syntaxcomplete#Complete
"" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"" let g:SuperTabDefaultCompletionType = "context"

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim

"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction
""
"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
"==============================================================================

""      VIM PLUG
""      --------
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'          " Airline
Plug 'vim-airline/vim-airline-themes'   " Airline Themes
Plug 'scrooloose/nerdtree'              " NerdTree
Plug 'xuyuanp/nerdtree-git-plugin'      " NerdTree Git
Plug 'scrooloose/nerdcommenter'         " NerdTree commenter
Plug 'ryanoasis/vim-devicons'           " Devicons
Plug 'nathanaelkane/vim-indent-guides'  " Indent Guides
Plug 'tpope/vim-fugitive'               " Vim Fugitive
Plug 'airblade/vim-gitgutter'           " GitGutter
Plug 'junegunn/goyo.vim'                " Distraction Free
Plug 'kien/ctrlp.vim'                   " CtrlP - Search engine
Plug 'raimondi/delimitmate'             " Autoclose quotes, parentheses, etc ...
Plug 'tomasr/molokai'                   " Molokai Colorscheme
Plug 'gruvbox-community/gruvbox'        " Gruvbox Colorscheme
Plug 'SirVer/ultisnips'
" Track the engine.

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

call plug#end()

" SHOW WHITHESPACE
" MUST be inserted BEFORE the colorscheme command

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

"==============================================================================
"   COLORSCHEME
"==============================================================================
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" Download and put your colorschemes in colors/
"
set t_Co=256
colorscheme gruvbox
"
"" Opções Colorscheme:
" afterglow, wombat256mod, railscasts2
"
" Set colortheme for file type
" autocmd WinEnter,FileType * colorscheme wombat256mod
" autocmd WinEnter,FileType javascript colorscheme desert256
" autocmd WinEnter,FileType html,css colorscheme molokai  " This includes default filetype colorscheme.
" autocmd WinEnter,FileType python colorscheme dracula
"" Some options: gruvbox, materialbox, cobalt2, codedark, dracula, molokai, wombat256mod
""happy_hacking, jelleybeans, kruby, landscape, lapis256, monokai-phoenix, tir_black, inkpot



"       PLUGINS CONF
"       -----------

" Airline
"
set noshowmode          " Don't show mode(insert, visual, etc...)
let g:airline#extensions#tabline#enabled = 1    " Enable airline extension
" let g:airline_symbols = 1                       " Integration Powerline Symbols
let g:airline_powerline_fonts = 1               " Integration Powerline fonts
let g:airline#extensions#whitespace#enabled = 1 " Whitespace Machine enable/disable detection of whitespace errors.


" Airline Themes

"
let g:airline_theme='gruvbox'
" options: bubblegum, luna, fairyfloss, fruit_puncha, hybridline,
" jellybeans, kolor, molokai, murmur, onedark, ravenpower, tomorrow,

" NerdTree
"
map <C-b> :NERDTreeToggle<CR>

" Nerd Git Plugin
"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Indent Guides
"
let g:indent_guides_enable_on_vim_startup = 1   " Enable on starup

" GitGutter
"
" let g:gitgutter_highlight_lines = 1    " To turn on line highlighting by default

"   NerdCommenter

"" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

"" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

"" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

"" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

"" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

"" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1

"" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

"" Enable NERDCommenterToggle to check all selected lines is commented or not
"let g:NERDToggleCheckAllLines = 1

"    ULTISNIPERs

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


