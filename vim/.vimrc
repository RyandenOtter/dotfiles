" ------------------------------------------------------------------------
" Plugins
" We use the vim-plug plugin manager
" https://github.com/junegunn/vim-plug
" -----------------------------------------------------------------------
" We don't want vim to muddy our directories with swap files.
set directory^=$HOME/.vim/swap// " change the default save location of the swap files

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux."
if (has("nvim"))
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
set termguicolors
endif

" Install the vim-plug plugin manager if it is not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" nordvim color scheme
Plug 'arcticicestudio/nord-vim'

" Trying out this new markdown plugin
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'

" Install NerdTree
Plug 'preservim/nerdtree'
" Initialize the plugin system

call plug#end()

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme nord 
syntax on
