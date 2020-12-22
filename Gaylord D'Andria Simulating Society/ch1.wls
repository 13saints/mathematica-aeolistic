#!/usr/bin/env wolframscript

(*Ch1. Modeling Society with Mobile, Heterogeneous Agents.*)

randomWalkers[n_,p_,g_,m_,s_,r_,t_]:=
Module[{society,RND,k,walk,GN},	
(*Creating the lattice of individuals:*)
k=0;
RND:= Random[Integer, {1,4}];
society = Table[Floor[p+Random[]],{n},{n}]
			/. 1:>{RND,++k,Floor[g+Random[]],
				Table[Random[Integer,{1,m}],{s}],
				Random[Integer,{1,r}]};

(*Setting up Walk rules. Use the POV of the lattice.*)
(*A site occupied by an individual facing an empty site
	becomes empty unless one or more other individual
	is also facing that empty site, in which case, the
	individual remains in place and faces a random direction:*)
walk[{1,a___},0,_,_,_,{4,___},_,_,_,_,_,_,_]:={RND,a};
walk[{1,a___},0,_,_,_,_,_,_,{2,___},_,_,_,_]:={RND,a}; 
walk[{1,a___},0,_,_,_,_,_,_,_,{3,___},_,_,_]:={RND,a};
walk[{1,a___},0,_,_,_,_,_,_,_,_,_,_,_]		:=0;
walk[{2,a___},_,0,_,_,{3,___},_,_,_,_,_,_,_]:={RND,a};
walk[{2,a___},_,0,_,_,_,{1,___},_,_,_,_,_,_]:={RND,a};
walk[{2,a___},_,0,_,_,_,_,_,_,_,{4,___},_,_]:={RND,a};
walk[{2,a___},_,0,_,_,_,_,_,_,_,_,_,_]		:=0;
walk[{3,a___},_,_,0,_,_,{4,___},_,_,_,_,_,_]:={RND,a};
walk[{3,a___},_,_,0,_,_,_,{2,___},_,_,_,_,_]:={RND,a};
walk[{3,a___},_,_,0,_,_,_,_,_,_,_,{1,___},_]:={RND,a};
walk[{3,a___},_,_,0,_,_,_,_,_,_,_,_,_]		:=0;
walk[{4,a___},_,_,_,0,_,_,{1,___},_,_,_,_,_]:={RND,a};
walk[{4,a___},_,_,_,0,_,_,_,{3,___},_,_,_,_]:={RND,a};
walk[{4,a___},_,_,_,0,_,_,_,_,_,_,_,{2,___}]:={RND,a};
walk[{4,a___},_,_,_,0,_,_,_,_,_,_,_,_]		:=0;
(* Any other occupied site remains occupied and the
	individual faces a random direction: *)
walk[{_,a___},_,_,_,_,_,_,_,_,_,_,_,_]		:={RND,a};
(*An empty site remain empty if two or more walkers face it:*)
walk[0,{3,___},{4,___},_,_,_,_,_,_,_,_,_,_]	:=0;
walk[0,{3,___},_,{1,___},_,_,_,_,_,_,_,_,_]	:=0;
walk[0,{3,___},_,_,{2,___},_,_,_,_,_,_,_,_]	:=0;
walk[0,_,{4,___},{1,___},_,_,_,_,_,_,_,_,_]	:=0;
walk[0,_,{4,___},_,{2,___},_,_,_,_,_,_,_,_]	:=0;
walk[0,_,_,{1,___},{2,___},_,_,_,_,_,_,_,_]	:=0;
(*An empty site becomes occupied if it is faced by exactly
	one individual:*)
walk[0,{3,a___},_,_,_,_,_,_,_,_,_,_,_]		:={RND,a};
walk[0,_,{4,a___},_,_,_,_,_,_,_,_,_,_]		:={RND,a};
walk[0,_,_,{1,a___},_,_,_,_,_,_,_,_,_]		:={RND,a};
walk[0,_,_,_,{2,a___},_,_,_,_,_,_,_,_]		:={RND,a};
walk[0,_,_,_,_,_,_,_,_,_,_,_,_]				:=0;

(*The MAP part gives an array with 13  n x n matrices showing 
	how society looks from 13 positions. MAPTHREAD threads one
	cell each from the n x n matrices to fetch the 13 
	arguments needed by WALK.*)
GN[func_,lat_]:=
	MapThread[func, Map[RotateRight[lat,#]&,
						{{0,0},{1,0},{0,-1},{-1,0},{0,1},
						 {1,-1},{-1,-1},{-1,1},{1,1},{2,0},
						 {0,-2},{-2,0},{0,2}}], 
				2];

(*Return first and last states. Avoid NestList as it very 
	computationally intensive.*)
{society, Nest[GN[walk,#]&, society, t]}
]

startTime = AbsoluteTime[];
{firstImg, lastImg} = randomWalkers[100, 0.65, 1, 1, 1, 1, 10000];

m = Max[first];
image = Show[GraphicsArray[Map[Graphics[RasterArray[Map[
				If[# === 0, GrayLevel[1], GrayLevel[#[[2]]/m]]&, #, {2}]], 
						AspectRatio -> Automatic]&, {firstImg, lastImg}]]];

Import["ExportImage.wls"]

exportImage[image, "comp10k"]
stopTime = AbsoluteTime[];
Print[stopTime - startTime]