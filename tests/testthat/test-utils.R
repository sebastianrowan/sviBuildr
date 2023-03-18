test_that("FIPS code can return state name", {
  expect_equal(validate_state(33, "name_fmt"), "NewHampshire")
})
