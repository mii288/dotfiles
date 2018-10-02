" □や○文字が崩れる問題を解決
set ambiwidth=double

"行番号を表示する
set number

"編集中のファイル名を表示
set title

" 括弧の対応関係を表示する
set showmatch

"オートインデント
set cindent

" Vimの「%」を拡張する
source $VIMRUNTIME/macros/matchit.vim

set list
set listchars=tab:▸-,trail:.,eol:↲,extends:▸,precedes:<,nbsp:%

" ディレクトリの場合はディレクトリツリーを表示
let g:netrw_liststyle=3

" vimからファイルを開くときにリストを表示する
set wildmenu
set wildmode=list:full

" colorscheme
set t_Co=256

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" シンタックスハイライト
syntax enable

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

