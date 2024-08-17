function! riscosbasic_impl#decode(path)
    if &filetype == 'riscosbasic'
        execute ":'[,']!riscosbasic -d " . fnameescape(a:path)
    endif
endfunction

function! riscosbasic_impl#encode(path)
    if &filetype == 'riscosbasic'
        let l:tmpfile = tempname()
        let l:tmpfile_out = tempname()
        execute 'write! ' . l:tmpfile
        silent! execute '!riscosbasic -e ' . l:tmpfile . ' > ' . l:tmpfile_out
        call delete(l:tmpfile)

        if filereadable(l:tmpfile_out)
            call rename(l:tmpfile_out, a:path)
        else
            echo "riscosbasic: Unable to convert file"
        endif
    endif
endfunction
