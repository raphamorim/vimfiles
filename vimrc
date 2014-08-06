"q Configuration file for vim
set modelines=0		" CVE-2007-2438

set nowrap
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Enable syntax and Lucario (usign number)
syntax enable
syntax on
set number
colorscheme lucario

"Toggle auto-indenting for code paste
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F2>

" Identation Guide (3 levels)
" http://stackoverflow.com/questions/2158305/is-it-possible-to-display-indentation-guides-in-vim
:match Search /\%(\_^\s*\)\@<=\%(\%1v\|\%5v\|\%9v\)\s/

set laststatus=2

set encoding=utf-8  " Define file to utf-8

" Easily increase and decrease next number with ctrl+k and ctrl+j
nnoremap <C-k> <C-a>
nnoremap <C-j> <C-x>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-w>     <Esc>:tabclose<CR>

" highlight search
:set hls
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tmuxline#enabled = 0

set noswapfile " Disable .swp file create

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
