#!/usr/bin/env wolframscript

(*
Problem 1.

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*)

ListOfMultiples[factor_, upperLimit_] :=
Module[{trueUpperLimit} (*local variables*),
trueUpperLimit = (upperLimit - 1) - ((upperLimit - 1) ~Mod~ factor) (*this gives us the highest multiple of the factor that is below the upperlimit.*);
AdjustedListOfMultiples[factor, factor] := {factor} (*base case.*);
AdjustedListOfMultiples[factor, a_] := {a, AdjustedListOfMultiples[factor, a - factor]} (*recursive definition.*);
Flatten[AdjustedListOfMultiples[factor, trueUpperLimit]] (*returns a set of multiples*)
]

Print@ Total@ Union[ListOfMultiples[3, 1000], ListOfMultiples[5, 1000]]
