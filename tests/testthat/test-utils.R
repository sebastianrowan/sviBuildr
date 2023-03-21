test_that(
  "FIPS code can return state name",
  {
    expect_equal(validate_state(33, "name_fmt"), "NewHampshire")
  }
)


test_that(
  "Abbreviation can return state name",
  {
    expect_equal(validate_state("nh", "name_fmt"), "NewHampshire")
  }
)
