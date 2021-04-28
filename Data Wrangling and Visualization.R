library(gapminder)
library(dplyr)

# Look at the gapminder dataset
gapminder

# We see that gapminder is a data with spread across 1704 rows and 6 columns
# Filtering in R is done using the filter verb that extracts specified data from the dataset
# Filters work using the (%>%) pipe operation
gapminder %>%
  filter(year == 2007, country == "United States")

# We will now be looking at the arrange verb. By default 'arrange' orders data in ascending order
# For descending order, pass the parameter within the 'desc()' function
# Filtering with arranging
gapminder %>%
  filter(year == 2007) %>%
    arrange(desc(lifeExp))

# The mutate verb is used to create/manipulate columns in a dataset
# Let us answer a question: Which countries in the dataset had the highest gdp in 2007?
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
    filter(year == 2007) %>%
      arrange(desc(gdp))

# Variable assignment in R is done using the (<-) assignment operator
gapminder_2007 <- gapminder %>%
  filter(year==2007)
gapminder_2007

# Load the 'ggplot2' package
library(ggplot2)

# Build a scatterplot for the gapminder dataset of year 2007 to see a differentiation between countries and their respective GDP
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point()

# In the ggplot function, we first enter the dataset, then give aesthetics (x and y axis) and then explain the type of graph to plot
# Geom_point = geometric graph, point meaning it is a scatterplot
# This plot showed us that higher income countries tend to have higher life expectancies as well, although this trend is not proportional.
# Log Based scaling can be done on the x-axis to make data more visible. Logarithmic scaling would make data points separate from each other, but the distance between them would be 10x the actual distance.
# For adding the log scale to the plot we add it as an additional parameter

ggplot(gapminder_2007, aes(x=gdpPercap, y=lifeExp)) + geom_point() + scale_x_log10()

# The 'color' aesthetic in ggplot2 gives an additional measure on the scatterplot.
# The 'size' aesthetic will intensify the entries on the plot and create a differentiation
# Scatter plot comparing pop and lifeExp, with color representing continent
ggplot(gapminder_2007, aes(x=pop, y=lifeExp, color=continent)) + geom_point() + scale_x_log10()

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_2007, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) + geom_point() + scale_x_log10()

# Faceting - Splitting the graphs using the ( ~ operator) to create separate plots for columns
ggplot(gapminder_2007, aes(x=pop, y=lifeExp)) + geom_point() + scale_x_log10() + facet_wrap(~continent)

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) + geom_point() + scale_x_log10() + facet_wrap(~year)

