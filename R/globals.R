utils::globalVariables(
    c(
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
        "DP04_0058P", "S2802_C01_001", "S2802_C02_001", "DP05_0078",
        "DP05_0071", "DP05_0080", "DP05_0079", "DP05_0081", "DP05_0083",
        "DP05_0082", "DP05_0078P", "DP05_0071P", "DP05_0080P", "DP05_0079P",
        "DP05_0081P", "DP05_0083P", "DP05_0082P", "epl_pov150", "epl_unemp",
        "epl_hburd", "epl_nohsdp", "epl_uninsur",
        "epl_age65", "epl_age17", "epl_disabl", "epl_sngpnt", "epl_limeng",
        "epl_minrty", "epl_munit", "epl_mobile", "epl_crowd", "epl_noveh",
        "epl_groupq", "f_pov150", "f_unemp", "f_hburd", "f_nohsdp", "f_uninsur",
        "f_age65", "f_age17", "f_disabl", "f_sngpnt", "f_limeng",
        "f_minrty", "f_munit", "f_mobile", "f_crowd", "f_noveh",
        "f_groupq", "ep_pov150", "ep_unemp", "ep_hburd", "ep_nohsdp",
        "ep_uninsur", "epl_pov150", "epl_unemp", "epl_hburd", "epl_nohsdp",
        "epl_uninsur", "spl_theme1", "ep_age65", "ep_age17", "ep_disabl",
        "ep_sngpnt", "ep_limeng", "epl_age65", "epl_age17", "epl_disabl",
        "epl_sngpnt", "epl_limeng", "spl_theme2", "ep_minrty", "epl_minrty",
        "spl_theme3", "ep_munit", "ep_mobile", "ep_crowd", "ep_noveh",
        "ep_groupq", "epl_munit", "epl_mobile", "epl_crowd", "epl_noveh",
        "epl_groupq", "spl_theme4", "spl_themes", "e_totpop", "m_totpop",
        "e_hu", "m_hu", "e_hh", "m_hh", "e_pov150", "m_pov150", "e_unemp",
        "m_unemp", "e_hburd", "m_hburd", "e_nohsdp", "m_nohsdp", "e_uninsur",
        "m_uninsur", "e_age_65", "m_age_65", "e_age_17", "m_age_17",
        "e_disabl", "m_disabl", "e_sngpnt", "m_sngpnt", "e_limeng", "m_limeng",
        "e_minrty", "m_minrty", "e_munit", "m_munit", "e_mobile", "m_mobile",
        "e_crowd", "m_crowd", "e_noveh", "m_noveh", "e_groupq", "m_groupq",
        "ep_nohsdp", "f_theme1", "f_theme2", "f_theme3", "f_theme4",
        "f_pov150", "f_unemp", "f_hburd", "f_nohsdp", "f_uninsur",
        "f_age65", "f_age17", "f_disabl", "f_sngpnt", "f_limeng",
        "f_minrty", "f_munit", "f_mobile", "f_crowd", "f_noveh",
        "f_groupq"
    )
)

# source https://github.com/walkerke/tidycensus/blob/master/R/zzz.r
# this is required for the validate_state function

fips_state_table <- data.frame(
  abb = c(
    "ak", "al", "ar", "as", "az", "ca", "co",
    "ct", "dc", "de", "fl", "ga", "gu", "hi", "ia", "id", "il", "in",
    "ks", "ky", "la", "ma", "md", "me", "mi", "mn", "mo", "ms", "mt",
    "nc", "nd", "ne", "nh", "nj", "nm", "nv", "ny", "oh", "ok", "or",
    "pa", "pr", "ri", "sc", "sd", "tn", "tx", "ut", "va", "vi", "vt",
    "wa", "wi", "wv", "wy", "mp"
  ),
  fips = c(
    "02", "01", "05", "60", "04",
    "06", "08", "09", "11", "10", "12", "13", "66", "15", "19", "16",
    "17", "18", "20", "21", "22", "25", "24", "23", "26", "27", "29",
    "28", "30", "37", "38", "31", "33", "34", "35", "32", "36", "39",
    "40", "41", "42", "72", "44", "45", "46", "47", "48", "49", "51",
    "78", "50", "53", "55", "54", "56", "69"
  ),
  name = c(
    "alaska", "alabama", "arkansas", "american samoa", "arizona",
    "california", "colorado", "connecticut", "district of columbia",
    "delaware", "florida", "georgia", "guam", "hawaii", "iowa", "idaho",
    "illinois", "indiana", "kansas", "kentucky", "louisiana",
    "massachusetts", "maryland", "maine", "michigan", "minnesota",
    "missouri", "mississippi", "montana", "north carolina",
    "north dakota", "nebraska", "new hampshire", "new jersey",
    "new mexico", "nevada", "new york", "ohio", "oklahoma", "oregon",
    "pennsylvania", "puerto rico", "rhode island", "south carolina",
    "south dakota", "tennessee", "texas", "utah", "virginia",
    "virgin islands", "vermont", "washington", "wisconsin",
    "west virginia", "wyoming", "northern mariana islands"
  ),
  name_fmt = c(
    "Alaska", "Alabama", "Arkansas", "AmericanSamoa", "Arizona",
    "California", "Colorado", "Connecticut", "DistrictOfColumbia",
    "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho",
    "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana",
    "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota",
    "Missouri", "Mississippi", "Montana", "NorthCarolina",
    "NorthDakota", "Nebraska", "NewHampshire", "NewJersey",
    "NewMexico", "Nevada", "NewYork", "Ohio", "Oklahoma", "Oregon",
    "Pennsylvania", "PuertoRico", "RhodeIsland", "SouthCarolina",
    "SouthDakota", "Tennessee", "Texas", "Utah", "Virginia",
    "VirginIslands", "Vermont", "Washington", "Wisconsin",
    "WestVirginia", "Wyoming", "NorthernMarianaIslands"
  )
)


svi_vars <- list()
svi_vars$vars2020 <- list()
svi_vars$vars2018 <- list()
svi_vars$vars2016 <- list()
svi_vars$vars2014 <- list()

# access these as
# y = as.character(year)
# svi_vars[[paste0("vars", y)]]$vars
# svi_vars[[paste0("vars", y)]]$adj_vars

svi_vars$vars2020$vars <- c(
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

svi_vars$vars2020$adj_vars <- c(
  "S2802_C01_001", "S2802_C02_001", "DP05_0078", "DP05_0071",
  "DP05_0080", "DP05_0079", "DP05_0081", "DP05_0083", "DP05_0082",
  "DP05_0078P", "DP05_0071P", "DP05_0080P", "DP05_0079P", "DP05_0081P",
  "DP05_0083P", "DP05_0082P"
)

svi_vars$vars2018$vars <- c(
  "S0601_C01_001", "DP04_0001", "DP02_0001", "B17001_002",
  "DP03_0005", "B19301_001", "B06009_002", "S0101_C01_030",
  "B09001_001", "DP02_0071", "DP02_0007", "DP02_0009", "B01001H_001",
  "B16005_008", "B16005_012", "B16005_013", "B16005_017", "B16005_018",
  "B16005_022", "B16005_023", "B16005_029", "B16005_030", "B16005_034",
  "B16005_035", "B16005_039", "B16005_040", "B16005_044", "B16005_045",
  "B16005_007", "DP04_0012", "DP04_0013", "DP04_0014", "DP04_0078",
  "DP04_0079", "DP04_0058", "B26001_001", "S0601_C01_049", "DP03_0009P",
  "B19301_001", "S0601_C01_033", "S0101_C02_030", "DP02_0071P", "B16005_001",
  "DP04_0014P", "DP04_0002", "DP04_0058P"
)

svi_vars$vars2018$adj_vars <- c(
  "S207_C04_001", "S207_C05_001"
)
