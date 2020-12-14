#!/usr/bin/env wolframscript

(*Program to export image outputs.*)


location = "C:\\Users\\Cystennin\\Desktop\\scriptresults\\"
path[filename_] := location<>filename<>".png" (* <> is the infix operator for `StringJoin`*)
exportOutput[out_, filename_] := Export[path[filename], out]



out = Plot[Sin[x], {x, - Pi, Pi}]
exportOutput[out, "sinegraph"] (*The graphical output of your code is the first argument, the name you want to give the file is the second argument.*)

