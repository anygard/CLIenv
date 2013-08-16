"       Copyright 2011, 2012, 2013 Anders Nygård
"       
"       This file is part of CLIenv.
"       
"           CLIenv is free software: you can redistribute it and/or modify
"           it under the terms of the GNU General Public License as published by
"           the Free Software Foundation, either version 3 of the License, or
"           (at your option) any later version.
"       
"           CLIenv is distributed in the hope that it will be useful,
"           but WITHOUT ANY WARRANTY; without even the implied warranty of
"           MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"           GNU General Public License for more details.
"       
"           You should have received a copy of the GNU General Public License
"           along with CLIenv.  If not, see <http://www.gnu.org/licenses/>.

" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Anders Nygard <anyzell@anygard.com>
" Last Change:	2006 Aug 19

" orignial information
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "anyzell"

hi Comment term=bold ctermfg=Red guifg=Red
hi Normal guifg=black guibg=white
hi Constant term=underline ctermfg=Magenta guifg=Magenta
hi Special term=bold ctermfg=Magenta guifg=Magenta
hi Identifier term=underline ctermfg=Blue guifg=Blue
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=Brown
hi PreProc term=underline ctermfg=Magenta guifg=Purple
hi Type term=underline ctermfg=Blue gui=NONE guifg=Blue
hi Visual term=reverse ctermfg=Black ctermbg=NONE gui=NONE guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=Cyan
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi ErrorMsg term=reverse ctermfg=White ctermbg=Red guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi  StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi! link MoreMsg Comment
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
