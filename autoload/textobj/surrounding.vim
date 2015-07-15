" vim-textobj-surrounding -- Text object for all surroundings
" like (), {}, [], <>, ' ', \" \"
" Version: 0.0.1
" Author: Vesion, 2015

function! s:FindBrace()
    return search('[\|(\|{', 'bce')
endfunction

function! s:FindQuote()
    return search('<\|`\|''\|"', 'bce')
endfunction

function! s:Select(mode)
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
    return s:Select('a')
endfunction

function! textobj#surrounding#select_i()
    return s:Select('i')
endfunction

