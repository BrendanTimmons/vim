call plug#begin('~/.config/vim/plugged')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'rstacruz/sparkup'
  Plug 'chriskempson/base16-vim'
  Plug 'w0rp/ale'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
  Plug 'tpope/vim-surround'
  Plug 'brooth/far.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/ingo-library'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
call plug#end()

"colours
syntax on
filetype plugin indent on
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
:set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Use PHP syntax highlighting for squarespace templates
autocmd BufNewFile,BufRead *.list,*.item,*.block set syntax=php

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
:set wrap
:set noerrorbells visualbell t_vb=
:set previewheight=24
autocmd GUIEnter * set visualbell t_vb=
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Different cursors in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

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

" Remap tf/jk to save and exit insert mode
:imap tf <Esc>:w<CR>
:imap jk <Esc>:w<CR>

" commit shortcut for fugitive
nnoremap <leader>c :Gcommit<CR>

" HTML Stuff
let g:html_indent_tags = 'p\|li\|nav'

" CSS Stuff
autocmd BufNewFile,BufRead *.scss :set ft=scss.css
nnoremap <leader>; 02Wdv$i
nnoremap <leader>s vi{:sort<CR>
nnoremap <leader>m o@import respond-to(){}<Esc>F{a<CR><CR><Esc>kk$F(a

" JS Stuff
au FileType typescript setl sw=2 sts=2 et
"autocmd FileType typescript syn clear foldBraces
" Ale Fixers
let g:ale_fixers = {
\   'typescript': ['prettier', 'eslint'],
\   'scss'      : ['stylelint']
\}
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)
let g:ale_lint_on_text_changed = 'never' 
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
highlight ALEError ctermbg=Red
highlight ALEError ctermfg=Black

"fzf use ctrl+p bind
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :Rg<Cr>

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Auto watch vimrc for changes and reload.
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Fugitive
set diffopt+=vertical
autocmd BufReadPost fugitive://* set bufhidden=delete

" Fardo use ripgrep
let g:far#source="rgnvim"



" CoC config
" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" keybinds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <leader>rn <Plug>(coc-rename)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
