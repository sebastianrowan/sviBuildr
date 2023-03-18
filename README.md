# sviBuildr

![](logo.png | width=20%)

<!-- badges: start -->
[![R-CMD-check](https://github.com/sebastianrowan/sviBuildr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sebastianrowan/sviBuildr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

`sviBuildr` is an R package that allows users to download or construct Social Vulnerability Index datasets as tidyverse dataframes or as simple features dataframes for spatial analyses. Users can choose to download precompiled datasets from the [CDC](https://www.atsdr.cdc.gov/placeandhealth/svi/data_documentation_download.html) or compile the SVI with data from the US Census Bureau's American Community Survey. 

Downloading raw Census data and compiling the SVI with `sviBuildr` allows users to construct an SVI for any study area in the US. Pre-compiled SVI data is only available as separate state files or as a single SVI for the entire nation. 

This package utilizes the [tidycensus](https://github.com/walkerke/tidycensus/blob/master/README.md) package to interface with the US Census Bureau API and download the data for compiling the SVI. 

Note: This package is not endorsed or developed by the CDC/ATSDR nor has it undergone peer-review. For official documentation, publications, and other information, please visit the official Social Vulnerability Index web page at https://www.atsdr.cdc.gov/placeandhealth/svi/index.html. 