set mouse=a

let mapleader = "-"
inoremap <C-d> <Del>
vnoremap <Leader>x :!pbcopy<CR>  
vnoremap <Leader>c :w !pbcopy<CR><CR> 

" Plugins are stored under ~/.config/nvim/plugged
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  map 0 g0
  map $ g$
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  " setlocal spell spelllang=en_us
  " set thesaurus+=/Users/patrick.fong/.local/share/nvim/moby-thesaurus.txt
  " complete+=s makes autocompletion search the thesaurus
  " set complete+=s
endfu
com! WP call WordProcessor()
