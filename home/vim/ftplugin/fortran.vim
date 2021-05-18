" Fast fortran print line for debug
map PP oprint *,'pepe 'i

" Make free source form for .f90 and change default color to blue
let g:fortran_free_source=1 

"Load color scheme {name} from '$VIMRUNTIME/colors/{name}.vim'
"VIMRUNTIME = /usr/share/vim/vim61/
"colorscheme desert

"Higligth precise but more spensive
"let fortran_more_precise=0 

"Number of lines in the display (default=25)
"set lines=30

"Number of columns in the display (default=80)
"set co=90 

"syntax
set syntax=fortran90

"Higlight of fold head
"highlight Folded guibg=black guifg=red

" "Foldlevel (init folding)
set foldlevel=1

"Folding method
set fdm=syntax

"Folding Column (Width of fold tree)
set fdc=5
let g:fortran_fold=1

""Folding conditionals
"let fortran_fold_conditionals=0

""Folding multicomments
"let fortran_fold_multilinecomments=0
     
set expandtab
set autoindent
