" Load color scheme {name} from '$VIMRUNTIME/colors/{name}.vim'
" VIMRUNTIME = /usr/share/vim/vim61/
" colorscheme desert

" Number of lines in the display (default=25)
" set lines=30

set fdm=syntax 
set fdc=4
let c_fold=1
let c_conditionals=1
let c_fold_multilinecomments=1
           

" Override c comment style with cpp style (tcomment plugin)
if exists('loaded_tcomment')
  call tcomment#type#Define('c',              '// %s'            )
  call tcomment#type#Define('c_block',        g:tcomment#block_fmt_c   )
  call tcomment#type#Define('c_inline',       g:tcomment#inline_fmt_c  )
endif 
