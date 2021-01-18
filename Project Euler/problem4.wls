#!/usr/bin/env wolframscript
(*Problem 4.

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*)

(*failed to implement recursion. *)
(* threeDigitNos = Table[n, {n, 100, 999}]; (*100, 999*)
Products[i_,j_]:= threeDigitNos[i] * threeDigitNos[j];

CheckPalindrome[i_,j_]:= If[PalindromeQ[Products[i,j]], Products[i,j]];
PalindromeAppend[900,900]:= CheckPalindrome[900,900];
PalindromeAppend[i_,900]:= Join[{CheckPalindrome[i,900]}, {PalindromeAppend[i+1,1]}];
PalindromeAppend[i_,j_]:= Join[{CheckPalindrome[i,j]}, {PalindromeAppend[i,j+1]}];

Print@ PalindromeAppend[1,1] *)


Max@ Select[Flatten@ Table[i*j, {i, 100, 999}, {j, 100, 999}], PalindromeQ]