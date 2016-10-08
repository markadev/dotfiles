syntax case match
syntax keyword Directive SETUP ASSIGN ERROR ORDERQUEUE PASS PERF PROTO
syntax keyword Directive REPLAYROOT ROOT VSIZE

syntax keyword Operator BITS RANGE

syntax case ignore
syntax keyword Function fAdd[32] fAnd[32] fBrNEq fBrnz fBrz fClearArgSig
syntax keyword Function fExtract fGetCRC10Result fGetCRC32Result fGetCRCResult
syntax keyword Function fGetIpCksum fGetIpHdrCksum fGetIpv4Cksum
syntax keyword Function fGetIpv4HdrCksum fInitHandles fOr[32] fQueue[EOF]
syntax keyword Function fRestartChecksum16 fResumeIpv6 fReturn fRSkip[Bytes]
syntax keyword Function fRSkipToBegin fSetGlobal fShift[32] fSkip[Bytes]
syntax keyword Function fSkipToEnd fStartChecksum16 fStartCRC16 fStartCRC32Be
syntax keyword Function fStartCRC32Le fStartIpv4Cksum fStartIpv4HdrCksum
syntax keyword Function fStartIpv6Cksum fStopChecksum16 fSub[32]
syntax keyword Function fUnblockOrderQueues fXor[32]
syntax keyword Function asiCount8 asiCount16 asiCount32
syntax keyword Function asiDecrement8 asiDecrement16 asiDecrement32
syntax keyword Function asiDownCount8 asiDownCount16 asiDownCount32
syntax keyword Function asiIncrement8 asiIncrement16 asiIncrement32
syntax keyword Function asiAND8 asiAND16 asiAND32 asiOR8 asiOR16 asiOR32
syntax keyword Function asiXOR8 asiXOR16 asiXOR32 asiFBIDMA 
syntax keyword Function asiRead8 asiRead16 asiRead32
syntax keyword Function asiWrite8 asiWrite16 asiWrite32 asiSequenceCheck
" TODO asiPolice*, asiPoliceEOF*


syntax case match
syntax match Variable /[$@]\w\+/ display
syntax match Variable /\w\+\s*=/me=e-1 display
syntax match Constant /\<\d\+\>/ display
syntax match Constant /\<0[bB][01]\+\>/ display
syntax match Constant /\<0[xX][0-9a-fA-F]\+\>/ display
syntax match DefinedConstant /\<[A-Z][A-Z0-9_]\+\>/ display
syntax match Label /^\w\+:/ display
syntax match Function /\w\+\s*(/me=e-1 display
syntax match Comment "//.*$" display
syntax match BitCount /:[0-9]\+/ display

hi Function        ctermfg=green    guifg=green
hi Directive        ctermfg=blue     guifg=blue
hi Operator         ctermfg=blue     guifg=blue
hi Constant         ctermfg=magenta  guifg=magenta
hi BitCount         ctermfg=red      guifg=red
hi DefinedConstant  ctermfg=magenta  guifg=magenta
hi Comment          ctermfg=cyan     guifg=cyan
hi Label           ctermfg=yellow   guifg=yellow
hi Variable         ctermfg=blue     guifg=blue
