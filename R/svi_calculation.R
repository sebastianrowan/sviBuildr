#' Get data from the U.S. Census Bureau's American Community Survey and
#' calculate the Social Vulnerability Index for the specified region(s)
#'
#' @param  geography The desired geographic scale for the SVI. Can be
#'   "county" or "tract"
#' @param cache_table Whether or not tidycensus should cache table names for
#'   faster future access. Defaults to FALSE.
#' @param year The end year of the 5-year ACS data to be used (Default: 2020).
#' @param use_2020_method if TRUE (the default) calculate the SVI for the given
#'   year using the most recent methodology released by the CDC (2020). If
#'   FALSE, use the most recent methology most-recent for the given year.
#' @param state An optional vector of states for which you are requesting data.
#'   State names and FIPS codes are accepted. Defaults to NULL.
#' @param county The county for which you are requesting data. County names and
#'   FIPS codes are accepted. Must be combined with a value supplied to `state`.
#'   Defaults to NULL.
#' @param geometry if FALSE (the default), return a regular tibble of ACS data.
#'   if TRUE, uses the tigris package to return an sf tibble with simple feature
#'   geometry in the `geometry` column.
#' @param include_adjunct_vars if FALSE (the default) only include the
#'   variables used to calculate the SVI. If TRUE, include additional
#'   adjunct variables which can be used to explain more about local areas in
#'   certain circumstances.
#' @param key Your Census API key. Obtain one at
#'   \url{https://api.census.gov/data/key_signup.html}
#' @param moe_level The confidence level of the returned margin of error.  One
#'   of 90 (the default), 95, or 99.
#'
#' @return A tibble or sf tibble of the SVI and underlying data for the
#'   specified area.
#' @examples \dontrun{
#' library(tidycensus)
#' library(tidyverse)
#' library(svibuildr)
#' census_api_key("YOUR KEY GOES HERE")
#'
#' nh_svi_county <- get_svi(geography = "county", state = "NH", geometry = TRUE)
#'
#' ggplot(nh_svi_county, aes(fill = rpl_themes)) +
#'   geom_sf() +
#'   coord_sf(crs = 4258) +
#'   scale_fill_viridis()
#' }
#' @export
get_svi <- function(geography, cache_table = FALSE, year = 2020,
                    use_2020_method = TRUE, state = NULL, county = NULL,
                    geometry = FALSE, include_adjunct_vars = FALSE,
                    key = NULL, moe_level = 95) {

    #TODO: Implement pre-2020 methodology
    #TODO: Add ability to download shapefiles directly from census website.

    vars <- c(
        "S0601_C01_001", "DP04_0001", "DP02_0001", "S1701_C01_040",
        "DP03_0005", "S2503_C01_028", "S2503_C01_032", "S2503_C01_036",
        "S2503_C01_040", "B06009_002", "S2701_C04_001", "S0101_C01_030",
        "B09001_001", "DP02_0072", "B11012_010", "B11012_015", "B16005_007",
        "B16005_008", "B16005_012", "B16005_013", "B16005_017", "B16005_018",
        "B16005_022", "B16005_023", "B16005_029", "B16005_030", "B16005_034",
        "B16005_035", "B16005_039", "B16005_040", "B16005_044", "B16005_045",
        "DP05_0071", "DP05_0078", "DP05_0079", "DP05_0080", "DP05_0081",
        "DP05_0082", "DP05_0083", "DP04_0012", "DP04_0013", "DP04_0014",
        "DP04_0078", "DP04_0079", "DP04_0058", "B26001_001", "S1701_C01_001",
        "DP03_0009P", "S2503_C01_001", "S0601_C01_033", "S2701_C05_001",
        "S0101_C02_030", "DP02_0072P", "B16005_001", "DP04_0014P", "DP04_0002",
        "DP04_0058P"
    )

    adj_vars <- c(
        "S2802_C01_001", "S2802_C02_001", "DP05_0078", "DP05_0071",
        "DP05_0080", "DP05_0079", "DP05_0081", "DP05_0083", "DP05_0082",
        "DP05_0078P", "DP05_0071P", "DP05_0080P", "DP05_0079P", "DP05_0081P",
        "DP05_0083P", "DP05_0082P"
    )

    if (include_adjunct_vars == TRUE) {
        vars <- c(vars, adj_vars)
    }

    raw_data <- tidycensus::get_acs(
        geography = geography, variables = vars, cache_table = cache_table,
        year = year, output = "wide", state = state, county = county,
        geometry = geometry, keep_geo_vars = TRUE, key = key,
        moe_level = moe_level, survey = "acs5"
    )

    # calculate and rename variable following SVI documentation
    # nolint start: object_usage_linter
    svi_data <- raw_data %>%
      dplyr::mutate(
        e_totpop = S0601_C01_001E,
        m_totpop = S0601_C01_001M,
        e_hu = DP04_0001E,
        m_hu = DP04_0001M,
        e_hh = DP02_0001E,
        m_hh = DP02_0001M,
        e_pov150 = S1701_C01_040E,
        m_pov150 = S1701_C01_040M,
        e_unemp = DP03_0005E,
        m_unemp = DP03_0005M,
        e_hburd = (
            S2503_C01_028E + S2503_C01_032E +
            S2503_C01_036E + S2503_C01_040E
        ),
        m_hburd = sqrt(
            S2503_C01_028M^2 + S2503_C01_032M^2 +
            S2503_C01_036M^2 + S2503_C01_040M^2
        ),
        e_nohsdp = B06009_002E,
        m_nohsdp = B06009_002M,
        e_uninsur = S2701_C04_001E,
        m_uninsur = S2701_C04_001M,
        e_age_65 = S0101_C01_030E,
        m_age_65 = S0101_C01_030M,
        e_age_17 = B09001_001E,
        m_age_17 = B09001_001M,
        e_disabl = DP02_0072E,
        m_disabl = DP02_0072M,
        e_sngpnt = (B11012_010E + B11012_015E),
        m_sngpnt = sqrt(B11012_010M^2 + B11012_015M^2),
        e_limeng = (
            B16005_007E + B16005_008E + B16005_012E + B16005_013E +
            B16005_017E + B16005_018E + B16005_022E + B16005_023E +
            B16005_029E + B16005_030E + B16005_034E + B16005_035E +
            B16005_039E + B16005_040E + B16005_044E + B16005_045E
        ),
        m_limeng = sqrt(
            B16005_007M^2 + B16005_008M^2 + B16005_012M^2 + B16005_013M^2 +
            B16005_017M^2 + B16005_018M^2 + B16005_022M^2 + B16005_023M^2 +
            B16005_029M^2 + B16005_030M^2 + B16005_034M^2 + B16005_035M^2 +
            B16005_039M^2 + B16005_040M^2 + B16005_044M^2 + B16005_045M^2
        ),
        e_minrty = (
            DP05_0071E + DP05_0078E + DP05_0079E + DP05_0080E +
            DP05_0081E + DP05_0082E + DP05_0083E
        ),
        m_minrty = sqrt(
            DP05_0071M^2 + DP05_0078M^2 + DP05_0079M^2 + DP05_0080M^2 +
            DP05_0081M^2 + DP05_0082M^2 + DP05_0083M^2
        ),
        e_munit = (DP04_0012E + DP04_0013E),
        m_munit = sqrt(DP04_0012M^2 + DP04_0013M^2),
        e_mobile = DP04_0014E,
        m_mobile = DP04_0014M,
        e_crowd = (DP04_0078E + DP04_0079E),
        m_crowd = sqrt(DP04_0078M^2 + DP04_0079M^2),
        e_noveh = DP04_0058E,
        m_noveh = DP04_0058M,
        e_groupq = B26001_001E,
        m_groupq = B26001_001M,
        ep_pov150 = (e_pov150 / S1701_C01_001E) * 100,
        mp_pov150 = (
            sqrt(m_pov150^2 - ((ep_pov150 / 100)^2 * S1701_C01_001M^2)) /
            S1701_C01_001E
        ) * 100,
        ep_unemp = DP03_0009PE,
        mp_unemp = DP03_0009PM,
        ep_hburd = (e_hburd / S2503_C01_001E) * 100,
        mp_hburd = (
            sqrt(m_hburd^2 - ((ep_hburd / 100)^2 * S2503_C01_001M^2)) /
            S2503_C01_001E
        ) * 100,
        ep_nohsdp = S0601_C01_033E,
        mp_nohsdp = S0601_C01_033M,
        ep_uninsur = S2701_C05_001E,
        mp_uninsur = S2701_C05_001M,
        ep_age_66 = S0101_C02_030E,
        mp_age65 = S0101_C02_030M,
        ep_age17 = (e_age_17 / e_totpop) * 100,
        mp_age17 = (
            sqrt(m_age_17^2 - ((ep_age17 / 100)^2 * m_totpop^2)) /
            e_totpop
        ) * 100,
        ep_disabl = DP02_0072PE,
        mp_disabl = DP02_0072PM,
        ep_sngpnt = (e_sngpnt / e_hh) * 100,
        mp_sngpnt = (
            sqrt(m_sngpnt^2 - ((ep_sngpnt / 100)^2 * m_hh^2)) /
            e_hh
        ) * 100,
        ep_limeng = (e_limeng / B16005_001E) * 100,
        mp_limeng = (
            sqrt(m_limeng^2 - ((ep_limeng / 100)^2 * B16005_001M^2)) /
            B16005_001E
        ) * 100,
        ep_minrty = (e_minrty / e_totpop) * 100,
        mp_minrty = (
            sqrt(m_minrty^2 - ((ep_minrty / 100)^2 * m_totpop^2)) /
            e_totpop
        ) * 100,
        ep_munit = (e_munit / e_hu) * 100,
        mp_munit = (
            sqrt(m_munit^2 - ((ep_munit / 100)^2 * m_hu^2)) /
            e_hu
        ) * 100,
        ep_mobile = DP04_0014PE,
        mp_mobile = DP04_0014PM,
        ep_crowd = (e_crowd / DP04_0002E) * 100,
        mp_crowd = (
            sqrt(m_crowd^2 - ((ep_crowd / 100)^2 * DP04_0002M^2)) /
            DP04_0002E
        ) * 100,
        ep_noveh = DP04_0058PE,
        mp_noveh = DP04_0058PM,
        ep_groupq = (e_groupq / e_totpop) * 100,
        mp_groupq = (
            sqrt(m_groupq^2 - ((ep_groupq / 100)^2 * m_totpop^2)) /
            e_totpop
        ) * 100
      )

    if (include_adjunct_vars == TRUE) {
        svi_data <- svi_data %>%
            dplyr::mutate(
                e_noint = (S2802_C01_001E - S2802_C02_001E),
                m_noint = sqrt(S2802_C01_001M^2 - S2802_C02_001M^2),
                e_afam = DP05_0078E,
                m_afam = DP05_0078M,
                e_hisp = DP05_0071E,
                m_hisp = DP05_0071M,
                e_asian = DP05_0080E,
                m_asian = DP05_0080M,
                e_aian = DP05_0079E,
                m_aian = DP05_0079M,
                e_nhpi = DP05_0081E,
                m_nhpi = DP05_0081M,
                e_twomore = DP05_0083E,
                m_twomore = DP05_0083M,
                e_otherrace = DP05_0082E,
                m_otherrace = DP05_0082M,
                ep_noint = (e_noint / S2802_C01_001E) * 100,
                mp_noint = (
                    sqrt(m_noint^2 - ((ep_noint / 100)^2 * S2802_C01_001M^2)) /
                    S2802_C01_001E
                ) * 100,
                ep_afam = DP05_0078PE,
                mp_afam = DP05_0078PM,
                ep_hisp = DP05_0071PE,
                mp_hisp = DP05_0071PM,
                ep_asian = DP05_0080PE,
                mp_asian = DP05_0080PM,
                ep_aian = DP05_0079PE,
                mp_aian = DP05_0079PM,
                ep_nhpi = DP05_0081PE,
                mp_nhpi = DP05_0081PM,
                ep_twomore = DP05_0083PE,
                mp_twomore = DP05_0083PM,
                ep_otherrace = DP05_0082PE,
                mp_otherrace = DP05_0082PM
            )
    # nolint end
    }
}

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
get_svi_from_cdc <- function(geography, year, state = NULL, geometry) {
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
    download.file(url, temp)

    if (geometry == FALSE) {
        svi_data <- readr::read_csv(temp)
    } else {
        temp2 <- tempfile()
        unzip(temp, exdir = temp2)
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
        warning(msg)
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
    download.file(url, temp)
    svi_data <- readr::read_csv(temp)

    return(svi_data)
}
