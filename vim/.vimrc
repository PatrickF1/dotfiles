" Plugins are stored under ~/.config/nvim/plugged
call plug#begin()
Plug 'tpope/vim-sensible'
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
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()
