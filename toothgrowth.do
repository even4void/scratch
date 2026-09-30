use https://aliquote.org/pub/toothgrowth.dta
bootstrap dobs = (r(mu_1) - r(mu_2)), reps(1000) seed(101): ttest len, by(supp)
estat bootstrap, all
bayes: regress len i.supp
bayestest interval {len:1.supp}, lower(-0.01) upper(0.01)
