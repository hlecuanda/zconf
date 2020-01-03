":hl
"   __     __                      _
"  / _|___/ _|    __  ___ ____   _(_)_ __ ___
" | ||_  / |_ ____\ \/ / '_ \ \ / / | '_ ` _ \
" |  _/ /|  _|_____>  <| |_) \ V /| | | | | | |
" |_|/___|_|      /_/\_\ .__(_)_/ |_|_| |_| |_|
"                      |_|
" #:hl
" h@h-lo.me 20200102 145655 -0800 PST 1578005815 d(-_- )b...

" FzfMaps:
"" list mode mappings via fzf, execute when selected
function! HloFzfMaps()
  let l:maps = split(execute(':nmap'),"\n")
  call Fzf#run({'sink':'e', 'source': l:maps})
endfunction
command! -nargs=0 -complete=command FzfMaps call FzfMaps()
"
let fzfmapopts = {'source': map(range(1, bufnr('$')), 'bufname(v:val)')},
command -bang Buffers call fzf#run(fzf#wrap('buffers', fzfmapopts <bang>0))

"
" vim: set ft=vim sw=2 tw=78 fdm=manual et :
