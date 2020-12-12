#!/usr/bin/env wolframscript 

(* Count all the words in a folder and print it. *)

ListOfFiles = FileNames["*.md"];
Looper = Range@ Length@ ListOfFiles;
Contents = (Import@ ListOfFiles[[#]])& /@ Looper;
TotalCount = Total@ WordCount@ Contents;

Print[" ---------------------------------------------------- "]
Print["              Folder Total: ", TotalCount, " words."]
Print[" ---------------------------------------------------- "]
