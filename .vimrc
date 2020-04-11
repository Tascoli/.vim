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
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
        " Other Options
        "" " easier moving of code blocks
        "" " Try to go into visual mode (v), thenselect several lines of code here and
        "" " then press ``>`` several times.
        "" vnoremap < <gv  " better indentation
        "" vnoremap > >gv  " better indentation

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

" SHOW WHITHESPACE
" MUST be inserted BEFORE the colorscheme command

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * match ExtraWhitespace /\s\+$/


"==============================================================================
"   COLORSCHEME
"==============================================================================
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" Download and put your colorschemes in colors/
"
set t_Co=256
colorscheme afterglow
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

" Coloque aqui seus pluings

" Initialize plugin system
call plug#end()

