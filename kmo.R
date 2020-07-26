
kmo.test <- function(x) {
	# Hutcheson, The multivariate social scientist: Introductory 
	# statistics using generalized linear models, 1999, p. 224.
	cor.sq <- cor(x)^2
	cor.ss <- (sum(cor.sq)-dim(cor.sq)[1])/2
	require(corpcor)
	pcor.sq <- cor2pcor(cor(x))^2
	pcor.ss <- (sum(pcor.sq)-dim(pcor.sq)[1])/2
	kmo <- cor.ss/(cor.ss+pcor.ss)
	return(kmo)
}