#' Download SVI data files directly from the CDC ATSDR Website.
#'
#' @param  geography The desired geographic scale for the SVI. Can be
#'   "county" or "tract".
#' @param year The year of the SVI to download. Can be 2000, 2010, 2014, 2016,
#'   2018, or 2020 (the default). Shapefiles and county-level data are not
#'   currently available for2000 or 2010 data.
#' @param state The name, abbreviation, or FIPS code of the state for which the
#'   SVI is being requested. If NULL (the default), requests data for the
#'   entire US.
#' @param geometry if FALSE (the default), return the SVI as tibble. If true,
#'   downloads the SVI as a shapefile and returns an sf tibble.
#' @return A tibble or sf tibble of the SVI and underlying data for the
#'   US or specified state.
#' @export
get_svi_from_cdc <- function(geography, year, state = NULL, geometry = FALSE) {
  geography <- tolower(geography)
  state <- tolower(state)

  if (!(geography %in% c("tract", "county"))) {
    msg <- glue::glue("Geography {geography} is not a valid input.")
    rlang::abort(msg)
  }

  if (!is.logical(geometry)) {
    msg <- "Expected logical value for geometry."
    rlang::abort(msg)
  }

  if (!(year %in% c(2000, 2010, 2014, 2016, 2018, 2020))) {
    msg <- paste0("SVI not available for year ", year)
    rlang::abort(msg)
  } else if (year %in% c(2000, 2010)) {
    get_2000_2010_data(geography, year, state, geometry)
  }

  base_url <- paste0("svi.cdc.gov/Documents/Data/", year, "_SVI_Data/")
  file_ext <- ifelse(
    geometry == TRUE,
    ".zip",
    ".csv"
  )

  folder <- ifelse(
    state == "US",
    "",
    ifelse(
      geography == "county",
      "States_Counties/",
      "States/"
    )
  )
  folder <- ifelse(
    geometry == TRUE,
    folder,
    paste0("CSV/", folder)
  )

  state_name <- validate_state(state, "name_fmt")

  filename <- ifelse(
    state_name == "US",
    paste0("SVI", year, "_US"),
    paste0(state_name)
  )
  filename <- ifelse(
    geography == "county",
    ifelse(
      year == 2014,
      paste0(filename, "_CNTY"),
      paste0(filename, "_COUNTY")
    ),
    filename
  )

  url <- paste0(
    base_url,
    folder,
    filename,
    file_ext
  )

  temp <- tempfile()
  utils::download.file(url, temp)

  if (geometry == FALSE) {
    svi_data <- readr::read_csv(temp)
  } else {
    temp2 <- tempfile()
    utils::unzip(temp, exdir = temp2)
    svi_data <- sf::read_sf(temp2)
  }

  return(svi_data)
}

#' Separate function to get 2000 and 2010 data from the CDC as these
#'   datasets aren't stored in the same scheme as other years.
#' @param geography Passed from parent function. Only tract accepted.
#' @param year The year of the SVI to download. Can be 2000 or 2010.
#' @param state The name, abbreviation, or FIPS code of the state for which the
#'   SVI is being requested. If NULL (the default), requests data for the
#'   entire US.
#' @param geometry if FALSE (the default), return the SVI as tibble. If true,
#'   downloads the SVI as a shapefile and returns an sf tibble.
#' @return A tibble or sf tibble of the SVI and underlying data for the
#'   US or specified state.
get_2000_2010_data <- function(geography, year, state, geometry) {

  base_url <- paste0("svi.cdc.gov/Documents/Data/", year, "_SVI_Data/CSV/")

  if (geography == "county") {
    msg <- "County data not available for 2000 or 2010 data."
    rlang::abort(msg)
  }

  if (geometry == TRUE) {
    #TODO: download correct tiger shapefile and then join svi data.
    msg <- "Shapefiles not available for 2000 or 2010 data."
    rlang::abort(msg)
  }

  file_ext <- ".csv"

  folder <- ifelse(
    state == "US",
    "",
    "States/"
  )

  state_name <- validate_state(state, "name_fmt")

  filename <- ifelse(
    state_name == "US",
    paste0("SVI", year, "_US"),
    paste0(state_name)
  )

  url <- paste0(
    base_url,
    folder,
    filename,
    file_ext
  )

  temp <- tempfile()
  utils::download.file(url, temp)
  svi_data <- readr::read_csv(temp)

  return(svi_data)
}
