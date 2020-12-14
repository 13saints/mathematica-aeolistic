#!/usr/bin/env wolframscript

(*Understanding how SeedRandom functions.*)

SeedRandom[100]

Print@ Table[Random[Integer, {0, 99}], {12}]
