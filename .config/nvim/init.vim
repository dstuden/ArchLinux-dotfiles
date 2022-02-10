call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
call plug#end()

set number
set showmatch
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
let g:airline_theme='nord'

colorscheme nord
