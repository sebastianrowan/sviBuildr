#' Utility functions for use in other functions

#' Called to check to see if "state" is a FIPS code, full name or abbreviation.
#'   modified from function in tidycensus by Kyle Walker
#'
#' @param state state name or fips code to be validated
#' @param identifier indicates whether to return state fips (default),
#'   abbreviation, or name.
#' @return a valid state FIPS code or chosen identifier
validate_state <- function(state = NULL, identifier) {

  if (is.null(state)) {
    msg <- "No state specified"
    rlang::abort(msg)
  }

  state <- tolower(state)

  if (!(identifier %in% c("fips", "abb", "name", "name_fmt"))) {
    msg <- paste(identifier, "is not a valid identifier")
    rlang::abort(msg)
  }

  if (state == "us") {
    return("US")
  } else if (grepl("^[[:digit:]]+$", state)) { # we probably have FIPS

    if (state %in% fips_state_table$fips) {
      id <- fips_state_table %>%
        filter(fips == state) %>%
        pull(identifier)
      return(id)
    } else {
      stop(
        sprintf(
          "'%s' is not a valid FIPS code or state name/abbreviation",
          state
        ),
        call. = FALSE
      )
    }

  } else if (grepl("^[[:alpha:]]+", state)) { # we might have state abbr or name

    if (nchar(state) == 2 && state %in% fips_state_table$abb) { # abbr
      id <- fips_state_table %>%
        filter(abb == state) %>%
        pull(identifier)
      return(id)

    } else if (nchar(state) > 2 && tolower(state) %in% fips_state_table$name) {
      id <- fips_state_table %>%
        filter(name == state) %>%
        pull(identifier)
      return(id)

    } else {
      stop(
        sprintf(
            "'%s' is not a valid FIPS code or state name/abbreviation",
            state
        ),
        call. = FALSE
      )
    }
  }
}


#' Called when user specifies a region in which to calculate the SVI
#'
#' @param region sf object used to filter states to only those that intersect the region
#' @param year passed to tigris::states()
#' @return a list of state abbreviations to be used in the call to tidycensus::get_acs()
get_region_states <- function(region, year) {
  states <- tigris::states(cb = TRUE, year = year) %>%
    st_filter(region)

  return(states$STUSPS)
}
