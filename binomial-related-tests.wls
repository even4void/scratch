(* https://mathematica.stackexchange.com/a/67025 *)

SeedRandom[124];

data = RandomVariate[BinormalDistribution[{1, 2}, {1/3, 4}, 3/4], 1000
  ];

LocationTest[data, {1, 2}]

{VarianceTest[data[[All, 1]], .4^2], VarianceTest[data[[All, 2]], 4.5
  ^2]}

CorrelationTest[data, .85]
