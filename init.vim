" 
" Vim settings for @mscoutermarsh
"

" Settings in this file may depend on plugins, so let's install them first.
" Not to be confused with the contents of ~/.vim/plugin/* which are
" configuration options for each plugin and automatically loaded by Vim.
call plug#begin('~/.local/share/nvim/plugged')
" Addons
Plug 'scrooloose/nerdtree'
"Plug 'alvan/vim-closetag'
" Plug 'vim-scripts/vim-auto-save'
Plug 'ayu-theme/ayu-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'blarghmatey/split-expander'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'roman/golden-ratio'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'

" File system navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Autocomplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Syntax errors
"Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'

"Linting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Markdown support
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive', { 'commit': '444ba9fda5d05aa14c7e8664fa4a66a59c62a550' }

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/NeoSolarized'

" Testing
Plug 'janko-m/vim-test'

" Gist
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
call plug#end()
" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

" CtrlP use FZF (faster!)
nnoremap <C-p> :Files<Cr>

syntax on
autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save in insert mode

" Get off my lawn - helpful when learning Vim :)
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>
"
"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

if has('nvim')
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set pyxversion=3
  syntax enable
  let background="light"
  let g:solarized_termcolors=256
  colorscheme solarized

endif

