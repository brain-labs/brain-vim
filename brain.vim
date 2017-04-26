if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif

  let main_syntax = 'brain'
endif

syn match bfMath    "[-+*/%]"
syn match bfPointer "[<>^]"
syn match bfLoop    "[[\]]"
syn match bfLoop2   "[{}]"
syn match bfIO      "[.,$#]"
syn match bfComment "[^-+<>[\].,]\+"

if version >= 508 || !exists("did_brain_syn_inits")
  if version < 508
    let did_brain_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink bfMath    Identifier
  HiLink bfPointer Type
  HiLink bfLoop    Conditional
  HiLink bfIO      PreProc
  HiLink bfComment Comment

  delcommand HiLink
endif

let b:current_syntax = "brain"

if main_syntax == 'brain'
  unlet main_syntax
endif

