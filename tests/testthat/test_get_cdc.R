test_that(
  "Properly rejects invalid input",
  {
    expect_error(
      get_svi_from_cdc("state", 2020, state = 33, geometry = FALSE),
      "Geography state is not a valid input."
    )
    expect_error(
      get_svi_from_cdc("county", 2019, state = 33, geometry = FALSE),
      "SVI not available for year 2019"
    )
    expect_error(
      get_svi_from_cdc("county", 2020, state = 33, geometry = "not logical"),
      "Expected logical value for geometry."
    )
    expect_error(
      get_svi_from_cdc("county", 2010, state = 33, geometry = FALSE),
      "County data not available for 2000 or 2010 data."
    )
    expect_error(
      get_svi_from_cdc("tract", 2010, state = 33, geometry = TRUE),
      "Shapefiles not available for 2000 or 2010 data."
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
