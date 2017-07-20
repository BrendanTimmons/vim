call plug#begin('~/.config/vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'rstacruz/sparkup'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'digitaltoad/vim-pug'
Plug 'tomlion/vim-solidity'
Plug 'airblade/vim-gitgutter'
call plug#end()

syntax on
filetype plugin indent on
set t_Co=256
colorscheme Tomorrow-Night-Eighties

:set synmaxcol=300
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set number
:set laststatus=2
:set incsearch
:set scrolljump=35
:set cursorline
:set omnifunc=csscomplete#CompleteCSS
:set formatoptions-=cro
autocmd BufNewFile,BufRead *.scss       set ft=scss.css

" Remap leader key to space
let mapleader = "\<space>"
" NerdTree bindings
nnoremap <leader>n :NERDTree ~/Sites<CR>
nnoremap <leader>r :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
" Delete value of CSS property
nnoremap <leader>; 02Wdv$i
" Alphabetically Sort within {
nnoremap <leader>s vi{:sort<CR>

" Ignore files and folders in Ctrl+P
:set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

let g:html_indent_tags = 'p\|li\|nav'

" Remap jk to save and exit insert mode
:imap jk <Esc>:w<CR>
:set timeout timeoutlen=100
