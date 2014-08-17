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
set number
colorscheme lucario
set autoindent

"Toggle auto-indenting for code paste
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F2>

set laststatus=2

set encoding=utf-8  " Define file to utf-8

" Easily increase and decrease next number with ctrl+k and ctrl+j
nnoremap <C-k> <C-a>
nnoremap <C-j> <C-x>

" tab navigation
" nnoremap <C-S-Tab> :tabprevious<CR>
nnoremap <C-a>     :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-w>     :tabclose<CR>

"inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
inoremap <C-a>     <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-w>     <Esc>:tabclose<CR>

set cursorline " Highlight current line
set expandtab " Expand tabs to spaces
set wrapscan " Searches wrap around end of file
set history=1000 " Increase history from 20 default to 1000

" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" Jade
au BufRead,BufNewFile *.jade set ft=jade syntax=jade

" Common Ruby files
au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

" Nu
au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu

" Coffee Folding
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" ZSH
au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh

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
