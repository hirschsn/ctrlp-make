" =============================================================================
" File:          plugin/ctrlp-make.vim
" Description:   Ctrl-p for Makefile targets
" Author:        Steffen Hirschmann <github.com/hirschsn>
" =============================================================================

command! CtrlPMake call ctrlp#init(ctrlp#make#id())
nnoremap <plug>(ctrlp-make) :<c-u>CtrlPMake<cr>

