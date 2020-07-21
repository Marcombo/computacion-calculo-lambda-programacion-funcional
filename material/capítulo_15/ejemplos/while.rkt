#lang brag
program :  program ";" program
        | "if" bool "then" program "else" program
        | "while" bool "do" program
        | "print" "(" exprs ")"
        | var ":=" exprs

bool : "true" 
        | "false" 
        | "(" exprs "=" exprs ")"
        | "(" bool '&' bool ")"
        |  "¬" bool

exprs : "(" exprs '+' exprs ")"
     | exprs '+' exprs
     | var
     | num

var : VARIABLE
num: INT