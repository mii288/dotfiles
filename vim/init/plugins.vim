if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundles')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
" set runtimepath+=s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_dir)

  call dein#add('Shougo/deoplete.nvim', {
  \   'hook_add': 'let g:deoplete#enable_at_startup = 1'
  \ })

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#load_toml('~/dotfiles/vim/plugins/install/dein.toml', {'lazy': 0})
  call dein#load_toml('~/dotfiles/vim/plugins/install/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

