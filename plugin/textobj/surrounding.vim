" vim-textobj-surrounding -- Text object for all surroundings
" like (), {}, [], <>, ' ', \" \"
" Version: 0.0.1
" Author: Vesion, 2015


if exists('g:loaded_textobj_surrounding')
    finish
endif


call textobj#user#plugin('surrounding', {
\      'sur': {
\        'select-a': 'aj', 'select-a-function': 'textobj#surrounding#select_a',
\        'select-i': 'ij', 'select-i-function': 'textobj#surrounding#select_i',
\      },
\    })


let g:loaded_textobj_surrounding = 1

