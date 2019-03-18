" =============================================================================
" File:          autoload/ctrlp/make.vim
" Description:   Ctrl-p for Makefile targets
" Author:        Steffen Hirschmann <github.com/hirschsn>
" =============================================================================
"
if exists('g:loaded_ctrlp_make') && g:loaded_ctrlp_make
    finish
endif
let g:loaded_ctrlp_make = 1


if !exists('g:ctrlp_ext_vars') || empty(g:ctrlp_ext_vars)
    let g:ctrlp_ext_vars = []
endif
call add(g:ctrlp_ext_vars, {
            \ 'init': 'ctrlp#make#init()',
            \ 'accept': 'ctrlp#make#accept',
            \ 'lname': 'make',
            \ 'sname': 'make',
            \ 'type': 'line',
            \ 'enter': 'ctrlp#make#enter()',
            \ 'exit': 'ctrlp#make#exit()',
            \ 'opts': 'ctrlp#make#opts()',
            \ 'sort': 1,
            \ 'specinput': 0,
            \ })


function! ctrlp#make#init()
    let fn = 'Makefile'
    let input = filereadable(fn)? map(filter(readfile(fn), 'v:val =~ "\\w\\+:$"'), 'substitute(v:val, ":", "", "")'): []
    return input
endfunction


function! ctrlp#make#accept(mode, str)
    call ctrlp#exit()
    exe 'make' a:str
endfunction

function! ctrlp#make#enter()
endfunction

function! ctrlp#make#exit()
endfunction

function! ctrlp#make#opts()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#make#id()
    return s:id
endfunction

