test_that(
  "Refuses to calculate SVI for unimplemented year.",
  {
    expect_error(
      calculate_svi("county", year = 2017, state = "nh"),
      "SVI calculation currently only available for"
    )
  }
)

test_that(
  "Refuses to request invalid geography",
  {
    expect_error(
      calculate_svi("block", year = 2020, state = "nh"),
      "Geography not valid."
    )
    expect_error(
      calculate_svi(c("tract", "county"), year = 2020, state = "nh"),
      "Geography not valid."
    )
  }
)

test_that(
  "Refuses to download and calculate SVI when state is NULL",
  {
    expect_error(
      calculate_svi("county", year = 2020),
      "No state specified"
    )
  }
)

test_that(
  "Refuses to download and calculate US SVI",
  {
    expect_error(
      calculate_svi("county", year = 2020, state = "us"),
      "Calculating US svi not currently supported"
    )
  }
)

test_that(
  "Rejects when geometry is not a logical",
  {
    expect_error(
      calculate_svi("county", year = 2020, state = "nh", geometry = "TRUE"),
      "Expected logical value for geometry."
    )
    expect_error(
      calculate_svi("county", year = 2020, state = "nh", geometry = 1),
      "Expected logical value for geometry."
    )
    expect_error(
      calculate_svi("county", year = 2020, state = "nh", geometry = NULL),
      "Expected logical value for geometry."
    )
  }
)

test_that(
  "Rejects invalid moe_level",
  {
    expect_error(
      calculate_svi("county", year = 2020, state = "nh", moe = 96),
      "Invalid moe_level."
    )
    expect_error(
      calculate_svi("county", year = 2020, state = "nh", moe = c(90, 95)),
      "Invalid moe_level."
    )
  }
)

test_that(
  "Properly downloads and calculates single state SVI",
  {
    #expect_s3_class(calculate_svi("county", year = 2000, state = "nh"), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2010, state = "nh"), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2014, state = "nh"), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2016, state = "nh"), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2018, state = "nh"), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2020, state = "nh"), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2022, state = "nh"), "data.frame")
  }
)

test_that(
  "Properly downloads and calculates multi-state 2016, 2018, 2020 or 2022 SVI",
  {
    #expect_s3_class(calculate_svi("county", year = 2000, state = c(33, "Vermont", "Me")), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2010, state = c(33, "Vermont", "Me")), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2014, state = c(33, "Vermont", "Me")), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2016, state = c(33, "Vermont", "Me")), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2018, state = c(33, "Vermont", "Me")), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2020, state = c(33, "Vermont", "Me")), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2022, state = c(33, "Vermont", "Me")), "data.frame")
  }
)

test_that(
  "Properly downloads and calculates 2016, 2018, 2020 or 2022 SVI with adjunct vars",
  {
    #expect_s3_class(calculate_svi("county", year = 2000, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2010, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    #expect_s3_class(calculate_svi("county", year = 2014, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2016, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2018, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2020, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
    expect_s3_class(calculate_svi("county", year = 2022, state = "Vermont", include_adjunct_vars = TRUE), "data.frame")
}
)
