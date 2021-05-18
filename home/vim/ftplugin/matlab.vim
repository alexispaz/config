
function! ZC()

  let main=expand("%:t")

  execute '!octave '.main
  redraw

endfunction                                               
      
nnoremap zc :call ZC()<CR>
      
"syntax
set syntax=matlab
