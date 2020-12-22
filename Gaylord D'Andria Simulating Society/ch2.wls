#!/usr/bin/env wolframscript

(*ch2. Transmitting Culture.*)

cultureSpreadingShared[n_, p_, s_, m_, t_] := 
Module[{society, RND, decide, exchange, walk, vonNeumann, GN},

RND:= Random[Integer, {1,4}];
society = Table[Floor[p+Random[]],{n},{n}] /.
			1 :> {RND, Table[Random[Integer, {1,m}], {s}]};

decide

]
