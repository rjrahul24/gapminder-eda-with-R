# gapminder-eda-with-R

This repository is a refresher of the R programming language and uses the Gapminder dataset to explore statistical analysis on R.

Introduction to TidyVerse

The tidyverse is an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures.

Install the complete tidyverse with:

install.packages("tidyverse")

More on: https://www.tidyverse.org/

Gapminder Dataset

Source: https://www.gapminder.org/data/documentation/

Gapminder combines data from multiple sources into unique coherent time-series that can’t be found elsewhere.

Most of our data are not good enough for detailed numeric analysis. They are only good enough to revolutionize people’s worldview. But we only fill in gaps whenever we believe we know roughly what the numbers would have been, had they existed. The uncertainties are often large. But we comfort ourselves by knowing the errors in peoples worldview are even larger. Our data is constantly improved by feedback in our data forum from users finding mistakes.

Per-capita GDP (Gross domestic product) is given in units of international dollars, “a hypothetical unit of currency that has the same purchasing power parity that the U.S. dollar had in the United States at a given point in time” – 2005, in this case.

Package contains two main data frames or tibbles:

gapminder: 12 rows for each country (1952, 1955, …, 2007). It’s a subset of …
gapminder_unfiltered: more lightly filtered and therefore about twice as many rows.
Note: this package exists for the purpose of teaching and making code examples. It is an excerpt of data found in specific spreadsheets on Gapminder.org circa 2010. It is not a definitive source of socioeconomic data and I don’t update it. Use other data sources if it’s important to have the current best estimate of these statistics.

Install and test drive
Install gapminder from CRAN:

install.packages("gapminder")
Or you can install gapminder from GitHub:

devtools::install_github("jennybc/gapminder")
Load it and test drive with some data aggregation and plotting:

library("gapminder")


