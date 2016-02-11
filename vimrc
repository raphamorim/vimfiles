"q Configuration file for vim
set modelines=0		" CVE-2007-2438

set nowrap
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4

" Changes leader key from "\" to ","
let mapleader = ","

" A running gvim will always have a window title, but when vim is run within an
" xterm, by default it inherits the terminal’s current title.
set title

" When the cursor is moved outside the viewport of the current window, the
" buffer is scrolled by a single line. Setting the option below will start the
" scrolling three lines before the border, keeping more context around where
" you’re working.
set scrolloff=15

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
set ignorecase

set textwidth=80

" Reset cursor position:
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

 " Use the mouse
set mouse=a

" Ctrl+c to copy to clipboard (only works when VIM is open)
map <C-c> "+y<CR>
nnoremap <C-c> "+y<CR>
inoremap <C-c> "+y<CR>

" Show trailing characters and undesirable spaces
set list
set listchars=tab:▸\ ,trail:·,nbsp:~

" Remove trailing spaces when save buffer
autocmd BufWritePre * :%s/\s\+$//e

set showmatch                       "blink matching bracket, etc
set visualbell

"set guifont=Monaco:h60
"set guifont=Monospace:h60
set guifont=Monospace\ 20

" Execute Pathogen
execute pathogen#infect()
filetype plugin indent on

"Toggle auto-indenting for code paste
"http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
set pastetoggle=<F2>

"Little trick that uses terminal's bracketed paste mode to automatically set/unset Vim's paste mode when you paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" End of trick


set laststatus=2

set encoding=utf-8  " Define file to utf-8

" Indenting
set backspace=indent,eol,start
set shiftwidth=4
set smartindent
set cindent
set showmatch " set show matching parenthesis

" <TAB> completion in command-mode
set wildmenu
set wildmode=list:longest

" better indentation
vnoremap > >gv
vnoremap < <gv

" Easily increase and decrease next number with ctrl+k and ctrl+j
nnoremap <C-k> <C-a>
nnoremap <C-j> <C-x>

" tab navigation
nnoremap <C-t><C-h>     :split<CR>
nnoremap <C-t><C-v>     :vsplit<CR>
nnoremap <C-t><C-w>     :hide<CR>
nnoremap <C-x>     :NERDTreeToggle<CR>

inoremap <C-t><C-h>     <Esc>:split<CR>
inoremap <C-t><C-v>     <Esc>:vsplit<CR>
inoremap <C-t><C-w>     <Esc>:hide<CR>
inoremap <C-x>          <Esc>:NERDTreeToggle<CR>

set cursorline " Highlight current line
set expandtab " Expand tabs to spaces
set wrapscan " Searches wrap around end of file
set history=1000 " Increase history from 20 default to 1000


" -- Syntax --

" Golang
au BufRead,BufNewFile *.go set ft=go syntax=c

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
