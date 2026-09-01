BootMeanCI[data_, size_:1000, conf_:0.95] :=
  Module[{n, bsamples, means, alpha},
    n = Length[data];
    bsamples = Table[RandomChoice[data, n], {size}];
    means = Mean /@ bsamples;
    alpha = (1 - conf) / 2;
    Quantile[means, {alpha, 1 - alpha}]
  ]

SeedRandom[42];
xs = RandomVariate[NormalDistribution[100, 15], 20];
BootMeanCI[xs, 2000]

(* Asymptotic 95% CI follows *)
Needs["HypothesisTesting`"]
MeanCI[xs]
