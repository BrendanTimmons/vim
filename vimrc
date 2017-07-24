call plug#begin('~/.config/vim/plugged')
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-pug'
Plug 'isRuslan/vim-es6'
Plug 'kien/ctrlp.vim'
Plug 'rstacruz/sparkup'
Plug 'scrooloose/nerdtree'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-fugitive'
call plug#end()

syntax on
filetype plugin indent on
:set t_Co=256
colorscheme Tomorrow-Night-Eighties

:set cursorline
:set expandtab
:set formatoptions-=cro
:set incsearch
:set laststatus=2
:set number
:set omnifunc=csscomplete#CompleteCSS
:set scrolloff=10
:set shiftwidth=2
:set synmaxcol=300
:set tabstop=2

" Remap leader key to space
let mapleader = "\<space>"
:set timeout timeoutlen=100

" Remap jk to save and exit insert mode
:imap jk <Esc>:w<CR>

" HTML Stuff
let g:html_indent_tags = 'p\|li\|nav'

" CSS Stuff
autocmd BufNewFile,BufRead *.scss :set ft=scss.css
nnoremap <leader>; 02Wdv$i
nnoremap <leader>s vi{:sort<CR>

" Ctrl+P setup.
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" NerdTree 
nnoremap <leader>n :NERDTree ~/Sites<CR>
nnoremap <leader>r :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Auto watch vimrc for changes and reload.
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
