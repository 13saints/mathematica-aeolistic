#!/usr/bin/env wolframscript

(*Smallest multiple

Problem 5
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?*)



Select[Table[n, {n, 10^7, 10^8}], (Total[Table[Mod[#,p], {p, 1, 19}]] == 0)&, 1]








