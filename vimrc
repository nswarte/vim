source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
call pathogen#infect()
call togglebg#map("<F5>")

" Backup options
set nobackup

" Display Option
set colorcolumn=120
set title
set number
set ruler
set nowrap
set scrolloff=3
set rnu
set laststatus=2

" mintty terminal cursor setting
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Search Options
set ignorecase
set smartcase
set incsearch
" set nohlsearch
nnoremap <leader>* /jk<cr>

" wild menu
set wildmenu

" set path
set path+=**

" netrw options
let g:netrw_banner=0
let g:netrw_hide=1

" Bell
set visualbell
set noerrorbells

set backspace=indent,eol,start
set hidden

" Mappings
:let mapleader=","

" Mappings for escaping insert and visual mode
:imap jk <Esc>
:vmap ;; <Esc>

" Mapping for upper case of word in insert mode and normal mode
inoremap <leader><c-u> <Esc>viwUea
nnoremap <leader><c-u> viwUe

nnoremap <space> <c-^>

" mapping to enter visual block mode
nnoremap <leader>v <c-v>

" Mapping for editing vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Mapping for quicklist
:nnoremap <leader>o :copen<cr>
:nnoremap <leader>c :cclose<cr>

" Mapping for moving
:nnoremap <leader>f <c-f>
:nnoremap <leader>b <c-b>
:nnoremap <leader>d <c-d>

" Mappings for windows moves
:nnoremap <leader>w <c-w>

" Mapping to display Explorer
nnoremap <leader>E :Explore<cr>

" Syntax Coloration
syntax enable

filetype on
filetype plugin on
filetype indent on

"CtrlP settings
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_match_window = 'results:100'
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/](node_modules|target|dist\>)',
			\ 'file': '(\..*[~])$',
			\ }

" alternate buffer
nnoremap <tab> <c-^>

" YCM settings
let g:ycm_auto_trigger=0
nnoremap <leader>g :YcmCompleter GoToDefinition<cr>
nnoremap <leader>h :YcmCompleter GoToReferences<cr>

" Colors
set background=dark
colorscheme solarized
set guifont=Consolas:h10
set antialias

" Autocommands for various filetypes
augroup filetype_md
	autocmd!
	autocmd FileType markdown :setlocal tw=120
augroup END
augroup filetype_yaml
	autocmd!
	autocmd FileType yaml,conf :setlocal nowrap
	autocmd FileType yaml,conf :setlocal shiftwidth=2
	autocmd FileType yaml,conf :setlocal tabstop=2
	autocmd FileType yaml,conf :setlocal softtabstop=2
	autocmd FileType yaml,conf :setlocal expandtab
	autocmd FileType yaml,conf :setlocal foldmethod=indent
augroup END
augroup filetype_ts
	autocmd!
	autocmd filetype typescript :setlocal foldmethod=syntax
	autocmd filetype typescript :execute "normal zr"
augroup end
augroup filetype_js
	autocmd!
	autocmd FileType javascript,json,typescript :setlocal nowrap
	autocmd FileType javascript,json,typescript :setlocal shiftwidth=2
	autocmd FileType javascript,json,typescript :setlocal tabstop=2
	autocmd FileType javascript,json,typescript :setlocal softtabstop=2
	autocmd FileType javascript,json,typescript :setlocal expandtab
augroup END
augroup filetype_c_cpp
	autocmd!
	autocmd FileType c,cpp :setlocal tabstop=4
	autocmd FileType c,cpp :setlocal foldmethod=syntax
	autocmd FileType c,cpp :setlocal softtabstop=4
	autocmd FileType c,cpp :setlocal shiftwidth=4
augroup END
augroup filetype_xml
	autocmd!
	autocmd FileType xml :setlocal nowrap
	autocmd FileType xml :setlocal shiftwidth=2
	autocmd FileType xml :setlocal tabstop=2
	autocmd FileType xml :setlocal softtabstop=2
	autocmd FileType xml :setlocal expandtab
augroup END
augroup filetype_html
	autocmd!
	autocmd FileType html :setlocal nowrap
	autocmd FileType html :setlocal shiftwidth=2
	autocmd FileType html :setlocal tabstop=2
	autocmd FileType html :setlocal softtabstop=2
	autocmd FileType html :setlocal expandtab
augroup END

augroup help
	autocmd!
	autocmd FileType help :nnoremap <buffer> <enter> <c-]>
augroup END

set switchbuf +=useopen

" set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

