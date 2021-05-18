
function! Zubplt2()
" Output with a black baground (for presentations)

  let mainplt=expand("%:t")
  let maintex=mainplt[0:len(mainplt)-5]


  let stringaux='silent ! gnuplot -e "eval SCblack; viminjection=''set output \"inv_'.maintex.'.tex\"'' " '.mainplt
  execute stringaux
  let stringaux="silent ! gnuplot ".mainplt
  execute stringaux

  execute 'silent !pdflatex -shell-escape -jobname '.maintex.' -file-line-error -halt-on-error '.maintex.' >& /dev/null'
  silent redraw!
  execute 'silent !pdflatex -shell-escape -jobname inv_'.maintex.' -file-line-error -halt-on-error inv_'.maintex.' >& /dev/null'
  silent redraw!

endfunction                                               
         
function! Zubplt()
" Output with a white baground (for publication)

  let mainplt=expand("%:t")
  let stringaux="silent ! gnuplot ".mainplt
  execute stringaux

  let maintex=mainplt[0:len(mainplt)-5]
  execute 'silent !pdflatex -shell-escape -jobname '.maintex.' -file-line-error -halt-on-error '.maintex.' >& /dev/null'
  silent redraw!

endfunction                                               
 

" compilacion
"  nnoremap zc  :execute "!gnuplot %:t"<CR>
"  vnoremap zc  :execute "!gnuplot %:t"<CR>
nnoremap zc  :call Zubplt()<CR>
nnoremap zz  :call Zubplt2()<CR>

" visualizacion
let pdfapp="nohup mupdf -r 150 -A2 " 
nnoremap zv  :execute "silent !".pdfapp."%:r.pdf &"<CR>:silent ! sleep 0.3"<CR>: redraw!<CR>  
 
