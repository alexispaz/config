setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
" Me gustaria que esto funcione y no tener que hacerlo a mano cada vez que
" abro un md
" execute "normal Toc"

" Concealing (comprimir sitnaxis en linea sin el cursor, por ejemplo, links)
set conceallevel=3 

" Latex math
let g:vim_markdown_math = 1

" Modify the accuaricy of higlighting
syntax sync fromstart

" Syntax highlight is synchronized in 50 lines. It may cause collapsed
" highlighting at large fenced code block. In the case, please set larger
" value in your vimrc:
" let g:markdown_minlines = 100

" Macro to convert a word in a link and reverse
" noremap ds Bi[<CR>
noremap ds Bi[<esc>lvEyEa](<esc>pa)<esc>

" Para poner color a la italica y a la negrita.
"
" " Cuando se usa plasticboy plugin...
" autocmd vimenter *.md ++nested  highlight htmlBold gui=bold guifg=#af0000 ctermfg=214 cterm=bold
" autocmd vimenter *.md ++nested  highlight htmlItalic gui=italic guifg=#ff8700 ctermfg=214 cterm=italic
"
" " Cuando se usa tpope plugin (nativo)...
" autocmd vimenter *.md ++nested  highlight markdownItalic gui=italic guifg=#ff8700 ctermfg=214 cterm=italic
" autocmd vimenter *.md ++nested  highlight markdownBold gui=bold guifg=#af0000 ctermfg=124 cterm=bold

" Avoid gw format lists
set fo+=n

" Default tpope plugin (included in vim recent versions) 
let g:markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'tcl', 'c']

" " If you want to enable fenced code block syntax highlighting in your markdown
" " documents you can enable it in your .vimrc like so:
" let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'tcl']


" Quote and de-quote paragraphs (i.e. prepend > symbol)

"      ,dp = de-quote current inner paragraph
"  noremap ,dp {jma}kmb:'a,'bs/^> //<CR>
   noremap ,dp vip:s/^> //<CR>
  vnoremap ,dp    :s/^> //<CR>
"      ,qp = quote current inner paragraph (works since vim-5.0q)
"            select inner paragraph then do the quoting as a substitution:
   noremap ,qp   vip:s/^/> /<CR>
"      ,qp = quote current paragraph
"            just do the quoting as a substitution:
  vnoremap ,qp    :s/^/> /<CR>

 
