<<<<<<< HEAD
library(gapminder)
library(dplyr)

# Dplyr data transformation verbs 
# The summarize() verb turns many rows into one by creating a new summary column (1 output)

gapminder

gapminder %>%
  summarize(mean(lifeExp))

# Average Life Expectancy for the year 2007
gapminder %>%
  filter(year==2007) %>%
    summarize(mean(lifeExp))

# Running multiple summarizations
gapminder %>%
  filter(year==2007) %>%
  summarize(meanLifeExp=mean(lifeExp), meanPop=mean(pop))

# The group_by() verb is used to summarize outputs in groups. 

# Summarize life expectancy and total population by year.
# Use the as.numeric() function for overloaded integer sizes.
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# For the year 2007, show the mean life expectancy and sum of populations for every continent
gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# Summarize the data by year and continent
gapminder %>%
  group_by(year, continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# Summarizing data using ggplot2. First, we shall take the data into a variable
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(as.numeric(pop)), meanLifeExp=mean(lifeExp))

by_year

# The basic scatterplot
library(ggplot2)
ggplot(by_year, aes(x=year, y=totalPop)) + geom_point()

# The expan_limit() verb specifies what value the axis should start from.
# We can use this to start the y-axis from 0.
ggplot(by_year, aes(x=year, y=totalPop)) + geom_point() + expand_limits(y=0)

# Group the data by year and continents and plot both
by_continent_year <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(as.numeric(pop)), meanLifeExp=mean(lifeExp))

ggplot(by_continent_year, aes(x=year, y=totalPop, color=continent)) + geom_point() + expand_limits(y=0)

# Line Charts: Change over time is clearer as it shows the trend
# geom_point - Scatterplot, geom_line() - Line Chart

# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x=year, y=medianGdpPercap)) + geom_line() + expand_limits(y=0)

# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + geom_line() + expand_limits(y=0)

# geom_col = Bar Chart (x=Column, y=Height) - Bar plots always start with 0
# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
  filter(year==1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) + geom_col()

# Histogram - Distribution, Balance, Skew
# geom_histogram (has only one aesthetic - x-axis)
# geom_histogram(binwidth=5, gives the width of individual bins)
# geom_histogram(bins=50, specifies number of bins in the histogram)

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

ggplot(gapminder_1952, aes(x=pop_by_mil)) + geom_histogram(bins=50)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x=pop)) + geom_histogram() + scale_x_log10()

# Box plots are another visualization technique that reveal significant statistical information about the data
# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) + scale_y_log10() + geom_boxplot()

# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + ggtitle("Comparing GDP per capita across continents")
=======
library(gapminder)
library(dplyr)

# Dplyr data transformation verbs 
# The summarize() verb turns many rows into one by creating a new summary column (1 output)

gapminder

gapminder %>%
  summarize(mean(lifeExp))

# Average Life Expectancy for the year 2007
gapminder %>%
  filter(year==2007) %>%
    summarize(mean(lifeExp))

# Running multiple summarizations
gapminder %>%
  filter(year==2007) %>%
  summarize(meanLifeExp=mean(lifeExp), meanPop=mean(pop))

# The group_by() verb is used to summarize outputs in groups. 

# Summarize life expectancy and total population by year.
# Use the as.numeric() function for overloaded integer sizes.
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# For the year 2007, show the mean life expectancy and sum of populations for every continent
gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# Summarize the data by year and continent
gapminder %>%
  group_by(year, continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(as.numeric(pop)))

# Summarizing data using ggplot2. First, we shall take the data into a variable
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(as.numeric(pop)), meanLifeExp=mean(lifeExp))

by_year

# The basic scatterplot
library(ggplot2)
ggplot(by_year, aes(x=year, y=totalPop)) + geom_point()

# The expan_limit() verb specifies what value the axis should start from.
# We can use this to start the y-axis from 0.
ggplot(by_year, aes(x=year, y=totalPop)) + geom_point() + expand_limits(y=0)

# Group the data by year and continents and plot both
by_continent_year <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(as.numeric(pop)), meanLifeExp=mean(lifeExp))

ggplot(by_continent_year, aes(x=year, y=totalPop, color=continent)) + geom_point() + expand_limits(y=0)

# Line Charts: Change over time is clearer as it shows the trend
# geom_point - Scatterplot, geom_line() - Line Chart

# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year, aes(x=year, y=medianGdpPercap)) + geom_line() + expand_limits(y=0)

# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap=median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + geom_line() + expand_limits(y=0)

# geom_col = Bar Chart (x=Column, y=Height) - Bar plots always start with 0
# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
  filter(year==1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) + geom_col()

# Histogram - Distribution, Balance, Skew
# geom_histogram (has only one aesthetic - x-axis)
# geom_histogram(binwidth=5, gives the width of individual bins)
# geom_histogram(bins=50, specifies number of bins in the histogram)

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

ggplot(gapminder_1952, aes(x=pop_by_mil)) + geom_histogram(bins=50)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x=pop)) + geom_histogram() + scale_x_log10()

# Box plots are another visualization technique that reveal significant statistical information about the data
# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) + scale_y_log10() + geom_boxplot()

# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + ggtitle("Comparing GDP per capita across continents")
>>>>>>> c4048aedb06747a7743132c88fe2bdc5e5cdbad0
