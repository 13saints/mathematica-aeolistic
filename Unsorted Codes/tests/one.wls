#!/usr/bin/env wolframscript

list = {3, 5, 2, 1, 2, 8, 5, 6};
i = RandomInteger[Length@ list];
j = RandomInteger[Length@ list];

ii = list[[i]]
jj = list[[j]]

exchange = If[ii>jj, list /. {ii -> ii+1, jj -> jj-1},
	If[ii<jj, list /. {ii -> ii-1, jj -> jj+1}, list]]

Print@ list
Print@ i
Print@ j
Print@ exchange