#!/usr/bin/env wolframscript

toss[probablityofsuccess_] := If[Random[] <= probablityofsuccess, 1, 0];

orbitalPlanes[totalMass_, numPlanes_] := 
(*Takes total mass (integer) and number of planes as
arguments and returns a list of orbital planes defined
by mass and index.*)
Module[{mass, index, output},
mass = Map[Total, ResourceFunction["RandomSplit"][
	Table[1, totalMass], numPlanes]];
index = Range@ Length@ mass;

output = MapThread[{#1, #2}&, {index, mass}];
Print["####################### The Orbital Planes are :", output]
output
];

exchangeMass[orbitalPlanesB_] :=
(*Takes a list of indexed orbital planes, returns a list 
which is identical except two orbital planes whose masses have changed.*)
Module[{i, j, opi, opj, prob, exch, output},
i = RandomInteger[{1, Length@orbitalPlanesB}];
j = RandomInteger[{1, Length@orbitalPlanesB}];

Print["#################### Length orbitalPlanesB = ", Length@orbitalPlanesB]

Print["####################    i  =", i]
Print["####################    j  =", j]
Print["################### orbitalPlanesB = ", orbitalPlanesB]

opi = orbitalPlanesB[[i]];
opj = orbitalPlanesB[[j]];
Print["############ opi = ", opi]
Print["############ opj = ", opj]

prob = N[opi[[2]] / (opi[[2]] + opj[[2]])];

Print["############ prob = ", prob]
exch = toss[prob];

output = If[exch == 1, orbitalPlanesB /. {opi -> {opi[[1]], opi[[2]] +1}, 
	opj -> {opj[[1]], opj[[2]] -1}},	orbitalPlanesB /. 
	{opi -> {opi[[1]], opi[[2]] -1}, opj -> {opj[[1]], opj[[2]] +1}}];

Print["####################### post-exchangeMass :", output]
output
];

orbitalPlanesA = orbitalPlanes[100,5];

Nest[exchangeMass[#]&, orbitalPlanesA, 1]






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

