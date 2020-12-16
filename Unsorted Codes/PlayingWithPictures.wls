#!/usr/bin/env wolframscript


(*
lady = CloudImport@ URL["https://github.com/13saints/public-domain-images/blob/main/taylor-harding-p1udGcOaQ2g-unsplash.jpg"]


xfruit = Import["C:\\Users\\Cystennin\\Desktop\\GitHub\\public-domain-images\\dainis-graveris-bOxV5KUPJS4-unsplash.jpg"]
art = Import["C:\\Users\\Cystennin\\Desktop\\GitHub\\public-domain-images\\104720absdl.jpg"]


location = "C:\\Users\\Cystennin\\Desktop\\scriptresults\\"
path[filename_] := location<>filename<>".png" (* <> is the infix operator for `StringJoin`*)
exportOutput[out_, filename_] := Export[path[filename], out]


(* ``edge detection`` *)
edet = ImageAssemble[Table[EdgeDetect[lady, r, t], {r, {2, 4, 6}}, {t, {.01, .05, .1}}], Background -> 1, 
 Spacings -> 5];



reim = ImageRestyle[lady, art]


RemoveBackground[art, {Background, "Yellow"}]


exportOutput[RemoveBackground[art, {"Background", Yellow}], "artyellowless"]


rrr := 200
ggl := 100
ggh := 50
bbb := 50

res = ImageApply[
 If[#[[1]] > rrr && #[[2]] > ggl && #[[2]] < ggh && #[[3]] < bbb, #, {192, 192, 192}] &, xfruit]
 
exportOutput[xfruit, "xFruit"]


Print@ DominantColors[xfruit]
*)




cersei = Import["C:\\Users\\Cystennin\\Desktop\\scriptresults\\artyellowless.png"]
mcphee = Import["C:\\Users\\Cystennin\\Desktop\\GitHub\\public-domain-images\\karikatura-damskej-mody.jpg"]

(* imgs = ConformImages@ {cersei, mcphee}

ImageAssemble[imgs[[1]], imgs[[2]]]

ImageAssemble[imgs[[2]], imgs[[1]]]


imgs2 = {imgs[[1]], imgs[[2]], imgs[[2]], imgs[[1]]} 




coll = ImageAssemble[imgs] 

 *)

exportOutput[cersei, "collage"]


















(* 

Kakashi Public License v1.0 affirmed for this shitty piece of code.
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

