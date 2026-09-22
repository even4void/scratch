RandomWalk[t_] :=
	FoldList[Plus, 0, RandomChoice[{1, 1, 1} -> {-1, 0, 1}, t]];

Distribution[length_, n_] :=
	With[{width=2.2 Sqrt[length]},BinCounts[#,{-width,width,1}&/@Transpose[
		Table[RandomWalk[length],{n}]]];ArrayPlot[Distribution[50,1]]