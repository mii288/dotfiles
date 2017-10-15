"dein Scripts-----------------------------
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
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_dir . '/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " --- Utility
  call dein#add('ctrlpvim/ctrlp.vim')                 " Open files
  call dein#add('easymotion/vim-easymotion')      " Vim motion on speed!
  call dein#add('LeafCage/yankround.vim')         " Show yank history
  call dein#add('rking/ag.vim')                    " agを使えるようにする
  call dein#add('w0rp/ale')                        " linter
  call dein#add('soramugi/auto-ctags.vim')         " Run the ctags command
  call dein#add('terryma/vim-multiple-cursors')    " True Sublime Text style multiple selections for Vim
  call dein#add('deton/jasegment.vim')             " plugin to change WORD motion(E,W,B) for Japanese text using TinySegmenter

  call dein#add('tyru/caw.vim')                    " Toggle Comment
  call dein#add('tpope/vim-fugitive')              " a Git wrapper so awesome
  call dein#add('tpope/vim-abolish')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('Townk/vim-autoclose')

  " --- Visual
  call dein#add('jacoborus/tender.vim')       " Colorscheme
  call dein#add('mhartington/oceanic-next')   " Colorscheme
  call dein#add('itchyny/lightline.vim')      " Customize status bar
  " dein#add('osyo-manga/vim-brightest')      " Highlight words under cursor
  call dein#add('Yggdroot/indentLine')        " display indent with mark
  call dein#add('ryanoasis/vim-webdevicons')     " Adds gile glyphs/icons

  " --- For PHP
  call dein#add('joonty/vdebug')       "Xdebug client

  " --- For HTML/CSS 
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('digitaltoad/vim-pug')          " hi jade
  call dein#add('mattn/emmet-vim')              " Emmet
  call dein#add('hail2u/vim-css3-syntax')       " css3

  " --- For JavaScript
  call dein#add('pangloss/vim-javascript')
  call dein#add('posva/vim-vue')        " Vim syntax highlighting for Vue components.

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" 文字コードの設定
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp9328
set fileformats=unix,dos,mac
" □や○文字が崩れる問題を解決
set ambiwidth=double

"####Filetype####

" css
au BufRead,BufNewFile *.scss set filetype=scss.css

"#####全般#####
set synmaxcol=200

"#####表示設定#####
set number      "行番号を表示する
set title       "編集中のファイル名を表示
set showmatch   " 括弧の対応関係を一瞬表示する
set cindent     "オートインデント
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set list
set listchars=tab:▸-,trail:.,eol:↲,extends:▸,precedes:<,nbsp:%

" カーソルの速度
set lazyredraw
set ttyfast

" vimからファイルを開くときにリストを表示する
set wildmenu
set wildmode=list:full

"#####検索設定#####
set wrapscan   "検索時に最後まで行ったら最初に戻る
set incsearch  " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase  " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch   " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

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

" _を単語に含めない
set iskeyword-=_

" インデントをスペース4つに
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab

" 改行時コメントアウトさない
setlocal formatoptions-=r
setlocal formatoptions-=o

set guioptions+=a
set clipboard+=unnamed,autoselect

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
noremap PP "0p
noremap x "_x

"#### コマンドモード #####
set wildmenu " コマンドモードの補完

" lightline.vim
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'oceanicnext',
    \ 'mode_map': {'c': 'NORMAL'},
    \ 'active': {
    \   'left': [
    \     ['mode', 'paste'],
    \     ['fugitive', 'gitgutter', 'filename'],
    \   ],
    \   'right': [
    \     ['lineinfo', 'ale'],
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
    \   'gitgutter': 'MyGitGutter',
    \   'ale': 'ALEGetStatusLine',
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
    return winwidth(0) > 120 ? &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : ''): 'no ft') : ''
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

" caw
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)


" ctrlp
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
let g:webdevicons_enable_ctrlp = 1

" 除外ファイルを設定
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" 検索対象をgit管理ファイルに限定
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](doc|tmp|node_modules)',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

" ctagsをタブで開く
map <C-]> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" agを使用する
if executable('ag')
    " キャッシュの利用
    let g:ctrlp_use_caching=0

    " ffで検索できるようにする
    nnoremap ff :<C-u>Ag<Space>
endif
" }}}

"" vim-easymotion.vim
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap s <Plug>(easymotion-s2)

"" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
nmap <C-n> <Plug>(yankround-next)

" インデント
" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_char = '▸'

" multiple cursor
" <ESC>を押したときに、カーソル位置が復元されるようにする
let g:multi_cursor_exit_from_insert_mode = 0

" ------------------------------------
" colorscheme
" ------------------------------------
" 256色
set t_Co=256
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme OceanicNext

" ------------------------------------
" HTML
" ------------------------------------
" 実行時のキーバインド変更する場合（ここではYからEに変更）
let g:user_emmet_leader_key = '<C-E>'

" ------------------------------------
" PHP
" ------------------------------------

" ------------------------------------
" JavaScript
" ------------------------------------
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint']
\ }

" @see http://graphemica.com/characters/tags/emoji
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '✨']

let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠ '
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0

let g:ale_lint_delay = 1000

" F8で修正
nmap <F8> <Plug>(ale_fix)

" vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
let g:vue_disable_pre_processors=1

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

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader><Leader> :call ToggleCheckbox()<CR>

" 選択行のチェックボックスを切り替える
function! ToggleCheckbox()
    let l:line = getline('.')
    if l:line =~ '\-\s\[\s\]'
    let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
    elseif l:line =~ '\-\s\[x\]'
    let l:result = substitute(l:line, '-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
    end
    endfunction

" クリップボードからペーストする時だけインデントしない
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

