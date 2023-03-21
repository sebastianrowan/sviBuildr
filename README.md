sviBuildr
================

# sviBuildr

<img src=logo.png width = "250px">

<!-- badges: start -->

[![R-CMD-check](https://github.com/sebastianrowan/sviBuildr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sebastianrowan/sviBuildr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

`sviBuildr` is an R package that allows users to download or construct
Social Vulnerability Index datasets as tidyverse dataframes or as simple
features dataframes for spatial analyses. Users can choose to download
precompiled datasets from the
[CDC](https://www.atsdr.cdc.gov/placeandhealth/svi/data_documentation_download.html)
or compile the SVI with data from the US Census Bureau’s American
Community Survey.

Pre-compiled SVI data is only available for individual states or as a
single SVI for the entire nation. Downloading raw Census data and
compiling the SVI with `sviBuildr` allows users to construct an SVI for
any study area in the US. For example, one could calculate the SVI for a
study area consisting of three states in which SVI scores are calculated
by comparing values across counties in just the three states rather than
across all 50 states:

```` markdown
```{r}
library(sviBuildr)

tristate_svi <- calculate_svi(
    geography = "county", year = 2020, state = c("ME", "NH", "VT")
)
```
````

Currently, calculating the SVI is only available for the year 2020 using
the updated method published by the CDC/ATSDR \[1\].

This package utilizes the
[tidycensus](https://github.com/walkerke/tidycensus/blob/master/README.md)
package to interface with the US Census Bureau API and download the data
for compiling the SVI \[2\].

Note: This package is not endorsed or developed by the CDC/ATSDR nor has
it undergone peer-review. For official documentation, publications, and
other information, please visit the official Social Vulnerability Index
web page at https://www.atsdr.cdc.gov/placeandhealth/svi/index.html.

## Installation

sviBuilr can be installed from this repositority using:

```` markdown
```{r}
install.packages('devtools')
devtools::install_github('sebastianrowan/sviBuildr')
```
````

## References

<div id="refs" class="references csl-bib-body">

<div id="ref-cdc-atsdr_cdcatsdr_2022" class="csl-entry">

<span class="csl-left-margin">\[1\] </span><span
class="csl-right-inline">CDC-ATSDR, “CDC/ATSDR SVI 2020 documentation.”
2022. Available:
<https://www.atsdr.cdc.gov/placeandhealth/svi/documentation/SVI_documentation_2020.html></span>

</div>

<div id="ref-walker_tidycensus_2022" class="csl-entry">

<span class="csl-left-margin">\[2\] </span><span
class="csl-right-inline">K. Walker and M. Herman, *Tidycensus: Load US
census boundary and attribute data as ’tidyverse’ and ’sf’-ready data
frames*. 2022. Available:
<https://CRAN.R-project.org/package=tidycensus></span>

</div>

</div>
