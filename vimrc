call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


set nocompatible
set et
set sw=4
set sts=4
set expandtab
set tabstop=4
set autoindent
set smartindent
let php_sql_query = 1
let php_folding = 1
let php_htmlInStrings = 1
set dir=~/.backup,/tmp
set mouse=a
set wildmenu

filetype on
filetype plugin on

"""" Searching and Patterns
set ignorecase							" search is case insensitive
set smartcase							" search case sensitive if caps on 
set incsearch							" show best match so far
set hlsearch							" Highlight matches to the search 

set foldmethod=indent
set foldnestmax=1

if has("autocmd")
  " Drupal *.module files.
  augroup module
    autocmd BufRead *.module set filetype=php
    autocmd BufRead *.install set filetype=php
  augroup END
endif

au BufRead,BufNewFile *.py  set ai sw=4 sts=4 et " Doc strs
au BufRead,BufNewFile *.js  set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.html set ai sw=2 sts=2 et " Doc strs
au BufRead,BufNewFile *.json set ai sw=4 sts=4 et " Doc strs
au BufNewFile *.py,*.pyw,*.c,*.h,*.json set fileformat=unix
au! BufRead,BufNewFile *.json setfiletype json 

" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"""" Display
set scrolloff=3							" Keep 3 lines below and above the cursor
set ruler								" line numbers and column the cursor is on
set number								" Show line numbering
set numberwidth=1						" Use 1 col + 1 space for numbers
syntax on


"""" GUI
if has("gui_macvim")
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  "set guifont=DroidSansMono:h12
  set linespace=2
  set guifont=Inconsolata:h15
  set autochdir
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
endif

set hlsearch
color wombat
let xml_use_xhtml = 1
let g:html_tag_case = 'lowercase'

augroup mkd
 autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

map <C-B> :!php -l %<CR>

set nobackup
set nowritebackup
set noswapfile


" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Show line number, cursor position.
set ruler

if has("gui_running")
  set colorcolumn=80
  set cursorline
endif

noremap <Leader>x ciw'<C-r>"<Esc>
vnoremap <Leader>x c'<C-r>"<Esc>

"Tags
set tags=~/.vimtags

"{{{ Mappings

" Buffer next, previous
imap <C-F> <C-X><C-O>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:bp<CR>
nnoremap <Left> <Esc>:bp<CR>
vnoremap <Left> <Esc>:bp<CR>

noremap <Right> <Esc>:bn<CR>
nnoremap <Right> <Esc>:bn<CR>
vnoremap <Right> <Esc>:bn<CR>

" Disable up/down arrow keys
noremap <up> <nop>
noremap <down> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>


" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

nnoremap <leader>u :!ctags -R -f ~/.vimtags --languages=Python ~/Work/minus/minus_core/<CR><CR>

"}}}
"{{{ Plugins

" Ack

" NERDTree
let NERDTreeIgnore=['\.pyc$']

" Mini Buffer Explorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" CommandT
nnoremap <leader>m :CommandT ~/Work/minus/minus_core/minus_com<CR>

" CloseTag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"Easytags
let g:easytags_by_filetype = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0

"YAIFA
let g:yaifa_max_lines = 512

"}}}

