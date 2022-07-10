# Problem 1
random_numbers <- rnorm(10000, 0, 1)

# a
hist(random_numbers, col = "blue", freq = FALSE); plot(dnorm, col = 'red', xlim = c(-4, 4), add = TRUE)

# b
rel_freq <- function(x, v) {
  count <- 0
  for (elem in v) {
    if (elem <= x) {
      count <- count + 1
    }
  }
  return(count)
}

# c
x_values <- seq(-4, 4, by = 0.05)
y_values <- x_values
index <- 0
for (x in x_values) {
  y_values[index]= rel_freq(x, random_numbers)
  index = index + 1
}
plot(x_values, 1/10000*y_values, col = "red"); plot(pnorm, xlim = c(-4,4), add = TRUE)


# Problem 2
lambda <- 3
poisson_numbers <- rpois(10000, lambda)

# a
pois_mean <- mean(poisson_numbers)
expected <- lambda
# expected mean: E[X]=lambda
difference <- abs(pois_mean - expected)

# b
squared <- poisson_numbers^2
squared_mean <- mean(squared)
expected <- lambda^2 + lambda
# expected: squared_mean = mean^2 = lambda^2;
difference2 <- abs(squared_mean - expected)

# c
# show that E[lambda^-X]=e^(1-lambda)?
# Here: E[X^2] (b) -> lambda=X;X=-2?
#exp(1 + 2)
calculated_expected_value <- mean(lambda^(-poisson_numbers))
difference3 <- calculated_expected_value - exp(1-lambda)
