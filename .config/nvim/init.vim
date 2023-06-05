set mouse=a

let mapleader = "-"
inoremap <C-d> <Del>
vnoremap <Leader>x :!pbcopy<CR>
vnoremap <Leader>c :w !pbcopy<CR><CR>

" Plugins are stored under ~/.config/nvim/plugged
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
call plug#end()

