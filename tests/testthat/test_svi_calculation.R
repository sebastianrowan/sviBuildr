test_that(
    "Properly downloads and calculates single state 2020 SVI",
    {
        x <- calculate_svi("county", year = 2020, state = "nh")
        expect_s3_class(x, "data.frame")
    }
)

test_that(
    "Properly downloads and calculates multi-state 2020 SVI",
    {
        x <- calculate_svi("county", year = 2020, state = c(33, "Vermont", "Me"))
        expect_s3_class(x, "data.frame")
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
  "Refuses to calculate SVI for year != 2020",
  {
    expect_error(
      calculate_svi("county", year = 2018, state = "nh"),
      "SVI calculation currently only available for year 2020."
    )
  }
)

test_that(
  "Refuses to calculate SVI using non 2020 method",
  {
    expect_error(
      calculate_svi("county", year = 2020, use_2020_method = FALSE, state = "nh"),
      "SVI calculation currently only available for year 2020."
    )
  }
)

