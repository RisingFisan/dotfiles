call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" auto closes brackets and shit 
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'

Plug 'airblade/vim-gitgutter'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'wincent/terminus'

call plug#end()

colorscheme dracula
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
set number
set clipboard+=unnamedplus

let g:deoplete#enable_at_startup = 1 
call deoplete#custom#option('smart_case', v:true)
let g:deoplete#sources#jedi#show_docstring = 1
