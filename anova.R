# A set of functions to work with standard ANOVA models
# Time-stamp: <2006-11-19 11:28:57 chl>

obrien.test <- function(data) {
  # Welch procedure to compare k samples without assuming
  # homoscedasticity.
  # *input*
  #   a data.frame containing k (k >= 2) independant sets of
  #   observations classified by a factor
  # *output*
  #   Welch modified F-statistic (with corresponding df) and
  #   p-value
  # Reference:
  # Welch, R.L. On the comparison of several mean values: An
  #   alternative approach, Biometrika 38: 330--336, 1951.
  if (!is.data.frame(data))
    stop("you should provide a data.frame")
  if (is.data.frame(data) & ncol(data)>2)
    warning("data have more than 2 columns: assuming that second column is the desired factor")
  if (!is.factor(data[,2]))
    data[,2] <- as.factor(data[,2])
  
  my.t.test <- function(a, b) {
    # t-test for 2 independant samples without pooled variance
    na <- length(a)
    nb <- length(b)
    df <- na+nb-2
    num <- mean(a)-mean(b)
    den <- sqrt( (var(a)/na) + (var(b)/nb) )
    t.obs <- num/den
    # get a two.sided observed probability
    p.obs <- 2 * pt(-abs(t.obs), df)
    names(t.obs) <- "t"
    names(df) <- "df"
    rval <- list(statistic = t.obs, parameter = df, p.value = p.obs)
    return(rval)
  }

  N <- nrow(data)                               # total number of obs
  n.groups <- length(levels(data[,2]))          # number of groups
  Nk <- tapply(data[,1],list(data[,2]),length)  # number of obs per group
  Xk <- tapply(data[,1],list(data[,2]),mean)    # group means
  Sk <- tapply(data[,1],list(data[,2]),var)     # var of each group
  if (n.groups == 2) {
    # case 1: two samples with Nk obs for each level of the factor
    r <- data.frame(x=rep(NA,N),g=data[,2])     # transformed values
    for (j in 1:2) {
      for (i in 1:Nk[j])
        r$x[as.numeric(r$g)==j] <- ((Nk[j]-1.5)*Nk[j]*(data[,1][as.numeric(data[,2])==j]-Xk[j])^2-0.5*Sk[j]*(Nk[j]-1)) / ((Nk[j]-1)*(Nk[j]-2))
    }
    cat("Welch modified t test for 2 samples without\
    homoscedasticity assumption\n")
    my.t.test(r$x[r$g==1],r$x[r$g==2])
  }
  else {
    # case 2: k samples, again with Nk obs per factor's level
    Wk <- Nk/Sk
    Xprime <- sum(Wk*Xk)/sum(Wk)
    num <- sum(Wk*(Xk-Xprime)^2)/(n.groups-1)
    den <- 1 + 2*(n.groups-2)/(n.groups^2-1) *
      sum((1/Nk-1)*(1-Wk/sum(Wk)))^2
    f.obs <- num/den
    df <- c(n.groups-1,(n.groups^2-1) / (3*sum((1/(Nk-1))*(1-Wk/sum(Wk))^2)))
    p.obs <- 1-pf(f.obs,df[1],df[2])
    names(f.obs) <- "F"
    names(df) <- c("df1","df2")
    rval <- list(statistic = f.obs, df = round(df,3), p.value = p.obs)
    cat("Welch modified F test for k samples without\
    homoscedasticity assumption\n")
    return(rval)
  }
}
                     
hotelling.test <- function(data) {
  # Hotelling T^2 test for 2 multivariate independant samples
  
}
 
    
minf <- function(f1,f2,n1,n2) {
  # computes minF
  # Source: http://vasishth-statistics.blogspot.com/
  fprime <- (f1*f2)/(f1+f2)
  n <- round(((f1+f2)*(f1+f2))/(((f1*f1)/n2)+((f2*f2)/n1)))
  return(paste("minF(",n,")=",round(fprime,digits=2),", crit=",round(qf(.95,1,n)),sep=""))
}
