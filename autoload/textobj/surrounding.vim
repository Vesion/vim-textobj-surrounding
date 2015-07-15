" vim-textobj-surrounding -- Text object for all surroundings
" including (), {}, [], <>, ' ', \" \", ` `
" Version: 0.0.1
" Author: Vesion, 2015

function! s:FindBrace()
    return search('[\|(\|{', 'bce')
endfunction

function! s:FindQuote()
    return search('<\|`\|''\|"', 'bce')
endfunction

function! s:Select(mode)
    if search('[\|(\|{\|<\|`\|''\|"', 'bce') == 0
        return 0
    else
        let startpos = getpos('.')
        let _ = getline('.')[col('.')-1]
        if match('[({', _) != -1
            normal! %
        elseif '<' ==? _
            call search('>', 'ce')
        else
            call search(_, 'e')
        endif
        let endpos = getpos('.')
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

