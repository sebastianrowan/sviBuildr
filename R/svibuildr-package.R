#' Return a social vulnerability index for a specified region according to the
#' CDC ATSDR methodology using the tidycensus package developed by Kyle Walker.
#'
#' This packages uses US Census Bureau data but is neither endorsed nor
#' supported by the US Census Bureau.
#'
#' This package used the SVI methodology published by the CDC Agency for
#' Toxic Substances and Disease Registry (ATSDR) but is neither endorsed nor
#' supported by the ADSTR.
#'
## usethis namespace: start
#' @author Sebastian Rowan
#' @name sviBuildr
#' @docType package
#' @import cli
#' @import withr
#' @import magrittr
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom dplyr ntile
#' @import stringr
#' @importFrom glue glue
#' @importFrom lifecycle deprecated
#' @importFrom rlang inform abort arg_match sym
#' @import tidyselect
#' @import sf
#' @import tigris
#' @import tidycensus
## usethis namespace: end
NULL