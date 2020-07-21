#lang racket

(require syntax/parse)
(require "lexer.rkt")
(require "parser.rkt")
(require "interpreter.rkt")

(run (parser (lexer-tokenize (open-input-string
"x := 0;
y := 5;
while ¬((x + 1) = y) do
  x := x + 1;
print(x)
"))))

(run (parser (lexer-tokenize (open-input-string
"
x := 0;
y := 5;
while ¬((x + 1) = y) do
  if ¬(x = y) then
     y := x + 1
  else
     y := 0;

print(x)
"))))



(run (parser (lexer-tokenize (open-input-string
"
x := 0;
y := 1;
if (x = y) then
  x := x + 1000
else
  x := 100;

print(x)
"))))


(run (parser (lexer-tokenize (open-input-string
"
if (false & true) then
  x := 0
else
  if (true & true) then
     x := 1
  else
     x := 0;

print(x)
"))))


(parser (lexer-tokenize (open-input-string
"
x := 0;
y := 1
")))