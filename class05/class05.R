# Class 05 Data Visualization

# This is the "base" R plot
plot(cars)

# We are going to get a new plotting package called ggplot2
#ggplot(cars)

# install.packages("ggplot2")
# Now we need to call/load the package
library(ggplot2)

# This sets up the plot
ggplot(cars)

gg <- ggplot(data=cars) + aes(x=dist, y=speed) + geom_point()
print(gg)

# One last thing. lets add a line to the data
gg + geom_smooth()

# I want a liner model
gg + geom_smooth(method="lm", se=FALSE)

ggplot(data=cars) + 
  aes(x=dist, y=speed) + 
  geom_point() + 
  geom_smooth(method="lm")


# Add more layers
gg + labs(title="Some old title",
          caption="What is this?") +
  xlab("Distance (ft)") +
  ylab("Speed (mph)") +
  theme_bw()

# RNASeq experiment dataset.

# Read the data into R
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

# > Q. How many genes in this dataset?
nrow(genes)

colnames(genes)

# I want to plot this result
ggplot(genes) +
  aes(x=Condition1, y=Condition2) +
  geom_point()


#Q. How many genes are "up" regulated in this experiment
table( genes$State )

# Add some color to denote up/down values
x <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, color=State) +
  geom_point() +
  labs(title="Some gene expresion data")

print(x)



