" Title:        vim-vine
" Description:  easy use to vine on vim
" Maintainer:   Antonio Almeida <https://github.com/daltonypng>

" Prevents the plugin from being loaded multiple times.
if exists("g:vine_already_loaded")
    finish
endif

let g:vine_already_loaded = 1

" Exposes the plugin's functions for use as commands in Vim.
:command -nargs=* Vine :call VineSeek(<args>)

function! VineSeek(...)

    let search = get(a:, 1, expand("<cword>"))
    let fileExtension = get(a:, 2, '.' . expand("%:e"))

    echo 'Searching "' . search . '" in ' . fileExtension . ' files'

    silent! execute '!vine .' . search . ' ' . fileExtension . ' > .vine'
    silent! execute 'view .vine'

endfunction!

" opening current line file

function! VineOpen()

    let line = getline('.')

    if len(line) > 0
        let splited_file_line = split(line, '->')

        if len(splited_file_line) > 0

            let splited_splited_file_line = split(splited_file_line[0], ':')

            silent! execute 'edit ' . splited_splited_file_line[0]
            silent! execute ':' . splited_splited_file_line[1]

        endif

    endif

endfunction!
