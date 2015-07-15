" vim-textobj-restline -- Text object for the rest of current line
" The 'rest' means from the cursor positon to the end
" Version: 0.0.1
" Author: Vesion, 2015

function! s:FindBrace()
    return search('[\|(\|{', 'bce')
endfunction

function! s:FindQuote()
    return search('<\|`\|''\|"', 'bce')
endfunction

function! s:select(mode)
    if s:FindBrace()
        let startpos = getpos('.')
        normal! %
        let endpos = getpos('.')
    elseif s:FindQuote()
        let startpos = getpos('.')
        let _ = getline('.')[col('.')-1]
        execute 'normal! f' . _
        let endpos = getpos('.')
    else
        return 0
    endif

    if a:mode ==# 'i'
        let startpos[2] += 1
        let endpos[2] -= 1
    endif
    
    return ['v', startpos, endpos]
endfunction

function! textobj#surrounding#select_a()
    call s:select('a')
endfunction

function! textobj#surrounding#select_i()
    call s:select('i')
endfunction

