# Problem 1: Monte-Carlo integration

# >>insert code here<<
n <- seq(1000, 100000, by = 1000)
monte_carlo <- n
for (i in 1:length(n)) {
  monte_carlo[i] <= (1 / n[i]) * sum()
}
# TODO: Kein Plan????
#plot(monte_carlo); plot()

# Does your simulation support the result obtained in the lecture?
# TODO: Nope, keine Ahnung


# Problem 2: PageRank and the random surfer as Markov chain

# a)
# i = current position
nextstate <- function(i) {
  links <- list(c(2, 9, 10), 3, c(1, 4, 10), c(1, 5), c(4, 6, 8), 7, 1, c(1, 7, 9), 4, 3)
  next_state_teleporting <- sample(1:10, size = 1)
  current_next_options <- links[i]
  current_next_options_unlist <- unlist(current_next_options)
  next_state_navigating <- sample(current_next_options_unlist, size = 1)
  selection_teleport <- rbinom(1, 1, 0.1)
  if (selection_teleport == 1)
    return(next_state_teleporting)
  else return(next_state_navigating)
}

print(nextstate(1))

# b)

# Define the transition matrix.

P <- matrix(data = 0.01, nrow = 10, ncol = 10)
for (i in c(2, 9, 10)) { P[1, i] <- P[1, i] + 0.3 }
P[2, 3] <- P[2, 3] + 0.9
for (i in c(1, 4, 10)) { P[3, i] <- P[3, i] + 0.3 }
for (i in c(1, 5)) { P[4, i] <- P[4, i] + 0.45 }
for (i in c(4, 6, 8)) { P[5, i] <- P[5, i] + 0.3 }
P[6, 7] <- P[6, 7] + 0.9
P[7, 1] <- P[7, 1] + 0.9
for (i in c(1, 4, 7, 9)) { P[8, i] <- P[8, i] + 0.225 }
P[9, 4] <- P[9, 4] + 0.9
P[10, 3] <- P[10, 3] + 0.9

# >>insert code here<<
n <- 10000
results <- seq(1:n)
for (loop_iteration in 1:n) {
  current <- 3
  for (i in 1:100) {
    current <- nextstate(current)
  }
  results[loop_iteration] <- current
  #print(paste(loop_iteration, current))
}

p0 <- c(0, 0, 1, 0, 0, 0, 0, 0, 0, 0)

p100 <- p0
for (i in 1:100) {
  p100 <- p100 %*% P
}
hist(results, freq = FALSE, xlim = c(0, 11), breaks = seq(0.5, 10.5, by = 1)); lines(1:10, p100, col = "red", add = TRUE)

# What do you notice when you compare the theoretical value p(100) to your
# histogram?
# Quite similar values
# TODO: sth is odd with the calculated values here

# c)

# >>insert code here<<
first_p0 <- c(0, 0, 1, 0, 0, 0, 0, 0, 0, 0)
first_p100 <- first_p0
for (i in 1:100) {
  first_p100 <- first_p100 %*% P
}
first_p200 <- first_p100
for (i in 1:100) {
  first_p200 <- first_p200 %*% P
}

second_p0 <- c(1, 0, 0, 0, 0, 0, 0, 0, 0, 1)
second_p100 <- second_p0
for (i in 1:100) {
  second_p100 <- second_p100 %*% P
}
second_p200 <- second_p100
for (i in 1:100) {
  second_p200 <- second_p200 %*% P
}

difference100 <- first_p100 - second_p100
difference200 <- first_p200 - second_p200
plot(1:10, difference100); plot(1:10, difference200, col = "Red")
plot(1:10, type = "l", first_p100); lines(1:10, second_p100, col = "Red", add = TRUE)
plot(1:10, type = "l", first_p200); lines(1:10, second_p200, col = "Red", add = TRUE)

# What do you notice for different initial distributions?
# The differences are the same regardless of number of iterations

# d)

# What is the order of the pages according to the PageRank algorithm?
# We have to sort the pages by the given probabilities (e.g p200) ->
# resulting rank: 1,3,4,10,5,9,2,7,6,8
print(order(first_p200, decreasing = TRUE))