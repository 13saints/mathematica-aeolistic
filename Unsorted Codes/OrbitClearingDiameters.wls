#!/usr/bin/env wolframscript


orbitalPlanes[totalMass_, numPlanes_] := 
(*Takes total mass (integer) and number of planes as
arguments and returns a list of orbital planes defined
by mass and index.*)
Module[{mass, index},
mass = Map[Total, ResourceFunction["RandomSplit"][
	Table[1, totalMass], numPlanes]];
index = Range@ Length@ mass;
MapThread[{#1, #2}&, {index, mass}]
]

orbitalPlanesA = orbitalPlanes[100,5];

exchangeMass[] := 
(*Takes two orbital planes as arguments and returns
them with their masses manipulated.*)
Module[{prob, exch},
prob = own[[1]] / (own[[1]] + other[[1]]);
exch = RandomVariate[BernoulliDistribution[prob]];
If[exch == 1, (own = own + {1,0}) && (other	= other - {1,0}), 
	(own = own - {1,0}) && (other = other + {1,0})]


]

orbitalPlanesShuffled = ResourceFunction["Shuffle"][orbitalPlanesA, "RandomSample"]
orbitalPlanesPartitioned = Partition[orbitalPlanesShuffled, 2]
gainers = {}
losers = {}

If[orbitalPlanesPartitioned[[i]] = ]

(* Pick 2 planes and only if both planes have positive mass, exchange mass...
If[pl1[[1]] > 0 && pl2[[1]] > 0, exchangeMass[pl1, pl2]];

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

