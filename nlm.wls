(* https://mathematica.stackexchange.com/a/149884 *)
data = {{0, 1}, {1, 0}, {3, 2}, {5, 4}, {6, 4}, {7, 5}};
nlm = NonlinearModelFit[data, Log[a + b x^2], {a, b}, x];
mle = Append[nlm["BestFitParameters"], σ -> nlm["EstimatedVariance"]^0.5]
nlm["CovarianceMatrix"]
nlm["ParameterErrors"]

(* Construct the log likelihood function *)
logL = LogLikelihood[NormalDistribution[0, σ],
   data[[All, 2]] - Log[a + b data[[All, 1]]^2]];

(* Get maximum likelihood estimates *)
sol = NMaximize[{logL, σ > 0 && a > 0 && b > 0}, {a, b, σ}]
(* {-6.039843700423039`,
   {a -> 1.5063204889322932`,b -> 1.4263297932385333`,σ -> 0.6621269804210389`}} *)


(* Adjust estimator of σ so that the estimator of σ^2 is unbiased *)
n = Length[data];
p = 2;  (* Number of fixed parameters to be estimated: a and b *)
sigma = σ Sqrt[n/(n - p)] /. sol[[2]]
(* Modify the maximum likelihood estimate for σ *)
sol[[2, 3]] = σ -> sigma;

(* Now get the standard errors for the estimators of a and b *)
(* First construct the second derivative of logL symbolically *)
symbolicData = Table[{x[i], y[i]}, {i, n}];
logL = LogLikelihood[NormalDistribution[0, σ],
   symbolicData[[All, 2]] - Log[a + b symbolicData[[All, 1]]^2]];
h = D[logL, {{a, b}, 2}];
(* Now determine the expectation of h *)
Eh = h /. y[i_] -> Log[a + b x[i]^2] /. Table[x[i] -> data[[i, 1]], {i, n}];

(* Take the minus the inverse and plug in the maximum likelihood estimators to
   get the estimates of the variances and covariance of the parameter estimators *)
cov = -Inverse[Eh] /. sol[[2]]

(* Standard error for the estimator of a *)
cov[[1, 1]]^0.5
(* Standard error for the estimtor of b *)
cov[[2, 2]]^0.5
