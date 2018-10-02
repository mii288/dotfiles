" PHP
let g:php_phpcs_use_global = 1
let g:ale_php_phpcs_standard = 'phpcs.xml'

" JavaScript
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['tslint'],
\ 'vue': ['eslint'],
\ 'php': ['phpcbf'],
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
