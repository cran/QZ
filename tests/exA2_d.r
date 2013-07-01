library(QZ, quiet = TRUE)

### Get eigenvalues
A <- exA2$A
ret0 <- qz.dgeev(A)
ret1 <- qz.dgees(A)

# Reordering eigenvalues
T <- ret1$T
Q <- ret1$Q
select <- c(TRUE, FALSE, FALSE, TRUE)
ret2 <- qz.dtrsen(T, Q, select)

# Verify 0
round(ret0$WR - ret1$WR)
round(ret0$WI - ret1$WI)

# Verify 1
A.new <- ret2$Q %*% ret2$T %*% solve(ret2$Q)
round(A - A.new)

# verify 2
round(ret2$Q %*% solve(ret2$Q))
