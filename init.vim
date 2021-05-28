set runtimepath^=~/.vim runtimepath+=~/vim/after
let &packpath = &runtimepath

syntax on

set noerrorbells
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
let &undodir = stdpath('data').'/undodir'
set undofile
set showcmd
set scrolloff=6
set termguicolors
set updatetime=300
set cmdheight=2
set shortmess+=c
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Inc search y esc esc para borrar los hl
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <ESC><ESC> :nohls<CR>

call plug#begin(stdpath('data') . '/plugged')
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
"  Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
"  Plug 'junegunn/fzf.vim'
  Plug 'morhetz/gruvbox'
"  Plug 'jremmen/vim-ripgrep'
"  Plug 'vim-utils/vim-man'
"  Plug 'mbbill/undotree'
"  Plug 'preservim/nerdtree'
call plug#end()

"Gruvbox
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

let mapleader=" "

"Help
noremap <leader>h :h<space>

"Moverse entre ventanas
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

"Undo Tree y Nerd Tree
let g:undotree_SetFocusWhenToggle=1
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <Leader>t :NERDTreeToggle<Cr>

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

"Pegar yanked text sin sobrescribir el reg 
vnoremap <leader>p "_dP

"Guardar, salir y source
nnoremap <Leader>w :w<CR>
nnoremap <silent><Leader>q :q<CR>
nnoremap <Leader>ww :w<CR> :source %<CR>

"CoC mappings and configs
"Completion con tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" FZF
nnoremap <leader>f :Files<CR>

