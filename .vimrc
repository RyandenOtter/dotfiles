" ------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------

" Install the vim-plug plugin manager if it is not installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


" Initialize the plugin system
call plug#end()

" Gruvbox Community theme.
Plug 'gruvbox-community/gruvbox'

syntax enable 

" Set the color scheme
colorscheme gruvbox
set background=dark
