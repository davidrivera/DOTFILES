set nocompatible

colorscheme romockee

"|||||||| Pathogen:

" call pathogen#infect('~/.vim/unbundled')
execute pathogen#infect()

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'

"|||||||| GVim:

if has('gui_running')
  set guioptions+=TLlRrbm
  set guioptions-=TLlRrbm
  set guifont=Droid\ Sans\ Mono\ Slashed\ 8
  colorscheme Goldfish 
  set guicursor+=i-n-v-c:blinkon0
  map  <A-M> :set guioptions-=m<CR>
  map  <A-m> :set guioptions+=m<CR>
endif

"|||||||| Global options:

syntax on
filetype off
filetype plugin on
filetype indent on
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,cp866
set backspace=indent,eol,start
set t_Co=256
set ic
set hls
set number
set nobackup
set noswapfile
set nowb
set showmatch
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set mouse=a
set autoindent
set smartindent
set ruler
set so=3
set hidden
set showmode
set clipboard=unnamed
set wildmenu
set wildmode=longest,full
set laststatus=2
set history=200
set undolevels=1000
set autoread
set colorcolumn=100
" 80
" set lazyredraw
" set foldcolumn=1

"|||||||| Hotkeys und Shortcuts:

set      pastetoggle=<F2>
imap     <F1>           <Nop>
map      <F1>           :QFix<Return>
imap     <F4>           <Esc><leader><leader><leader>i
map      <F4>           <leader><leader><leader>
vmap     <F4>           <leader><leader><leader>
imap     <F5>           <Esc><S-V>yi
imap     <F6>           <Esc>pi
map      <S-Tab>        :BufExplorer<CR>
imap     <S-Tab>        :BufExplorer<CR>
map      <F7>           <Esc>:Spacepaste<CR>
nmap     <C-F10>        :qa!<cr>
vmap     <C-F10>        <esc>:qa!<cr>i
imap     <C-F10>        <esc>:qa!<cr>i
map      <C-F11>        <Esc>:NERDTreeToggle<CR>
imap     <C-F12>        <Esc>:set<Space>nu!<CR>a
nmap     <C-F12>        :set<Space>nu!<CR>
nmap     <leader><ESC>  :qa!<CR>
nmap     <leader>w      :w!<CR>
nmap     <leader>q      :q!<CR>
nmap     <leader>R      :!ruby %<CR>
nnoremap <C-L>          :nohls<CR><C-L>
inoremap <C-L>          <C-O>:nohls<CR>
nmap     <C-Down>       ddp=kj
nmap     <C-Up>         ddkP=j
vmap     <C-Up>         xkP`[V`]=
vmap     <C-Down>       xp`[V`]=
map      <Insert>       <Nop>
imap     <Insert>       <Nop>
imap     <C-Z>          <Esc>ui
map      <C-Z>          <Nop>
nmap     <C-k>          <PageUp>
nmap     <C-j>          <PageDown>
imap     <F8>           <End><CR>
imap     <C-F8>         <End><CR><CR><CR><Up>
imap     <F9>           <Left>
imap     <F10>          <Down>
imap     <F11>          <Up>
imap     <F12>          <Right>
imap     <C-\>          <Esc>
vmap     <C-\>          <Esc>
nmap     <C-\>          <Esc>
nmap     <C-C>          :!clear<CR><CR><C-F9>
imap     <C-K>          <Esc>ddi
" imap     <C-k>     <Plug>(neusnippet_expand_or_jump)
" smap     <C-k>     <Plug>(neosnippet_expand_or_jump)

nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

"|||||||| Neocomplcache:

" let g:neocomplcache_enable_at_startup = 1

"|||||||| PowerLine:

" let g:Powerline_symbols = 'fancy'

"|||||||| Tabular:

" let g:tabular_loaded = 1

"|||||||| vim-ruby:

let g:rubycomplete_rails = 1
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1

"|||||||| Slime:

let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

"|||||||| C-support:

" let g:C_CFlags = 
" let g:C_CCompiler = 'gcc'
" let g:C_CCompiler = 'clang'
" let g:C_CCompiler = 'icc'

"|||||||| Syntastic:

set statusline+=%#warningmsg#
set statusline+=%*
let g:syntastic_error_symbol='✖'
let g:syntastic_warning_symbol='►'
let g:syntastic_auto_jump=1

"|||||||| Autocmd:

au! FileType python setlocal et sw=4 ts=4 sts=4
au! FileType ruby,html,haml,eruby,yaml,sass,cucumber,jade setlocal et sw=2 ts=2 sts=2

"|||||||| Abbreviations:

ab #!b #!/bin/bash
ab #!r #!/usr/bin/ruby19
ab #!p #!/usr/bin/python3
ab #e  # encoding: utf-8

"|||||||| Vimux:

map <Leader>rb :w<CR>:call VimuxRunCommand("clear; rb " . bufname("%"))<CR>
map <Leader>]  :w<CR>:call VimuxRunCommand("clear; rb " . bufname("%"))<CR>
map <Leader>p  :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>rp :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rx :VimuxClosePanes<CR>
map <Leader>[  :VimuxClosePanes<CR>
map <Leader>rq :VimuxCloseRunner<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>rh :let g:VimuxOrientation="v"<CR>
map <Leader>rv :let g:VimuxOrientation="h"<CR>
let g:VimuxHeight = "50"

"|||||||| Autopairs:

au FileType ruby inoremap { {  }<Left><Left>
au FileType ruby inoremap <Bar> <Bar><Bar><Left>
au FileType ruby inoremap <kHome> <space><Char-61><Char-62><space>
au FileType ruby imap     <C-C> <C-X><C-O>

inoremap ,  ,<Space>
inoremap ;  ;<Space>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

"|||||||| QFix:

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
if exists("g:qfix_win") && a:forced == 0
cclose
else
copen
endif
endfunction
augroup QFixToggle
autocmd!
autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END


