.. Data Visualization documentation master file, created by
   sphinx-quickstart on Tue Apr 19 14:29:22 2016.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. toctree::
    :hidden:
    
	self
	vizWithR


Data Visualization
==================

This data visualization module created for the IFMR-LEAD staff meet will touch upon various topics (listed below). However, the only tools that will be covered in detail are basic data visualizations using R and Tableau Public. 

If time permits (and if everyone's interested), we could cover a few advanced tools as well. We encourage you to set up everything before the session, by following the steps described in `Getting Started`_.

Tools
------

- R - ggplot / ggvis / htmlwidgets / ggmap / shiny
- `Tableau <https://public.tableau.com/>`_
- Python - matplotlib
- `Raw <http://raw.densitydesign.org/>`_
- `Plot.ly <https://plot.ly/>`_
- Advanced visualization tools:

  + `D3.js <https://d3js.org/>`_
  + `Chart.js <http://www.chartjs.org/>`_
  + `Dygraphs <http://dygraphs.com/>`_

Getting Started
===============
Please follow these steps to install necessary software before the session:

Setting up R
------------

- Download and install `R <https://cran.r-project.org/>`_
- Download and install `RStudio <https://www.rstudio.com/products/rstudio/download/>`_
- Open RStudio, and in the console (at the bottom left of the screen), copy and paste the following snippet of code, and press enter. This should download and install all the required packages:

.. highlight:: R

::

	install.packages(c('dplyr','ggplot2','ggvis'))

Tableau Public
--------------

- Download and install `Tableau Public <https://public.tableau.com/s/download>`_. You may be asked to sign up with your email address.
