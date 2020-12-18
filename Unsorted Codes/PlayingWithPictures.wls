#!/usr/bin/env wolframscript

(*COMMAND TO EXPORT OUTPUT*)
location := "C:\\Users\\Cystennin\\Desktop\\scriptresults\\";
path[filename_] := location<>filename<>".png";
exportOutput[out_, filename_] := Export[path[filename], out];

(*LOAD IMAGES YOU WANT TO MANIPULATE. ENTER URL OR LOCAL PATH.*)
input1 := Import["C:\\Users\\Cystennin\\Desktop\\GitHub\\public-domain-images\\104720absdl.jpg"];
input2 := Import["https://github.com/13saints/public-domain-images/blob/main/taylor-harding-p1udGcOaQ2g-unsplash.jpg"];


(*EdgeDetect + ImageAssemble. Gives a collage with edges marked.*)
output1 := ImageAssemble[Table[EdgeDetect[input1, r, t], {r, {2, 4, 6}}, {t, {.01, .05, .1}}], 
							Background -> 1, Spacings -> 5];

(*ImageRestyle IS VERY COMPUTATIONALLY INTENSIVE. ImageRestyle restyles arg1 in the style of arg2.*)
output2 := ImageRestyle[input2, input1];

(*RemoveBackground removes a given color from the background.*)
output3 := RemoveBackground[art, {Background, "Yellow"}];

(*DesaturateExcept turns every other color gray.*)
output4 := With[{image = img},
 				GraphicsRow[{image, ResourceFunction["DesaturateExcept"][image, Red]}]];

(*Colorize takes grayscale image and turns dark into blue, light into green, and shine into red.*)
output5 := Colorize[input2];

(*!~ImageColorize DOWNLOADS 200 MB OF CONTENT. Using various neural nets, it tries to colorize 
					grayscale image. Default is red-biased.*)
output6 := ResourceFunction["ImageColorize"][input2];

(*The function below takes a grayscale image and tries to turn is psychedelic. I had input formatting
					issues and could not get it to work with anything other than the image shown in 
					the example on the wolfram documentation.*)
output7 := ImageApply[{Sin[Pi #*4], Sin[Pi], Sin[Pi #*3]}&, input2];


(*Replace "result" with the name of the output file. *)
exportOutput[output1, "result"]



















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

