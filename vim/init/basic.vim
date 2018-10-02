set synmaxcol=200
set timeoutlen=1000 ttimeoutlen=0

" カーソルの速度
set lazyredraw
set ttyfast

" vimからファイルを開くときにリストを表示する
set wildmenu
set wildmode=list:full

" 検索設定
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" インクリメンタルサーチ. １文字入力毎に検索を行うooo
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch

" _を単語に含めない
set iskeyword-=_

" インデントをスペース4つに
set tabstop=2
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" 改行時コメントアウトさない
setlocal formatoptions-=r
setlocal formatoptions-=o

set guioptions+=a
set clipboard=unnamed

" バックスペースキーで削除できるものを指定
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

" コマンドモードの補完
set wildmenu

