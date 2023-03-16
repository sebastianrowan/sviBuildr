#' Return a social vulnerability index for a specified region according to the
#' CDC ADSTR methodology using the tidycensus package developed by Kyle Walker.
#'
#' This packages uses US Census Bureau data but is neither endorsed nor
#' supported by the US Census Bureau.
#'
#' This package used the SVI methodology published by the CDC Agency for
#' Toxic Substances and Disease Registry (ADSTR) but is neither endorsed nor
#' supported by the ADSTR.
#'
#' @author Sebastian Rowan
#' @name svibuildr
#' @docType package
#' @import sf
#' @import dplyr
#' @import tigris
#' @import stringr
#' @importFrom rlang inform abort arg_match sym
#' @import tidyselect
#' @import tidycensus
NULL