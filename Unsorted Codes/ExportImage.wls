#!/usr/bin/env wolframscript

(*Program to export image outputs.*)


location = "C:\\Users\\Cystennin\\Desktop\\scriptresults\\"
path[filename_] := location<>filename<>".png" (* <> is the infix operator for `StringJoin`*)
exportImage[out_, filename_] := Export[path[filename], out]



(* out = Plot[Sin[x], {x, - Pi, Pi}]
exportOutput[out, "sinegraph"] The graphical output of your code is the first argument, the name you want to give the file is the second argument.

 *)
















(* 

Kakashi Public License v1.0 affirmed for this code.
__________________________________________________________________
KAKASHI PUBLIC LICENSE

Version 1.0, December 2020

Copyright (C) 2020 Thirteen Saints

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name of the license is changed.

1. APPLICABILITY

   Every file on which the Kakashi Public License version 1.0 
applies must state so independently through a declaration such as
the following: Kakashi Public License Affirmed. Simply placing this
license document in a folder or repository does not associate it
with the files contained in that folder or repository.

2. WAIVER

   To the greatest extent permitted by law, the licensor hereby
unconditionally waives all of his copyright and related rights.

3. TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

   You just do what the fuck you want to.
_____________________________________________________________________

*)
