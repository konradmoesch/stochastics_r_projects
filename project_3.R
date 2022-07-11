# Project 03 template

# Problem 1: Analyse basic parameters of data

# ToDo: 1a)
sample1 <- rbinom(n = 50, p = 0.5, size = 10000)
sample2 <- rbinom(n = 50, p = 0.1, size = 10000)

# ToDo: 1b)
mean1 <- mean(sample1)
mean2 <- mean(sample2)
median1 <- median(sample1)
median2 <- median(sample2)
var1 <- var(sample1)
var2 <- var(sample2)
print(paste("Mean: ", mean1, " ", mean2))
print(paste("Median: ", median1, " ", median2))
print(paste("Variance: ", var1, " ", var2))

# ToDo: 1c)
random_numbers <- data.frame(
  data = c(sample1, sample2),
  id = c(seq(from = 1, to = 1, length = 10000), seq(from = 2, to = 2, length = 10000))
)
boxplot(data ~ id, data = random_numbers)
# What do you see?
# I see four exactly identical boxes??
# TODO: verifiy correctness


# Problem 2: Testing a hypothesis

# ToDo: 2a)
height <- read.table("students.csv", sep = ",")["height"]

# ToDo: 2b)
summary(height)
plot(height)
hist(unlist(height), freq = FALSE)

# 2c)
# installing and loading the package compositions for the Gauss test
if (!require(compositions)) {
  install.packages("compositions")
}
library(compositions)

# 1) Prior knowledge: Data are normally distributed with unknown mean and sd = 11

# ToDo:
# 2) Hypotheses:
# 3) Error level:
# 4) Test statistic:
# 5) Perform the test:

# 6) Decision:


# ToDo: 2d)
# Does this interval fit to your result in c)?

# ToDo: 2e)
# Throughout the task we assumed that the height is normally distributed.
# Is this assumption reasonable in your opinion?
