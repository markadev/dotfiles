"TODO
"if exists("b:current_syntax")
"  finish
"endif

let s:cpo_save = &cpo
set cpo&vim

syn match log4jBegin       display '^' nextgroup=log4jTimestamp
syn match log4jTimestamp   contained display '\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d,\d\d\d\s*'
                                   \ nextgroup=log4jThreadName

syn match log4jThreadName  contained display '\[[^]]*\]\s*'
                                   \ nextgroup=log4jLogLevel

"syn match log4jLoggerName  contained display '\[[^]]*\]\s*'
"                                   \ nextgroup=log4jLogLevel

syn match log4jLogLevel    contained display '[A-Z]\+\s*'
                                   \ contains=log4jDebugLevel,log4jInfoLevel,log4jWarnLevel,log4jErrorLevel
                                   \ nextgroup=log4jText
syn match log4jDebugLevel  contained display '\<DEBUG\>'
syn match log4jInfoLevel   contained display '\<INFO\>'
syn match log4jWarnLevel   contained display '\<WARN\>'
syn match log4jErrorLevel  contained display '\<ERROR\|CRIT\>'

syn match log4jText        contained display '.*'


hi def log4jTimestamp     ctermfg=yellow guifg=yellow
hi def log4jThreadName    ctermfg=grey guifg=grey
"hi def log4jLoggerName    ctermfg=grey guifg=grey
hi def link log4jDebugLevel Normal
hi def log4jInfoLevel     ctermfg=cyan guifg=cyan
hi def log4jWarnLevel     ctermfg=yellow guifg=yellow
hi def log4jErrorLevel    ctermfg=red guifg=red
hi def log4jtext ctermfg=blue guifg=blue

let b:current_syntax = "log4j"

let &cpo = s:cpo_save
unlet s:cpo_save
