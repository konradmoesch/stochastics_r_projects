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
#  H0: mu = 171
#  H1: mu != 171
# 3) Error level:
#  alpha = 0.95
# 4) Test statistic:
#  Two-Sided Gauss test
# 5) Perform the test:
Gauss.test(unlist(height), mean = 171, sd = 11, alternative = "two.sided")

# 6) Decision:
#  T = 171.38
#  p-value: 0.001679 < 0.05 ?
# TODO: verify correctness
#  the avg value does not differ from 171, the test proves that with an error
#  level smaller than alpha.

# ToDo: 2d)
height <- unlist(height)
error_margin <- qt(0.95, df = length(height)-1)*11/sqrt(length(height))
lower_bound <- mean(height) - error_margin
upper_bound <- mean(height) + error_margin
print(paste("Interval: [", lower_bound, ", ", upper_bound, "]"))
# Does this interval fit to your result in c)?
#  Yes, the calculated T-value is inside the confidence interval??
# TODO: confirm correctness of this sentence and calculations / formulas

# ToDo: 2e)
# Throughout the task we assumed that the height is normally distributed.
# Is this assumption reasonable in your opinion?
# Yes, we can simplify the height of humans as normally distributed;
#  there are many people of some "middle" height and a few people that
#  are bigger or smaller than that.
