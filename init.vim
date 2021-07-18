call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme nord

:set number
:set autoindent
:set mouse=a
:set cursorline
:set smartcase
:set linebreak
	
let mapleader = ","


let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"""" rebinds
" force write sudo
cmap w!! w !sudo tee > /dev/null %

" nerd tree remaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" wintabs
map <C-H> <Plug>(wintabs_previous)
map <C-L> <Plug>(wintabs_next)
map <C-W> <Plug>(wintabs_close)
