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
