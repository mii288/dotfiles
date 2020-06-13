" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" --- Utility
" Open files
Plug 'ctrlpvim/ctrlp.vim'
" Vim motion on speed!
Plug 'easymotion/vim-easymotion'
" Show yank history
Plug 'LeafCage/yankround.vim'
Plug 'irrationalistic/vim-tasks'
Plug 'rking/ag.vim'
" linter
Plug 'w0rp/ale'
" Run the ctags command
Plug 'soramugi/auto-ctags.vim'
" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'
" plugin to change WORD motion(E,W,B) for Japanese text using TinySegmenter
Plug 'deton/jasegment.vim'
" Toggle Comment
Plug 'tyru/caw.vim'
" a Git wrapper so awesome
Plug 'tpope/vim-fugitive'
" a Git wrapper so awesome
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'Townk/vim-autoclose'
Plug 'christoomey/vim-tmux-navigator'

" --- UI
" Colorscheme
Plug 'arcticicestudio/nord-vim'
" Customize status bar
Plug 'itchyny/lightline.vim'
" Highlight words under cursor
" Plug 'osyo-manga/vim-brightest'
" display indent with mark
Plug 'Yggdroot/indentLine'
" Adds gile glyphs/icons
Plug 'ryanoasis/vim-webdevicons'

" --- For HTML/CSS 
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'php', 'ctp', 'tsx'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }

" --- For JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'js' }

" --- For TypeScript
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }

" --- For PHP
" Xdebug client
Plug 'joonty/vdebug', { 'for': 'php' }

call plug#end()
