" Vim syntax file
" Language: Pelican blogging engine (http://getpelican.com)
" Maintainer: Hector Lecuanda (hector@lecuanda.com)
" Latest Revision: 2013-08-24 01:31
" References: http://vim.wikia.com/wiki/Creating_your_own_syntax_files
"             http://learnvimscriptthehardway.stevelosh.com/chapters/45.html
"
:syntax clear

if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=:
syn case ignore

syntax match pelicanMetaValue /.*$/

syntax match pelicanMeta /^.lang./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.status./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.translation./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.template./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.url./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.save_as./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.title./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.date./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.category./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.tags./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.slug./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.author./ nextgroup=pelicanMetaValue skipwhite
syntax match pelicanMeta /^.summary./ nextgroup=pelicanMetaValue skipwhite

hi def link pelicanMeta Keyword
hi def link pelicanMetaValue String

:runtime! syntax/markdown.vim
:runtime! syntax/python.vim
:runtime! syntax/html.vim


let b:current_syntax = "pelican-vim"
