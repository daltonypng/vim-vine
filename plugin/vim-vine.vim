" Title:        vim-vine
" Description:  easy use to vine on vim
" Maintainer:   Antonio Almeida <https://github.com/daltonypng>

" Prevents the plugin from being loaded multiple times.
if exists("g:vine_already_loaded")
    finish
endif

let g:vine_already_loaded = 1

" Exposes the plugin's functions for use as commands in Vim.
:command -nargs=0 Vine :call VineSeek()

funct! VineSeek()
    echo 'Searching...'
    let fileExtension = '.' . expand("%:e")
    silent! execute '!vine ' . expand("<cword>") . ' ' . fileExtension . ' > .vine'
    silent! execute 'view .vine | echo "Done"'
endfunct!

" opening current line file

function! VineOpen()

    let line = getline('.')

    if len(line) > 0
        let splited_file_line = split(line, '->')

        if len(splited_file_line) > 0

            let splited_splited_file_line = split(splited_file_line[0], ':')

            silent! execute 'edit ' . splited_splited_file_line[0]
            silent! execute ':' . splited_splited_file_line[1]
            zz

        endif

    endif

endfunction!
