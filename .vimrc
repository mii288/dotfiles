" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$HOME/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('$HOME/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
" --- Utility
NeoBundle 'ctrlpvim/ctrlp.vim'            " Open files
NeoBundle 'LeafCage/yankround.vim'        " Show yank history
NeoBundle 'osyo-manga/vim-over'           " :substitute preview
NeoBundle 'scrooloose/syntastic'          " linter
NeoBundle 'soramugi/auto-ctags.vim'       " Run the ctags command
NeoBundle 'terryma/vim-multiple-cursors'  " True Sublime Text style multiple selections for Vim
NeoBundle 'tyru/caw.vim'                  " Toggle Comment
NeoBundle 'tyru/open-browser.vim'         " browser open
NeoBundle 'tpope/vim-fugitive'            " a Git wrapper so awesome
NeoBundle 'easymotion/vim-easymotion'     " Vim motion on speed!
NeoBundle 'soramugi/auto-ctags.vim'       " Auto run ctags
NeoBundle 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits

" --- Visual
NeoBundle 'cocopon/iceberg.vim'      " Colorscheme
NeoBundle 'itchyny/lightline.vim'    " Customize status bar
NeoBundle 'osyo-manga/vim-brightest' " Highlight words under cursol
NeoBundle 'Yggdroot/indentLine'      " display indent with mark

" --- For PHP
NeoBundle 'joonty/vdebug' "Xdebug client

" --- For markdown
NeoBundle 'kannokanno/previm'             " Preview markdown
NeoBundle 'plasticboy/vim-markdown'       " hi markdown
NeoBundle 'violetyk/iikanji-markdown.vim' " util markdown

" --- For HTML/CSS 
NeoBundle 'digitaltoad/vim-pug' " hi jade
NeoBundle 'mattn/emmet-vim'     " Emmet

" Required:
call neobundle#end()
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" 文字コードの設定
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp9328
set fileformats=unix,dos,mac

"#####表示設定#####
set number      "行番号を表示する
set title       "編集中のファイル名を表示
set showmatch   "括弧入力時の対応する括弧を表示
set smartindent "オートインデント
set list
set listchars=tab:▸-,trail:.,eol:↲,extends:▸,precedes:<,nbsp:%
set ambiwidth=double

" 拡張子の設定
au BufRead,BufNewFile *.md set filetype=markdown


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
" set isk+=-

"#####編集設定####
"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
" 入力モードで矢印キーでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" インデントをスペース4つに
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab

setlocal formatoptions-=ro " 改行時コメントアウトさない

set guioptions+=a
set clipboard+=unnamed,autoselect

" caw
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"####backspace###
" バックスペースキーで削除できるものを指定
" indent : 行頭の空白
" eol    : 改行
" start  : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"####タブ設定####
nnoremap t; t
nnoremap t <Nop>
nnoremap to :<C-u>edit<Space>
nnoremap tt :<C-u>tabnew<Space>
nnoremap <silent> td :<C-u>tabclose<CR>

"#### keymap ####
" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k

" 削除キーでyankしない
nnoremap x "_x

" mouse
" set mouse=a
" set ttymouse=xterm2

" lightline.vim
set laststatus=2
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


"" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" ctrlp
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" 除外ファイルを設定
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
" 検索対象をgit管理ファイルに限定
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ctagsをタブで開く
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


" }}}

"" vim-easymotion.vim
let g:EasyMotion_do_mapping = 1 " Disable default mappings
" let g:EasyMotion_use_migemo = 1 " 日本語移動
let g:EasyMotion_smartcase = 1  " 小文字に限定
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)


"" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
nmap <C-n> <Plug>(yankround-next)

"" auto-ctags.vim
let g:auto_ctags = 1

"" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" インデント
" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '▸'

" ------------------------------------
" colorscheme
" ------------------------------------
syntax on
set t_Co=256
colorscheme iceberg

" ------------------------------------
" Custom Function
" ------------------------------------
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

" F12で行番号とか消す
nnoremap <silent><F12> :<C-u>call <SID>CopipeTerm()<CR>
function! s:CopipeTerm()
    if !exists('b:copipe_term_save')
        " 値が保存されていなければ保存後に各オプションをコピペ用に設定
        let b:copipe_term_save = {
        \     'number': &l:number,
        \     'relativenumber': &relativenumber,
        \     'foldcolumn': &foldcolumn,
        \     'wrap': &wrap,
        \     'list': &list,
        \     'showbreak': &showbreak
        \ }
        setlocal foldcolumn=0     " 折りたたみ情報表示幅
        setlocal nonumber         " 行番号
        setlocal norelativenumber " 相対行番号
        setlocal wrap             " 折り返し
        setlocal nolist           " 行末やタブ文字の可視化
        set showbreak=            " 折り返し行の先頭に表示されるマーク（こいつだけグローバル設定しかない）
    else
        " 保存されている場合は復元
        let &l:foldcolumn = b:copipe_term_save['foldcolumn']
        let &l:number = b:copipe_term_save['number']
        let &l:relativenumber = b:copipe_term_save['relativenumber']
        let &l:wrap = b:copipe_term_save['wrap']
        let &l:list = b:copipe_term_save['list']
        let &showbreak = b:copipe_term_save['showbreak']
        " 削除
        unlet b:copipe_term_save
    endif
endfunction

" .vim.local
augroup vimrc-local
autocmd!
autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
    endfor
endfunction
