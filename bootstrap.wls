data = {7.05, 2.49, 16.09, 21.3, 19.21, 14.88, 16.41, 0.19, 9.71, 
  10.18, 8.81, 2.93, 18.11, 22.2, 9.79, 14.74, 4.54, 16.76, 8.46, 
  24.9}

smpl = RandomChoice[data, Length[data]]
Skewness[data]
Skewness[smpl]

skews = Table[Skewness[RandomChoice[data, Length[data]]], {1000}];
Histogram[skews]
StandardDeviation[skews]
Quantile[skews, {.025, .975}]

gdata = BlockRandom[SeedRandom[1]; 
   RandomVariate[GammaDistribution[2, 3], 100]];
Histogram[gdata]
FindDistributionParameters[gdata, GammaDistribution[\[Alpha], \[Beta]]]
FindDistributionParameters[RandomChoice[gdata, Length[gdata]],
 GammaDistribution[\[Alpha], \[Beta]]]

params := {\[Alpha], \[Beta]} /. 
  FindDistributionParameters[RandomChoice[gdata, Length[gdata]], 
   GammaDistribution[\[Alpha], \[Beta]]]

ests = Table[params, {100}];
Mean[ests]
Correlation[ests] // MatrixForm

