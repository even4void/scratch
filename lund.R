qlund <- function(a, n, q) {
  # calculates critical value for outlier detection according to
  # Lund, R.E. 1975, Tables for an approximate test for outliers in linear
  #   models, Technometrics, 17(4), 473-476.
  # Prescott, P. 1975, An approximate test for outliers in linear models,
  #   Technometrics, 17(1), 129-132.
  # a, alpha value
  # n, No. data elements
  # q, No. independent variables (including intercept if any)
  Fobs <- qf(c(1-(a/n)), 1, n-q-1, lower.tail=TRUE)
  qval <- ((n-q)*Fobs/(n-q-1+F))^.5
  return(qval)
}

