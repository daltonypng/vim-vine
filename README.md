# vim-vine

Neovim plugin to use with [vine-finder](https://github.com/daltonypng/vine-finder)

## sugested keymappings

```
" Search on current word filtering by current file extension
nnoremap <C-f> :Vine<CR>

" Open to fill with other values than the defaults
nnoremap <leader>f :call VineSeek('', '.')

" Open current shown match
nnoremap <leader><CR> :call VineOpen()<CR>

```
