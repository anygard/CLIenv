"       Copyright 2011 Anders Nygård
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
"           along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
"
"netrw aware gf

map gf :call Netrw_gf(expand("<cfile>"), 'gf')<CR>

function! Netrw_gf(file, map)

    let l:prefix = 'N/A'
    let l:file = a:file

    if exists("b:netrw_lastfile")
	let l:prefix = matchstr(expand("%"), "^\[a-z]*://\[a-z0-9A-Z_@\.\-]*/")
        let l:file = l:prefix . a:file
    elseif ! filereadable(a:file)
        echohl ErrorMsg | echo "no file named: " . a:file | echohl None
    endif

    execute ":edit " . l:file
    
    "echo "af: " . l:file

endfunction
