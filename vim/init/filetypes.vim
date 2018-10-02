au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufNewFile,BufRead *.ts,*.tsx setlocal filetype=typescript
