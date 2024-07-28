" riscosbasic.vim - Vim support for RISC OS' BBC BASIC file format (&FFB)
" Requires riscosbasic: https://github.com/tompickering/riscosbasic

augroup riscosbasic
    autocmd!
    autocmd BufRead,BufNewFile *\,ffb,*\,FFB set filetype=riscosbasic
    autocmd BufReadPost,FileReadPost *\,ffb,*\,FFB call riscosbasic_impl#decode(expand('<afile>'))
    "autocmd BufWritePre,FileWritePre *\,ffb,*\,FFB call riscosbasic_impl#encode(expand('<afile>'))
    autocmd BufWritePost,FileWritePost *\,ffb,*\,FFB call riscosbasic_impl#encode(expand('<afile>'))
augroup END
