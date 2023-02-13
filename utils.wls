#!/usr/bin/env wolframscript
(* ::Package:: *)

(* https://stackoverflow.com/a/1170520 *)
Expect[ description_, val_, expr_ ] :=
If[
    val != expr,
    Throw[
        StringJoin["GOT UNEXPECTED VALUE ", ToString[expr],
        " INSTEAD OF ", ToString[val]]
        , "assertion exception"
    ]
]

MakeDataset[data_List, header_List] := Dataset[AssociationThread[header, #] & /@ data]

describe[v_List] := {Mean[v], StandardDeviation[v], Median[v], Min[v], Max[v]}

