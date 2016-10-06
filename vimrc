source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
call pathogen#infect()
call togglebg#map("<F5>")

" Display Option
set title
set number
set ruler
set wrap
set scrolloff=3
set rnu
set completeopt=menu,longest

" Search Options
set ignorecase
set smartcase
set incsearch
set nohlsearch

" Bell
set visualbell
set noerrorbells

set backspace=indent,eol,start
set hidden

" Mappings
:let mapleader=","

" Cursor in terminal mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Mappings for escaping insert and visual mode
:inoremap jk <esc>
:nnoremap <leader>S :setlocal hlsearch!<cr>
" Mapping for upper case of word in insert mode and normal mode
inoremap <leader><c-u> <Esc>viwUea
nnoremap <leader><c-u> viwUe

" Mapping for quoting text
nnoremap <leader>" e<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' e<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" Specifics to plugins
" Mapping for toggling nerdTree
:noremap <C-n> :NERDTreeToggle<CR>
:let g:ctrlp_cmd='CtrlPBuffer'
:let g:netrw_list_hide= '.*\~$'
:let g:ctrlp_working_path_mode = 'c'
" :let g:netrw_keepdir=0

" Mapping for editing vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Mappings for windows manipulation
:nnoremap <leader>wo <c-w>o
:nnoremap <leader>ww <c-w>w
:nnoremap <leader>wW <c-w>W
:nnoremap <leader>wc <c-w>c

" Mapping for navigating in file
:nnoremap <leader>f <c-f>
:nnoremap <leader>b <c-b>
:nnoremap <leader>c ggdG

" Mapping for finding
:nnoremap <leader>g :exe "grep /s /x \"<cWORD>\"" getcwd() . "\\*"<cr>

" Mappings based of tags
nnoremap <leader>ts :execute "tselect" expand("<cword>")<cr>

" Mappings for folding block
nnoremap <leader>zf zfa{

" Mappings for exploring
nnoremap <leader>E :Explore<cr> Iiii

" Syntax Coloration
syntax enable

filetype on
filetype plugin on
filetype indent on

" Colors
set background=dark
colorscheme solarized
set guifont=Consolas:h11
set antialias


"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "let eq = ''
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "let cmd = '""' . $VIMRUNTIME . '\diff"'
      "let eq = '"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
  "  let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

" Autocommands for filetypes
" HTML
augroup filetype_html
	autocmd!
	autocmd FileType html :setlocal nowrap
	autocmd FileType html :setlocal shiftwidth=4
	autocmd FileType html :setlocal tabstop=4
	autocmd FileType html :setlocal softtabstop=4
	autocmd FileType html :setlocal expandtab
augroup END

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript,json,java,xml,yaml :setlocal nowrap
	autocmd FileType javascript,json,java,xml,yaml :setlocal shiftwidth=2
	autocmd FileType javascript,json,java,xml,yaml :setlocal tabstop=2
	autocmd FileType javascript,json,java,xml,yaml :setlocal softtabstop=2
	autocmd FileType javascript,json,java,xml,yaml :setlocal expandtab
augroup END

augroup filetype_cs
	autocmd!
	autocmd FileType cs :setlocal nowrap
	autocmd FileType cs :setlocal shiftwidth=4
	autocmd FileType cs :setlocal tabstop=4
	autocmd FileType cs :setlocal softtabstop=4
	autocmd FileType cs :setlocal expandtab
	autocmd FileType cs :nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs :nnoremap <buffer> gm :OmniSharpFindMembers<cr>
augroup END

augroup filetype_java
	autocmd!
	autocmd FileType java :setlocal nowrap
	autocmd FileType java :setlocal shiftwidth=4
	autocmd FileType java :setlocal tabstop=4
	autocmd FileType java :setlocal softtabstop=4
	autocmd FileType java :setlocal expandtab
augroup END

