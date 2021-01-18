#!/usr/bin/env wolframscript

(*problem 9 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.*)

list = Subsets[Table[n, {n, 1, 1000}],{3}];

Select[list, (((list[[#]][[1]])^2 + (list[[#]][[2]])^2 + (list[[#]][[3]])^2 - 2*((Max[list[[#]]])^2) == 0) && ((list[[#]][[1]] + list[[#]][[2]] +list[[#]][[3]]) == 1000))&]