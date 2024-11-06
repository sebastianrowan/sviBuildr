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

  if ((length(geography) > 1) || !(geography %in% c("tract", "county"))) {
    msg <- ("Geography not valid.")
    rlang::abort(msg)
  }

  if (!is.logical(geometry)) {
    msg <- "Expected logical value for geometry."
    rlang::abort(msg)
  }

  if (!(year %in% c(2000, 2010, 2014, 2016, 2018, 2020, 2022))) {
    msg <- paste0("SVI not available for year ", year)
    rlang::abort(msg)
  }

  if (is.null(state)) {
      msg <- "No state specified. Requesting US data."
      message(msg)
      state <- "us"
  } else if (length(state) > 1) {
    msg <- "get_cdc only accepts one state or 'US' per request."
    rlang::abort(msg)
  }

  state <- tolower(state)

  base_url <- "svi.cdc.gov/Documents/Data"

  type_var <- ifelse(
    geometry == TRUE,
    "db",
    "csv"
  )

  counties_var <- ifelse(
    geography == "county",
    "states_counties",
    "states"
  )

  state_name <- validate_state(state, "name_fmt")

  territory_var <- ifelse(
    state_name == "US",
    paste0("SVI_", year, "_US"),
    state_name
  )

  county_var <- ifelse(
    geography == "county",
    "_county",
    ""
  )

  file_ext <- ifelse(
    geometry == TRUE,
    ".zip",
    ".csv"
  )

  filename = paste0(territory_var, county_var, file_ext)

  url <- paste(
    base_url,
    year,
    type_var,
    counties_var,
    filename,
    sep = "/"
  )

  temp <- tempfile()
  utils::download.file(url, temp)

  if (geometry == FALSE) {
    svi_data <- readr::read_csv(temp)
  } else {
    temp2 <- tempfile()
    utils::unzip(temp, exdir = temp2)

    if (endsWith(list.files(temp2)[1], ".gdb")) {
      svi_data <- sf::st_read(list.files(temp2, full.names = TRUE)[1])
    } else {
      svi_data <- sf::st_read(list.files(list.files(temp2, full.names = T), full.names = TRUE))
    }
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
    state == "us",
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
