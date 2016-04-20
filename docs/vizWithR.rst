R - ggplot2
===========
Prerequisite: make sure that you have set everything up as described in :doc:`'Getting Started' <gettingstarted>`.

Load the ggplot2 package using:

.. highlight:: R

::
   
	library(ggplot2)

Scatterplots
------------

Plotting with base R::

	plot(mtcars$hp,mtcars$mpg)

Plotting with ggplot2::
	
	scatterplot <- ggplot(mtcars, aes(x = hp,y = mpg)) +
  		geom_point()

Add axis titles::

	scatterplot <- scatterplot +
	  labs(title = "MPG vs HP",
	       x = "HP",
	       y = "Miles Per Gallon")

Make legend discrete, and add regression line for final graph::

	mtcars$gear <- as.factor(mtcars$gear)

	scatterplot <- ggplot(mtcars, aes(x = mpg,y = hp)) +
	  geom_point(aes(colour = mtcars$gear)) +
	  geom_smooth(method = "lm",se = FALSE) +
	  scale_colour_discrete(name = 'Gear',
	                        breaks = c('3','4','5'),
	                        labels = c('Low','Medium','High')) +
	  labs(title = "MPG vs HP",
	       x = "HP",
	       y = "Miles Per Gallon")
