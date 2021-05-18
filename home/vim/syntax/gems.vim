" Vim syntax file
" Language:	GeMS
" Maintainer:	alexis paz <alexis.paz@gmail.com>
" Extensions:   *.gms
" Comment:      Input script language for GEMS program.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Ignore case
syn case ignore

" A bunch of useful gems keywords

"syn match   gemsIdentifier

syn keyword gemsBlock       bloque 
syn keyword gemsBlock       fin
syn keyword gemsBlock       repeat

syn keyword gemsStop        stop

syn keyword gemsIdentifier  out outfile box neigh time
syn keyword gemsSelected    set interact under evolve
syn match   gemsAdd         "\p* add"
syn match   gemsSelected    "\s<\s"

syn match   gemsSelected    "\$\w\{-}\$"
syn match   gemsSelected    "\$\w\{-}\>"

" Asignaciones
syn match   gemsEqn         "^\s*\w\{-}\>\s*=\p*$"

" Entorno matematico
syn region  gemsEqn  start="{" end="}"

" Entorno matematico con delimitadores destacados
" syn region  gemsEqn         matchgroup=Special start="{" end="}"

" Variables implicitas con $ y $$ (deprecated)
syn keyword gemsIdentifier $ran $boxx $boxy $boxz $time $jobname
syn keyword gemsIdentifier $ran$ $boxx$ $boxy$ $boxz$ $time$ $jobname$

" Variables implicitas con $ y $$ (deprecated) invocadas dentro de un entorno matematico
syn keyword gemsIdentifier $ran $boxx $boxy $boxz $time contained containedin=gemsEqn
syn keyword gemsIdentifier $ran$ $boxx$ $boxy$ $boxz$ $time$ contained containedin=gemsEqn

syn keyword gemsGsel        sys group 
"syn match   gemsGsel        "group\b*\d"
syn match   gemsGsel        ">"
syn match   gemsGsel        "+"
syn match   gemsGsel        "^\s*>\s*\w\{-}\>"
syn match   gemsGsel        "^\s*+\s*\w\{-}\>"
syn match   gemsGsel        "^\s*>>\s*\w\{-}\>"
syn match   gemsGsel        "^\s*-\s*\w\{-}\>"
syn match   gemsBCrea       "<\s*\w\{-}\>"
syn match   gemsBCrea       "^\."

" \zs and \ze set the start and the final of the submatch to higlight
syn match   gemsSelected    "\d\s\s*\zs<>\ze\s"
syn match   gemsSelected    "\d\s\s*\zs>\ze\s"

                      
syn keyword gemsStatement   partemp dinamica hd lbfgs cg lp

"syn match gemsBoolean	"\ \s*\(T\|F\)\s* "
"
"
"syn match   gemsStatement   "flag-\(non45\|acuteangle\|offgrid\)"
"syn match   gemsStatement   "text-pri-only"
"syn match   gemsStatement   "[=&]"
"syn match   gemsStatement   "\[[^,]*\]"
"syn match   gemsstatement   "^ *\(sel\|width\|ext\|enc\|area\|shrink\|grow\|length\)"
"syn match   gemsstatement   "^ *\(or\|not\|and\|select\|size\|connect\|sconnect\|int\)"
"syn match   gemsstatement   "^ *\(softchk\|stamp\|element\|parasitic cap\|attribute cap\)"
"syn match   gemsstatement   "^ *\(flagnon45\|lextract\|equation\|lpeselect\|lpechk\|attach\)"
"syn match   gemsStatement   "\(temporary\|connect\)-layer"
"syn match   gemsStatement   "program-dir"
"syn match   gemsStatement   "status-command"
"syn match   gemsStatement   "batch-queue"
"syn match   gemsStatement   "cnames-csen"
"syn match   gemsStatement   "filter-lay-opt"
"syn match   gemsStatement   "filter-sch-opt"
"syn match   gemsStatement   "power-node"
"syn match   gemsStatement   "ground-node"
"syn match   gemsStatement   "subckt-name"

"syn match   gemsGsel		"\*description"
"syn match   gemsGsel		"\*input-layer"
"syn match   gemsGsel		"\*operation"
"syn match   gemsGsel		"\*end"

syn match   gemsComment "(\p*)"
syn match   gemsComment "^\s*# .*"


syn match   gemsPreProc "^\s*#\w.*"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_gems_syn_inits")
  if version < 508
    let did_gems_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink gemsBlock      Special
  HiLink gemsIdentifier Identifier
  HiLink gemsComment    Comment
  HiLink gemsPreProc    PreProc
  HiLink gemsBoolean    Boolean
"  HiLink gemsAdd        Type
  HiLink gemsBCrea      String
  HiLink gemsSelected   Type
  HiLink gemsStatement  Statement
  HiLink gemsStop       Todo
  HiLink gemsEqn        Statement
  HiLink gemsGsel       Type

  delcommand HiLink
endif

let b:current_syntax = "gems"
" vim: ts=8 
