# Testing sviBuildr

library(ggplot2)
library(cowplot)
devtools::load_all()

geogs <- c("tract", "county")
sts <- c("01", "02", "04", "05", "06", "08", "09", "10", "11", "12", "13", "15",
         "16", "17", "18", "19", "20", "21", "23", "24", "25", "26", "27", "28",
         "29", "31", "34", "35", "36", "37", "38", "39", "40", "41", "42", "44",
         "45", "46", "47", "48", "49", "50", "51", "53", "54", "55", "56"
         )
sts <- c(sts, "22", "30", "32")

sts <- c("06", "12", "36", "33")
year = 2018

for (st in sts) {
  for (geog in geogs) {
    compare_svi(st, geog, year)
  }
}

compare_svi('22', 'county')


compare_svi <- function(st, geog, year) {

  st_name = stringr::str_to_title(validate_state(st, 'name'))
  geog_lab = paste0(stringr::str_to_title(stringr::str_replace(geog, "y", "ie")), "s")
  xlims <- c(-.01, .01)

  cdc <- get_svi_from_cdc(geog, year, state = st, geometry = TRUE) %>%
    sf::st_drop_geometry() %>%
    mutate(FIPS = as.character(FIPS))

  build <- calculate_svi(geog, year = year, state = st, geometry = FALSE, include_adjunct_vars = F) %>%
    mutate(GEOID = as.character(GEOID))

  compare <- cdc %>%
    left_join(
      build,
      by = c("FIPS" = "GEOID"),
      suffix = c(".cdc", ".build")
    ) %>%
    mutate(
      RANK1 = rank(RPL_THEME1),
      rank1 = rank(rpl_theme1),
      RANK2 = rank(RPL_THEME2),
      rank2 = rank(rpl_theme2),
      RANK3 = rank(RPL_THEME3),
      rank3 = rank(rpl_theme3),
      RANK4 = rank(RPL_THEME4),
      rank4 = rank(rpl_theme4),
      RANKS = rank(RPL_THEMES),
      ranks = rank(rpl_themes),
      dif1 = RANK1 == rank1,
      dif2 = RANK2 == rank2,
      dif3 = RANK3 == rank3,
      dif4 = RANK4 == rank4,
      difs = RANKS == ranks
    ) %>%
    select(
      FIPS,
      RPL_THEME1, rpl_theme1, dif1, RANK1, rank1,
      RPL_THEME2, rpl_theme2, dif2, RANK2, rank2,
      RPL_THEME3, rpl_theme3, dif3, RANK3, rank3,
      RPL_THEME4, rpl_theme4, dif4, RANK4, rank4,
      RPL_THEMES, rpl_themes, difs, RANKS, ranks
    )

  check <- compare %>%
    select(FIPS, dif1, dif2, dif3, dif4, difs) %>%
    tidyr::pivot_longer(
      cols = !FIPS,
      names_to = "dif",
      values_to = "value"
    ) %>%
    group_by(dif, value) %>%
    summarize(
      n = n()
    )

  p1 <- ggplot(compare %>% filter(RPL_THEME1 >= 0)) +
    geom_histogram(aes(x = rpl_theme1 - RPL_THEME1)) +
    labs(
      x = "SVIBuildr - CDC Theme 1",
      y = geog_lab
    ) +
    xlim(xlims) +
    theme_cowplot()

  p2 <- ggplot(compare %>% filter(RPL_THEME2 >= 0)) +
    geom_histogram(aes(x = rpl_theme2 - RPL_THEME2)) +
    labs(
      x = "SVIBuildr - CDC Theme 2",
      y = geog_lab
    ) +
    xlim(xlims) +
    theme_cowplot()

  p3 <- ggplot(compare %>% filter(RPL_THEME3 >= 0)) +
    geom_histogram(aes(x = rpl_theme3 - RPL_THEME3)) +
    labs(
      x = "SVIBuildr - CDC Theme 3",
      y = geog_lab
    ) +
    xlim(xlims) +
    theme_cowplot()

  p4 <- ggplot(compare %>% filter(RPL_THEME4 >= 0)) +
    geom_histogram(aes(x = rpl_theme4 - RPL_THEME4)) +
    labs(
      x = "SVIBuildr - CDC Theme 4",
      y = geog_lab
    ) +
    xlim(xlims) +
    theme_cowplot()

  ps <- ggplot(compare %>% filter(RPL_THEMES >= 0)) +
    geom_histogram(aes(x = rpl_themes - RPL_THEMES)) +
    labs(
      title = "SVI Theme Differences Between SVIBuildr and CDC",
      subtitle = paste0(st_name, " ", geog_lab, " - ", year),
      x = "SVIBuildr - CDC All Themes",
      y = geog_lab
    ) +
    xlim(xlims) +
    theme_cowplot()

  theme_plots <- plot_grid(p1, p2, p3, p4, nrow = 2)

  plot_out <- plot_grid(ps, theme_plots, ncol = 1)

  plot_path <- paste0("man/img/", year, "/cdc_compare_hist_", st, "_", geog, ".png")

  save_plot(plot_path, plot_out, base_height = 6)
}
