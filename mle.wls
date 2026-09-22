(* https://mathematica.stackexchange.com/a/226691 *)

dist = ProbabilityDistribution[(Sqrt[(2 / π)] / σ) Exp[-(x - μ) ^ 2 /
   (2 σ^2)], {x, μ, ∞}, Assumptions -> σ > 0]

SeedRandom[12345];

data = RandomVariate[dist /. {μ -> 4, σ -> 3}, 1000];

mle = FindDistributionParameters[data, dist /. μ -> 4]

logL = LogLikelihood[dist /. μ -> 4, data];

stdErr = Sqrt[-1 / (D[logL, {σ, 2}]) /. mle]

FindDistributionParameters[data - μ /. μ -> 4, HalfNormalDistribution[
  Sqrt[π / 2] / σ]]
