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

test_that(
  "Name can return state name",
  {
    expect_equal(validate_state("New Hampshire", "name_fmt"), "NewHampshire")
  }
)

test_that(
  "Rejects null state",
  {
    expect_error(
      validate_state(identifier = "name_fmt"),
      "No state specified"
    )
  }
)

test_that(
  "Rejects bad state input",
  {
    expect_error(
      validate_state(TRUE, "name_fmt"),
      "not a valid FIPS code or state name/abbreviation"
    )
  }
)

test_that(
  "Rejects bad identifier",
  {
    expect_error(
      validate_state(33, "namefmt"),
      "not a valid identifier"
    )
  }
)
