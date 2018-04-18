call plug#begin('~/.config/vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'rstacruz/sparkup'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'digitaltoad/vim-pug'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-rails'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
:set scrolloff=10
:set shiftwidth=2
:set synmaxcol=300
:set tabstop=2
:set number relativenumber  " Show line numbers

" Auto toggle out of relative numbers for unfocused split
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Omnicomplete stuff
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
:set completeopt+=noselect,menu,preview
" let enter be used to select item
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
nnoremap <leader>m o@import respond-to(){}<Esc>F{a<CR><CR><Esc>kk$F(a

" JS Stuff
" TS indenting
au FileType typescript setl sw=4 sts=4 et
" vim js pretty template strings
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
" Ale Fixers
let g:ale_fixers = {
\   'typescript': ['tslint'],
\   'scss'      : ['stylelint']
\}

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
let NERDTreeShowLineNumbers=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Auto watch vimrc for changes and reload.
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Fugitive

set diffopt+=vertical
highlight DiffAdd    term=bold ctermfg=0 ctermbg=2 guifg=#2b2b2b guibg=#a5c261
highlight DiffDelete term=bold ctermfg=0 ctermbg=1 gui=bold guifg=#2b2b2b guibg=#da4939
highlight DiffChange term=bold ctermfg=0 ctermbg=4 guifg=#2b2b2b guibg=#6d9cbe
highlight DiffText   term=reverse cterm=bold ctermfg=0 ctermbg=4 gui=bold guifg=#2b2b2b guibg=#6d9cbe

" UltiSnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
