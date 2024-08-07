set laststatus=2
let g:lightline = {
    \   'colorscheme': 'tokyonight',
    \   'mode_map': {'c': 'NORMAL'},
    \   'active': {
    \     'left': [
    \       ['mode', 'paste'],
    \       ['fugitive', 'gitgutter', 'filename'],
    \     ],
    \     'right': [
    \       ['lineinfo'],
    \       ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \       ['percent'],
    \       ['fileformat', 'fileencoding', 'filetype'],
    \     ]
    \   },
    \   'component_function': {
    \     'modified': 'MyModified',
    \     'readonly': 'MyReadonly',
    \     'fugitive': 'MyFugitive',
    \     'filename': 'MyFilename',
    \     'fileformat': 'MyFileformat',
    \     'filetype': 'MyFiletype',
    \     'fileencoding': 'MyFileencoding',
    \     'mode': 'MyMode',
    \     'gitgutter': 'MyGitGutter',
    \   }
    \ }

" ale
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

function! MyModified()
    return &filetype =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&filetype == 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype == 'unite' ? unite#get_status_string() :
        \  &filetype == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &filetype !~? 'vimfiler\|gundo' && exists('*fugitive#head')
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
    return winwidth('.') > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
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

