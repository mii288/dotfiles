" 文字コードの設定
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
:set fileformats=unix,dos,mac
" ファイルエンコーディングや文字コードをステータス行に表示する
:set laststatus=2
:set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\(%v,%l)/%L%8P\ 

"#####表示設定#####
:set number "行番号を表示する
:set title "編集中のファイル名を表示
:set showmatch "括弧入力時の対応する括弧を表示
:syntax on "コードの色分け
:set smartindent "オートインデント

:set expandtab
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2

:setlocal formatoptions-=r
:setlocal formatoptions-=o

"#####検索設定#####
:set ignorecase "大文字/小文字の区別なく検索する
:set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
:set wrapscan "検索時に最後まで行ったら最初に戻る

"----------------------------------------------------
" neobundle.vim
"----------------------------------------------------
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/root/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/root/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'joonty/vim-xdebug'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
