htmlwidgets
===========

:code:`htmlwidgets` allows us to use the power of D3 from within R, to produce some `fantastic visualizations`_.


- Data: All India Area Weighted Annual Rainfall (in mm)
- Data Source: India Meteorological Department (IMD)
- `Download Data`_

.. note::

	You can download the full R Script to reproduce the analysis here_. 

.. highlight:: R

- Install / load required packages using::

	# check to see if packages are installed. Install them if they are not, then load them into the R session.

	ipak <- function(pkg){
	  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
	  if (length(new.pkg)) 
	    install.packages(new.pkg, dependencies = TRUE)
	  sapply(pkg, require, character.only = TRUE)
	}

	# usage
	packages <- c("dplyr", "xts", "zoo", "lubridate",
	              "dygraphs", "tidyr", "htmlwidgets")
	ipak(packages)

- Exercise: manipulate the data and get it to this_ format. Use :code:`readRDS` to read in the processed dataset to verify that you got everything right.

- Convert the dataframe to a time series object using the :code:`xts` package::

	annualRainfall.xts <- xts(annualRainfall$rainfall,order.by = annualRainfall$year)
	names(annualRainfall.xts) <- 'rainfall'

- Your dataset is now ready for plotting. You can use :code:`dygraphs` to make an interactive graph::

	dygraph(annualRainfall.xts,main = "Annual Rainfall (mm)") %>%
	  dySeries('rainfall',label = 'Annual Rainfall (mm)') %>%
	  dyAxis('x',label = 'Year') %>%
	  dyRangeSelector() %>%
	  saveWidget(paste0(OUTPUT,'annualRainfall.html'))


- If you want to style the CSS of the graph further, you can use :code:`dyCSS`::

	dygraph(annualRainfall.xts,main = "Annual Rainfall (mm)") %>%
	  dySeries('rainfall',label = 'Annual Rainfall (mm)') %>%
	  dyAxis('x',label = 'Year') %>%
	  dyRangeSelector() %>%
	  dyCSS(paste0(CODE,'dygraphs.css')) %>%
	  saveWidget(paste0(OUTPUT,'annualRainfall.html'))

**Output**

.. raw:: html

	<iframe src="_static/annualRainfall.html" height="345px" width="100%"></iframe>



.. _fantastic visualizations: http://www.htmlwidgets.org/showcase_leaflet.html
.. _Download Data: https://data.gov.in/node/85824/datastore/export/csv
.. _here: https://github.com/shreyasgm/india-rainfall/tree/master/Code
.. _this: https://github.com/shreyasgm/data-visualization-training/raw/master/data/annualRainfall.rds