
" HEREDOCUMENTS
" =============

" It is preferible to use tabs so identation can work with `<<-`
set noexpandtab

" Hax to let us have multiple highlights within a single file
" http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
  
  " The nexs is needed for code block that are already part of a highlighting
  " group, which breaks the rule as per vanilla in the wiki.
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group.'
  \ containedin=ALL'

endfunction

function! HEREDOCS()
   call TextEnableCodeSnip('r', '.*HERER', '.*HERER.*', 'SpecialComment' ) 
   call TextEnableCodeSnip('gnuplot', '.*HEREGNUPLOT.*', '.*HEREGNUPLOT', 'SpecialComment' ) 
   call TextEnableCodeSnip('maxima', '.*HEREMAXIMA.*', '.*HEREMAXIMA', 'SpecialComment' ) 
   call TextEnableCodeSnip('python', '.*HEREPYTHON.*', '.*HEREPYTHON', 'SpecialComment' ) 
   call TextEnableCodeSnip('sql', '.*HERESQL.*', '.*HERESQL', 'SpecialComment' ) 
   call TextEnableCodeSnip('awk', '.*HEREAWK.*', '.*HEREAWK', 'SpecialComment' ) 
   call TextEnableCodeSnip('tcl', '.*HERETCL.*', '.*HERETCL', 'SpecialComment' ) 
   call TextEnableCodeSnip('sql', '.*HERESQL.*', '.*HERESQL', 'SpecialComment' ) 
   call TextEnableCodeSnip('matlab', '.*HEREOCTAVE.*', '.*HEROCTAVE', 'SpecialComment' ) 
endfunction

"if (&ft=='sh' || &ft=='sh')
"   :call TextEnableCodeSnip('python', 'HEREPYTHON', '^HEREPYTHON', 'SpecialComment' )
"endif
"au BufRead,BufNewFile *.py{c,w,o,x} set ft=python

"au FileType sh call HEREDOCS()

"Toggle higlight of HEREDOCS
let g:HeredocHiglight=1
function! ToggleHeredocHiglight()
  if g:HeredocHiglight
    let g:HeredocHiglight=0
    call HEREDOCS()
  else
    let g:HeredocHiglight=1
    syntax enable
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
  endif
endfunction
nnoremap <F5> <Esc>:call ToggleHeredocHiglight()<cr>


" Get extention name
let s:extfname = expand("%:e")

" Adding features to new styles with inhertiance
if (s:extfname ==? "blt")
   " runtime ftplugin/sh.vim 
   " runtime! syntax/sh.vim

   " But I will allow execution with zc 
   " (which might not good for bash scripts)
   nnoremap zc  :execute "! ./%:t"<CR>

   " Execution with refresh
   nnoremap zx  :execute "! ./%:t -r"<CR>

   " And visualization (-A2: remove artifact for color full pm3d but decrease
   " smoothness in the fonts)
   let pdfapp="nohup mupdf -r 150 -A2 " 
   nnoremap zv  :execute "!".pdfapp." %:r.pdf &"<CR>:silent ! sleep 0.3"<CR>: redraw!<CR>  
endif 
       
