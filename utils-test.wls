#!/usr/bin/env -S wolframscript --print all
(* ::Package:: *)

Import["utils.wls"]

(* MakeDataset *)
labels = {"x", "y", "z"};
values = {{1, 2, 3}, {4, 5, 6}};
ds = MakeDataset[values, labels]

(* describe *)
SeedRandom[101];
n = 100;
xs = RandomReal[NormalDistribution[10, 1], n];
TableForm[describe /@ {xs}, TableHeadings -> {None, {"Mean", "SD", "Median", "Min", "Max"}}]
