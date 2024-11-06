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
        "m_uninsur", "e_age_65", "m_age65", "e_age17", "m_age17",
        "e_disabl", "m_disabl", "e_sngpnt", "m_sngpnt", "e_limeng", "m_limeng",
        "e_minrty", "m_minrty", "e_munit", "m_munit", "e_mobile", "m_mobile",
        "e_crowd", "m_crowd", "e_noveh", "m_noveh", "e_groupq", "m_groupq",
        "ep_nohsdp", "f_theme1", "f_theme2", "f_theme3", "f_theme4",
        "f_pov150", "f_unemp", "f_hburd", "f_nohsdp", "f_uninsur",
        "f_age65", "f_age17", "f_disabl", "f_sngpnt", "f_limeng",
        "f_minrty", "f_munit", "f_mobile", "f_crowd", "f_noveh",
        "f_groupq", "abb", "e_noint", "ep_noint", "ep_pci", 'ep_pov',
        'epl_pov', "f_pci", "f_pov", "fips", "m_age17", "m_noint", "name",
        "B01001H_001E", "B01001H_001M", "B06009_002E", "B06009_002M", "B09001_001E",
        "B09001_001M", "B11012_010E", "B11012_010M", "B11012_015E", "B11012_015M",
        "B16005_001E", "B16005_001M", "B16005_007E", "B16005_007M", "B16005_008E",
        "B16005_008M", "B16005_012E", "B16005_012M", "B16005_013E", "B16005_013M",
        "B16005_017E", "B16005_017M", "B16005_018E", "B16005_018M", "B16005_022E",
        "B16005_022M", "B16005_023E", "B16005_023M", "B16005_029E", "B16005_029M",
        "B16005_030E", "B16005_030M", "B16005_034E", "B16005_034M", "B16005_035E",
        "B16005_035M", "B16005_039E", "B16005_039M", "B16005_040E", "B16005_040M",
        "B16005_044E", "B16005_044M", "B16005_045E", "B16005_045M", "B17001_002E",
        "B17001_002M", "B19301_001E", "B19301_001M", "B26001_001E", "B26001_001M",
        "DP02_0001E", "DP02_0001M", "DP02_0007E", "DP02_0007M", "DP02_0009E", "DP02_0009M",
        "DP02_0071E", "DP02_0071M", "DP02_0071PE", "DP02_0071PM", "DP02_0072E", "DP02_0072M",
        "DP02_0072PE", "DP02_0072PM", "DP03_0005E", "DP03_0005M", "DP03_0009PE", "DP03_0009PM",
        "DP04_0001E", "DP04_0001M", "DP04_0002E", "DP04_0002M", "DP04_0012E", "DP04_0012M",
        "DP04_0013E", "DP04_0013M", "DP04_0014E", "DP04_0014M", "DP04_0014PE", "DP04_0014PM",
        "DP04_0058E", "DP04_0058M", "DP04_0058PE", "DP04_0058PM", "DP04_0078E", "DP04_0078M",
        "DP04_0079E", "DP04_0079M", "DP05_0071E", "DP05_0071M", "DP05_0071PE", "DP05_0071PM",
        "DP05_0078E", "DP05_0078M", "DP05_0078PE", "DP05_0078PM", "DP05_0079E", "DP05_0079M",
        "DP05_0079PE", "DP05_0079PM", "DP05_0080E", "DP05_0080M", "DP05_0080PE", "DP05_0080PM",
        "DP05_0081E", "DP05_0081M", "DP05_0081PE", "DP05_0081PM", "DP05_0082E", "DP05_0082M",
        "DP05_0082PE", "DP05_0082PM", "DP05_0083E", "DP05_0083M", "DP05_0083PE", "DP05_0083PM",
        "GEOID", "S0101_C01_028E", "S0101_C01_028M", "S0101_C01_030E", "S0101_C01_030M",
        "S0101_C02_030E", "S0101_C02_030M", "S0601_C01_001E", "S0601_C01_001M",
        "S0601_C01_033E", "S0601_C01_033M", "S0601_C01_049E", "S0601_C01_049M",
        "S1501_C01_025E", "S1501_C01_025M", "S1701_C01_001E", "S1701_C01_001M",
        "S1701_C01_040E", "S1701_C01_040M", "S2503_C01_001E", "S2503_C01_001M",
        "S2503_C01_028E", "S2503_C01_028M", "S2503_C01_032E", "S2503_C01_032M",
        "S2503_C01_036E", "S2503_C01_036M", "S2503_C01_040E", "S2503_C01_040M",
        "S2701_C04_001E", "S2701_C04_001M", "S2701_C05_001E", "S2701_C05_001M",
        "S2802_C01_001E", "S2802_C01_001M", "S2802_C02_001E", "S2802_C02_001M"
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
svi_vars$vars2022 <- list()
svi_vars$vars2020 <- list()
svi_vars$vars2018 <- list()
svi_vars$vars2016 <- list()
svi_vars$vars2014 <- list()

# access these as
# y = as.character(year)
# svi_vars[[paste0("vars", y)]]$vars
# svi_vars[[paste0("vars", y)]]$adj_vars

svi_vars$vars2022$vars <- c(
  "S0601_C01_001", "DP04_0001", "DP02_0001", "S1701_C01_040",
  "DP03_0005", "S2503_C01_028", "S2503_C01_032", "S2503_C01_036",
  "S2503_C01_040", "B06009_002", "S2701_C04_001", "S0101_C01_030",
  "DP05_0019", "DP02_0072", "DP02_0007", "DP02_0011", "B16005_007",
  "B16005_008", "B16005_012", "B16005_013", "B16005_017", "B16005_018",
  "B16005_022", "B16005_023", "B16005_029", "B16005_030", "B16005_034",
  "B16005_035", "B16005_039", "B16005_040", "B16005_044", "B16005_045",
  "DP05_0001", "DP05_0079", "DP04_0012", "DP04_0013", "DP04_0014",
  "DP04_0078", "DP04_0079", "DP04_0058", "B26001_001", "S1701_C01_001",
  "DP03_0009P", "S2503_C01_001", "S0601_C01_033", "S2701_C05_001",
  "S0101_C02_030", "DP05_0019P", "DP02_0007P", "DP02_0011P", "DP02_0072P",
  "B16005_001", "DP05_0079P", "DP04_0012P", "DP04_0013P", "DP04_0014P",
  "DP04_0078P", "DP04_0079P", "DP04_0002", "DP04_0058P"
)

svi_vars$vars2022$adj_vars <- c(
  "S2801_C01_019", "DP05_0080", "DP05_0073", "DP05_0082", "DP05_0081",
  "DP05_0083", "DP05_0085", "DP05_0084", "S2801_C02_019", "DP05_0080P",
  "DP05_0073P", "DP05_0082P", "DP05_0081P", "DP05_0083P", "DP05_0085P",
  "DP05_0084P"
)

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
  "S0601_C01_033", "S0101_C02_030", "DP02_0071P", "B16005_001",
  "DP04_0014P", "DP04_0002", "DP04_0058P"
)

svi_vars$vars2018$adj_vars <- c(
  "S2701_C04_001", "S2701_C05_001"
)

svi_vars$vars2016$vars <- c(
  "S0601_C01_001", "S1501_C01_025", "S0101_C01_028", "S0601_C01_049",
  "S0601_C01_033", "B17001_002", "B19301_001", "B06009_002", "B09001_001",
  "B16005_001", "B16005_007", "B16005_008", "B16005_012", "B16005_013",
  "B16005_017", "B16005_018", "B16005_022", "B16005_023", "B16005_029",
  "B16005_030", "B16005_034", "B16005_035", "B16005_039", "B16005_040",
  "B16005_044", "B16005_045", "B26001_001", "DP02_0001", "DP02_0071",
  "DP02_0007", "DP02_0009", "DP02_0071P", "DP03_0005", "DP03_0009P",
  "DP04_0001", "DP04_0012", "DP04_0013", "DP04_0014", "DP04_0078",
  "DP04_0079", "DP04_0058", "DP04_0014P", "DP04_0002", "DP04_0058P",
  "B01001H_001"
)

svi_vars$vars2016$adj_vars <- c(
  "S2701_C04_001", "S2701_C05_001"
)
