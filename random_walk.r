## Time-stamp: <2020-01-07 14:09:33 chl>

walker <- function(n, step = 0.1) {
  coord <- replicate(2, sample(c(-1, 1), n, rep = TRUE) + step * rnorm(n))
  return(apply(coord, 2, cumsum))
}

inside_rect <- function(coords, x, y) {
  ## https://stackoverflow.com/a/28979027
  ## coords is a vector of length 4 from rect(), i.e. (x1,y1) and (x3,y3)
  p21 <- c(coords[1] - coords[1], coords[4] - coords[2])
  p41 <- c(coords[3] - coords[1], coords[2] - coords[2])
  p21m <- p21[1]^2 + p21[2]^2
  p41m <- p41[1]^2 + p41[2]^2
  p <- c(x - coords[1], y - coords[2])
  pp1 <- p[1] * p21[1] + p[2] * p21[2]
  pp2 <- p[1] * p41[1] + p[2] * p41[2]

  if ((0 <= pp1) & (pp1 <= p21m)) {
    if ((0 <= pp2) & (pp2 <= p41m)) {
      return(TRUE)
    } else {
      return(FALSE)
    }
  }
  else {
    return(FALSE)
  }
}


WD <- "~/tmp/random_walk/"
size <- 50
n <- 100
pick <- 10
pop <- replicate(size, walker(n))
xs <- range(pop[, 1, ])
ys <- range(pop[, 2, ])
## rr <- c(xs[1], ys[1], xs[2], ys[2])
rr <- c(-10, -10, 10, 10)
seen <- matrix(nr = 0, ncol = 10)

SAVE <- TRUE

for (k in seq(n)) {
  if (SAVE) {
    png(paste(WD, "rw", formatC(k, digits = 3, flag = "0"), ".png", sep = ""),
      width = 600, height = 600, type = "cairo-png", res = 150
    )
  }
  op <- par(mar = rep(0, 4), xpd = NA)
  plot(0,
    type = "n", xlim = xs, ylim = ys, xlab = "", ylab = "",
    axes = FALSE
  )
  rect(rr[1], rr[2], rr[3], rr[4], col = "#B3B3B380", border = NA)
  pchs <- rep(21, size)
  cols <- rep(1, size)
  if (k %% 20 == 0) {
    cnt <- 0
    marks <- numeric(0)
    while (cnt < pick) {
      mark <- sample(size, 1)
      if (inside_rect(rr, pop[k, 1, mark], pop[k, 2, mark])) {
        if (!(mark %in% marks)) {
          marks <- append(marks, mark)
          cnt <- cnt + 1
        }
      }
    }
    seen <- rbind(seen, marks)
    if (k > 20) {
      cols[intersect(marks, seen[nrow(seen) - 1, ])] <- 2
    }
    pchs[marks] <- 19
  }
  points(pop[k, 1, ], pop[k, 2, ], col = cols, pch = pchs)
  par(op)
  if (SAVE) {
    dev.off()
  }
}
