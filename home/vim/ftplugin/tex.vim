"To install the included latex-suit.txt and latexhelp.txt files as vim help
"files, start vim and do the following:

"helptags ~/.vim/doc       (for *nix users)
"helptags ~/vimfiles/doc   (for windows users) 

"Thats it! You are done! Now start editing a latex file in vim. Latex-Suite
"should start up automatically. You can do

":help latex-suite.txt

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" This is mostly a matter of taste. But LaTeX looks good with just a bit of
" indentation.
set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=_,$,@,%,# " none of these are word dividers

"  El folding para frames de latex se controla en el archivo
"  .vim/ftplugins/latex-suite/folding.vim.

" Refrescado de foldings:
" map [17~ \rf

" Convert letter to vector or array
noremap dv i\vec{<Esc>/\><CR>i}<Esc>
noremap da i\arr{<Esc>/\><CR>i}<Esc>


" Convert delimiters to latex syntax. You should put the cursor in the open
" character
noremap ds :call PutDelims()<CR>
noremap sd :call ReverseDelims()<CR>

function! PutDelims()

  let del=getline('.')[col('.')-1]
  let beg=col('.')
  execute 'normal %r}'
  execute 'normal '.beg.'|r\'

  if (del ==? '(')
    execute 'normal lipars*'
  endif
  if (del ==? '{')
    execute 'normal librcs*'
  endif
  if (del ==? '[')
    execute 'normal librks*'
  endif

  execute 'normal li{'

endfunction         

function! ReverseDelims()

  let del=getline('.')[col('.')-1:col('.')+3]
  let beg=col('.')
  execute "normal /{\<CR>"

  if (del ==? '\pars')
    execute 'normal %r)'
  endif
  if (del ==? '\brcs')
    execute 'normal %r}'
  endif
  if (del ==? '\brks')
    execute 'normal %r]'
  endif

  execute 'normal '.beg.'|'

  if (del ==? '\pars')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i('
  endif
  if (del ==? '\brcs')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i{'
  endif
  if (del ==? '\brks')
    execute "normal v/{\<CR>"
    execute 'normal d'
    execute 'normal i['
  endif
 

endfunction         
 

let pdfapp="nohup mupdf " 


" CHANING THE COMPILATION RULE is in the .vim/ftplugins/latex-suite/texrc
" g:Tex_CompileRule_pdf = 'pdflatex --shell-escape $*'

" manuales
nnoremap zm1 :execute '!'.pdfapp.'/usr/share/texmf/doc/generic/pgf/pgfmanual.pdf &'<CR>
"nnoremap zm2 :execute '!'.pdfapp.'$HOME/Documentos/Manuales-Soporte/TEX/pgfplots.pdf &'<CR>
nnoremap zm2 :execute '!'.pdfapp.'/usr/share/texmf/doc/latex/pgfplots/pgfplots.pdf &'<CR>
nnoremap zm3 :execute '!'.pdfapp.'$HOME/Documentos/Manuales-Soporte/TEX/symbols-a4.pdf &'<CR>

function! Zubtex()
  let maintex=Maintex()
  execute 'silent !clear'
  execute 'silent !echo "================== compilling '.maintex.' ========================"'
  " execute '!pdflatex --shell-escape  -halt-on-error -file-line-error '.maintex
  execute '!export max_print_line=1048576; pdflatex -shell-escape -jobname '.maintex.' -file-line-error -halt-on-error '.maintex . '| egrep -iv "\(.*\.sty|BAbel|\(.*\.cls|^\s*$|<.*|\(/usr/share/texmf/tex.*"'
  " .' | egrep -i ".*:[0-9]*:.*|LaTeX Warning:|^.*\(\.\/[a-z]*\.tex$"  '
  silent redraw!
endfunction                                               

  
function! Maintex()

  let maintex=expand("%:t")

  " Here I read the first line to found the file to compile (in case of included files)
  let amaintex=system('head -n 1 '.shellescape(maintex).' | cut -c -18')
  if (amaintex ==? "%include file for \n")
    let maintex=system('head -n 1 '.shellescape(maintex).' | cut -c 19-')
    let maintex=maintex[0:len(maintex)-2]
  endif
  let maintex=maintex[0:len(maintex)-5]

  return maintex

endfunction

" compilacion
nnoremap zc  :call Zubtex()<CR>
vnoremap zc  :call Zubtex()<CR>
 
" nnoremap asd  :execute "sed -n ''/\\begin{document}/q;/\\include/p'' %:t "

" compilacion con bibliografia
nnoremap zb  :call Zubprevbib()<CR>
vnoremap zb  :call Zubprevbib()<CR>
function! Zubprevbib()
  execute "!biber ".Maintex()
  redraw!
endfunction

"nnoremap zx  :call Zubprevlatexbib()<CR>
"vnoremap zx  :call Zubprevlatexbib()<CR>
  
" visualizacion
nnoremap zv  :execute "silent !".pdfapp.Maintex().".pdf &"<CR>:silent ! sleep 0.3"<CR>: redraw!<CR>  
vnoremap zv  :execute "silent !".pdfapp.Maintex()."pdf &"<CR>:silent ! sleep 0.3"<CR>: redraw!<CR>  

" vimrc
nnoremap rc  :vsplit $HOME/.vimrc <CR>

" El latex-suite me caga el acento en la e, asique lo reparo
" me gustaria que imapclear é funcione
 
 
