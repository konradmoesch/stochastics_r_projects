# Problem 1
random_numbers <- rnorm(10000, 0, 1)

# a
hist(random_numbers, freq = FALSE, xlim = c(-4, 4))
x <- c(-4, -3, -2, -1, 0, 1, 2, 3, 4)
d <- dnorm(x)
hist(d, col = 'blue', freq = FALSE, add = TRUE)

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
plot(x_values, y_values)
plot(x_values, pnorm(x_values))
#distribution_function <- pnorm(random_numbers)


# Problem 2
lambda <- 3
poisson_numbers <- rpois(10000, lambda)

# a
pois_mean <- mean(poisson_numbers)
# expected mean: E[X]=lambda
difference <- abs(pois_mean - lambda)

# b
squared <- poisson_numbers^2
squared_mean <- mean(squared)
# expected: squared_mean = mean^2 = lambda^2;
difference2 <- abs(squared_mean - lambda^2)

# c
# show that E[lambda^-X]=e^(1-lambda)?
# Here: E[X^2] (b) -> lambda=X;X=-2?
exp(1 + 2)
