" 文字コードの設定
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set smartindent "オートインデント
set list
set listchars=eol:¬,tab:»\ 

"全角スペースをハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

"set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set tabline=2

setlocal formatoptions-=r
setlocal formatoptions-=o

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set isk+=-

"#####編集設定####
set guioptions+=a
set clipboard+=unnamed,autoselect

" \cで行の先頭にコメントをつけたり外したりできる
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)

"####backspace###
set backspace=indent,eol,start

"####タブ設定####
nnoremap t; t
nnoremap t <Nop>
nnoremap to :<C-u>edit<Space>
nnoremap tt :<C-u>tabnew<Space>
nnoremap <silent> td :<C-u>tabclose<CR>

" ctagsをタブで開く
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"#### keymap ####
" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" 削除キーでyankしない
nnoremap x "_x

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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'joonty/vdebug'
NeoBundle "thinca/vim-quickrun"
NeoBundle "Shougo/vimproc"
NeoBundle "osyo-manga/shabadou.vim"
NeoBundle "osyo-manga/vim-watchdogs"
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'christoomey/vim-tmux-navigator'

" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'scrooloose/syntastic'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
" colorscheme
" syntax on
colorscheme zenburn

" lightline.vim
set laststatus=2
" lightline.vim
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [
			\     ['mode', 'paste'],
			\     ['fugitive', 'gitgutter', 'filename'],
			\   ],
			\   'right': [
			\     ['lineinfo', 'syntastic'],
			\     ['percent'],
			\     ['fileformat', 'fileencoding', 'filetype'],
			\   ]
			\ },
			\ 'component_function': {
			\   'modified': 'MyModified',
			\   'readonly': 'MyReadonly',
			\   'fugitive': 'MyFugitive',
		\   'filename': 'MyFilename',
		\   'fileformat': 'MyFileformat',
		\   'filetype': 'MyFiletype',
		\   'fileencoding': 'MyFileencoding',
		\   'mode': 'MyMode',
		\   'syntastic': 'SyntasticStatuslineFlag',
		\   'gitgutter': 'MyGitGutter',
		\ },
		\ 'separator': {'left': '⮀', 'right': '⮂'},
		\ 'subseparator': {'left': '⮁', 'right': '⮃'}
		\ }

function! MyModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
	return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
				\ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
				\ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			let _ = fugitive#head()
			return strlen(_) ? '⭠ '._ : ''
		endif
	catch
	endtry
	return ''
endfunction

function! MyFileformat()
	return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
	return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
	return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
	return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
	if ! exists('*GitGutterGetHunkSummary')
				\ || ! get(g:, 'gitgutter_enabled', 0)
				\ || winwidth('.') <= 90
		return ''
	endif
	let symbols = [
				\ g:gitgutter_sign_added . ' ',
				\ g:gitgutter_sign_modified . ' ',
				\ g:gitgutter_sign_removed . ' '
				\ ]
	let hunks = GitGutterGetHunkSummary()
	let ret = []
	for i in [0, 1, 2]
		if hunks[i] > 0
			call add(ret, symbols[i] . hunks[i])
		endif
	endfor
	return join(ret, ' ')
endfunction

" jslint
let g:syntastic_javascript_checker = "jshint" "JavaScriptのSyntaxチェックはjshintで
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施

"Linuxの場合はviminfoを用いてヤンクデータを共有
" let OSTYPE = system('uname')
" if OSTYPE == "Linux\n"
"     noremap y y:wv<CR>
"     noremap p :rv!<CR>p
" endif

" set viminfo='50,\"3000,:0,n~/.viminfo
