test_that(
  "Properly handles invalid input",
  {
    expect_error(
      get_svi_from_cdc("block", 2020, state = 33, geometry = FALSE),
      "Geography not valid."
    )
    expect_error(
      get_svi_from_cdc(c("tract", "county"), 2020, state = 33, geometry = FALSE),
      "Geography not valid."
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = 33, geometry = "not logical"),
      "Expected logical value for geometry."
    )
    expect_error(
      get_svi_from_cdc("county", 2019, state = 33, geometry = FALSE),
      "SVI not available for year"
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = c(33, 34), geometry = FALSE),
      "get_cdc() only accepts one state or 'US' per request"
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = 100, geometry = FALSE),
      "'100' is not a valid FIPS code or state name/abbreviation"
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = "nw", geometry = FALSE),
      "'nw' is not a valid FIPS code or state name/abbreviation"
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = "new ahmpshire", geometry = FALSE),
      "'new ahmpshire' is not a valid FIPS code or state name/abbreviation"
    )
  }
)

test_that(
  "Properly messages and downloads on imperfect input.",
  {
    expect_message(
      get_svi_from_cdc("county", year = 2020, geometry = FALSE),
      "No state specified. Requesting US data."
    )
    expect_s3_class(
      get_svi_from_cdc("county", 2020, geometry = FALSE),
      "data.frame"
    )
  }
)

test_that(
  "Properly downloads state data with no geometry (2014 - 2022).",
  {
    expect_s3_class(
      get_svi_from_cdc("county", year = 2022, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2020, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2018, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2016, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2014, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2010, state = 33, geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2000, state = 33, geometry = FALSE),
      "data.frame"
    )
  }
)

test_that(
  "Properly downloads US data with no geometry (2014 - 2022).",
  {
    expect_s3_class(
      get_svi_from_cdc("county", year = 2022, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2020, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2018, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2016, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2014, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2010, state = 'US', geometry = FALSE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2000, state = 'US', geometry = FALSE),
      "data.frame"
    )
  }
)

test_that(
  "Properly downloads state data with geometry.",
  {
    expect_s3_class(
      get_svi_from_cdc("county", year = 2022, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2020, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2018, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2016, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2014, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2010, state = 33, geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2000, state = 33, geometry = TRUE),
      "data.frame"
    )
  }
)

test_that(
  "Properly downloads US data with geometry",
  {
    expect_s3_class(
      get_svi_from_cdc("county", year = 2022, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2020, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2018, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2016, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2014, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2010, state = 'US', geometry = TRUE),
      "data.frame"
    )
    expect_s3_class(
      get_svi_from_cdc("county", year = 2000, state = 'US', geometry = TRUE),
      "data.frame"
    )
  }
)
