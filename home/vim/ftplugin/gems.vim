set syntax=gems
source $HOME/.vim/syntax/gems.vim

 
" Comment style (tcomment plugin)
if exists('loaded_tcomment')
  call tcomment#type#Define('gems',              '# %s'            )
  " call tcomment#DefineType('gems_block',        g:tcommentBlockC   )
  " call tcomment#DefineType('gems_inline',       g:tcommentInlineC  )
endif              
