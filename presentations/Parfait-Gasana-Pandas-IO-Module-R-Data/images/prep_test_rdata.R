options(width=200)


setwd("/home/parfaitg/Documents/ChiPy/scratch/rdata_io_enh")


### EPA GREENHOUSE GASES
ghg_wide_df <- read.csv("/home/parfaitg/Downloads/data.csv", check.names=FALSE, stringsAsFactors=FALSE)

ghg_long_df <- transform(
                   reshape(ghg_wide_df, varying = names(ghg_wide_df)[-1], 
                           times = names(ghg_wide_df)[-1], ids=NULL,
                           v.names = "emissions", timevar="year",
                           new.row.names=1:1E5, direction="long"),
                   year = as.integer(year),
                   units = as.character("millions metric tons of CO2 equivalents"),
                   source = as.charater("US EPA Inventory of U.S. Greenhouse Gas Emissions and Sinks")
               )

attr(ghg_long_df, "reshapeLong") <- NULL


str(ghg_long_df)

head(ghg_long_df, 5)

tail(ghg_long_df, 5)

saveRDS(ghg_long_df, "ghg_df.rds")


### NOAA SEA ICE
north_ftp <- "ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/monthly/data/"
south_ftp <- "ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/monthly/data/"

prefs <- c(paste0("N_0", 1:9), paste0("N_", 10:12), paste0("S_0", 1:9), paste0("S_", 10:12))

sea_ice_dfs <- sapply(prefs, function(f) {
  if(grepl("N", f)) { df <- read.csv(paste0(north_ftp, f, "_extent_v3.0.csv")) }
  if(grepl("S", f)) { df <- read.csv(paste0(south_ftp, f, "_extent_v3.0.csv")) }
  
  return(df)
}, simplify=FALSE)

sea_ice_df <- do.call(rbind.data.frame, unname(sea_ice_dfs))

str(sea_ice_df)

head(sea_ice_df, 5)
tail(sea_ice_df, 5)


saveRDS(sea_ice_df, "sea_ice_df.rds")


### BGCI Plants Assessment

txt <- 'plant_group|status|count
Angiosperms|Data Deficient|4472
Angiosperms|Extinct|1195
Angiosperms|Not Threatened|30737
Angiosperms|Possibly Threatened|12783
Angiosperms|Threatened|30522
Bryophytes|Data Deficient|711
Bryophytes|Extinct|198
Bryophytes|Not Threatened|2494
Bryophytes|Possibly Threatened|1205
Bryophytes|Threatened|2254
Gymnosperms|Data Deficient|18
Gymnosperms|Extinct|3
Gymnosperms|Not Threatened|211
Gymnosperms|Possibly Threatened|162
Gymnosperms|Threatened|413
Pteridophytes|Data Deficient|398
Pteridophytes|Extinct|65
Pteridophytes|Not Threatened|1294
Pteridophytes|Possibly Threatened|408
Pteridophytes|Threatened|1275'

plants_df <- read.table(text=txt, sep="|", header=TRUE, stringsAsFactors=FALSE)

str(df)
df

saveRDS(plants_df, "plants_df.rds")


txt <- 'plant_group|year|status|count
Angiosperms|2011|Data Deficient|199
Angiosperms|2011|Extinct|19
Angiosperms|2011|Not Threatened|2320
Angiosperms|2011|Possibly Threatened|139
Angiosperms|2011|Threatened|1472
Angiosperms|2012|Data Deficient|365
Angiosperms|2012|Extinct|65
Angiosperms|2012|Not Threatened|3333
Angiosperms|2012|Possibly Threatened|741
Angiosperms|2012|Threatened|2739
Angiosperms|2013|Data Deficient|528
Angiosperms|2013|Extinct|16
Angiosperms|2013|Not Threatened|5729
Angiosperms|2013|Possibly Threatened|768
Angiosperms|2013|Threatened|1914
Angiosperms|2014|Data Deficient|157
Angiosperms|2014|Extinct|39
Angiosperms|2014|Not Threatened|1008
Angiosperms|2014|Possibly Threatened|156
Angiosperms|2014|Threatened|804
Angiosperms|2015|Data Deficient|41
Angiosperms|2015|Extinct|28
Angiosperms|2015|Not Threatened|342
Angiosperms|2015|Possibly Threatened|674
Angiosperms|2015|Threatened|860
Angiosperms|2016|Data Deficient|90
Angiosperms|2016|Extinct|54
Angiosperms|2016|Not Threatened|1111
Angiosperms|2016|Possibly Threatened|145
Angiosperms|2016|Threatened|1389
Angiosperms|2017|Data Deficient|233
Angiosperms|2017|Extinct|18
Angiosperms|2017|Not Threatened|1800
Angiosperms|2017|Possibly Threatened|454
Angiosperms|2017|Threatened|2655
Angiosperms|2018|Data Deficient|132
Angiosperms|2018|Extinct|10
Angiosperms|2018|Not Threatened|2979
Angiosperms|2018|Possibly Threatened|445
Angiosperms|2018|Threatened|1368
Angiosperms|2019|Data Deficient|193
Angiosperms|2019|Extinct|205
Angiosperms|2019|Not Threatened|986
Angiosperms|2019|Possibly Threatened|143
Angiosperms|2019|Threatened|756
Angiosperms|2020|Data Deficient|49
Angiosperms|2020|Not Threatened|69
Angiosperms|2020|Possibly Threatened|7
Angiosperms|2020|Threatened|57
Bryophytes|2011|Not Threatened|1
Bryophytes|2011|Possibly Threatened|1
Bryophytes|2011|Threatened|35
Bryophytes|2012|Data Deficient|100
Bryophytes|2012|Extinct|31
Bryophytes|2012|Not Threatened|263
Bryophytes|2012|Possibly Threatened|130
Bryophytes|2012|Threatened|482
Bryophytes|2013|Data Deficient|233
Bryophytes|2013|Extinct|24
Bryophytes|2013|Not Threatened|817
Bryophytes|2013|Possibly Threatened|77
Bryophytes|2013|Threatened|148
Bryophytes|2014|Data Deficient|40
Bryophytes|2014|Extinct|3
Bryophytes|2014|Not Threatened|33
Bryophytes|2014|Possibly Threatened|1
Bryophytes|2014|Threatened|27
Bryophytes|2015|Data Deficient|4
Bryophytes|2015|Not Threatened|115
Bryophytes|2015|Possibly Threatened|2
Bryophytes|2015|Threatened|6
Bryophytes|2016|Data Deficient|8
Bryophytes|2016|Extinct|2
Bryophytes|2016|Not Threatened|92
Bryophytes|2016|Possibly Threatened|21
Bryophytes|2016|Threatened|79
Bryophytes|2017|Data Deficient|13
Bryophytes|2017|Extinct|2
Bryophytes|2017|Not Threatened|244
Bryophytes|2017|Possibly Threatened|29
Bryophytes|2017|Threatened|80
Bryophytes|2018|Data Deficient|7
Bryophytes|2018|Not Threatened|56
Bryophytes|2018|Possibly Threatened|8
Bryophytes|2018|Threatened|8
Gymnosperms|2011|Data Deficient|1
Gymnosperms|2011|Not Threatened|18
Gymnosperms|2011|Possibly Threatened|1
Gymnosperms|2011|Threatened|11
Gymnosperms|2012|Data Deficient|2
Gymnosperms|2012|Not Threatened|24
Gymnosperms|2012|Possibly Threatened|6
Gymnosperms|2012|Threatened|8
Gymnosperms|2013|Data Deficient|7
Gymnosperms|2013|Not Threatened|97
Gymnosperms|2013|Possibly Threatened|50
Gymnosperms|2013|Threatened|117
Gymnosperms|2014|Not Threatened|2
Gymnosperms|2015|Not Threatened|1
Gymnosperms|2015|Possibly Threatened|1
Gymnosperms|2015|Threatened|3
Gymnosperms|2016|Not Threatened|10
Gymnosperms|2016|Possibly Threatened|1
Gymnosperms|2016|Threatened|8
Gymnosperms|2017|Not Threatened|5
Gymnosperms|2017|Possibly Threatened|7
Gymnosperms|2017|Threatened|60
Gymnosperms|2018|Threatened|4
Gymnosperms|2019|Threatened|1
Pteridophytes|2011|Not Threatened|32
Pteridophytes|2011|Possibly Threatened|1
Pteridophytes|2011|Threatened|6
Pteridophytes|2012|Data Deficient|30
Pteridophytes|2012|Extinct|4
Pteridophytes|2012|Not Threatened|240
Pteridophytes|2012|Possibly Threatened|77
Pteridophytes|2012|Threatened|252
Pteridophytes|2013|Data Deficient|251
Pteridophytes|2013|Extinct|4
Pteridophytes|2013|Not Threatened|329
Pteridophytes|2013|Possibly Threatened|24
Pteridophytes|2013|Threatened|150
Pteridophytes|2014|Data Deficient|6
Pteridophytes|2014|Extinct|2
Pteridophytes|2014|Not Threatened|23
Pteridophytes|2014|Possibly Threatened|11
Pteridophytes|2014|Threatened|24
Pteridophytes|2015|Data Deficient|2
Pteridophytes|2015|Extinct|1
Pteridophytes|2015|Not Threatened|10
Pteridophytes|2015|Possibly Threatened|7
Pteridophytes|2015|Threatened|23
Pteridophytes|2016|Data Deficient|1
Pteridophytes|2016|Extinct|2
Pteridophytes|2016|Not Threatened|66
Pteridophytes|2016|Possibly Threatened|5
Pteridophytes|2016|Threatened|24
Pteridophytes|2017|Data Deficient|16
Pteridophytes|2017|Extinct|5
Pteridophytes|2017|Not Threatened|174
Pteridophytes|2017|Possibly Threatened|52
Pteridophytes|2017|Threatened|237
Pteridophytes|2018|Data Deficient|1
Pteridophytes|2018|Extinct|2
Pteridophytes|2018|Not Threatened|38
Pteridophytes|2018|Possibly Threatened|10
Pteridophytes|2018|Threatened|79
Pteridophytes|2019|Data Deficient|50
Pteridophytes|2019|Not Threatened|57
Pteridophytes|2019|Possibly Threatened|3
Pteridophytes|2019|Threatened|30
Pteridophytes|2020|Threatened|3'



plants_df <- read.table(text=txt, sep="|", header=TRUE, stringsAsFactors=FALSE)

str(plants_df)
head(plants_df)
tail(plants_df)

combns <- expand.grid(plant_group=unique(plants_df$plant_group),
                      year=unique(plants_df$year),
                      status=unique(plants_df$status))

plants_df <- merge(combns, plants_df, all.x=TRUE)

plants_wide_df <- reshape(plants_df, idvar=c("plant_group", "year"), 
                          v.names="count", timevar="status",
                          direction="wide")

colnames(plants_wide_df) <- gsub("count.", "", colnames(plants_wide_df))

cols <- c("Data Deficient", "Extinct", "Not Threatened", 
          "Possibly Threatened", "Threatened")

arry_list <- by(plants_wide_df, plants_wide_df$plant_group, 
               function(sub) {
                 m <- matrix(NA, nrow=10, ncol=5,
                             dimnames=list(sub$year, cols))
                 m[1:nrow(sub), 1:5] <- as.matrix(sub[cols])
                 return(m)
               }
            )

plants_arry <- simplify2array(arry_list)
dim(plants_arry)

plants_arry[,,"Angiosperms"]
plants_arry[,,"Pteridophytes"]


saveRDS(plants_arry, "plants_arry.rds")



### NOAA CO2 PPM

ppm_df <- setNames(
              read.csv("https://www.esrl.noaa.gov/gmd/webdata/ccgg/trends/co2/co2_mm_mlo.txt", 
                       header=FALSE,
                       sep="",
                       comment.char = "#",
                       stringsAsFactors=TRUE),
              c("year", "month", "decimal_date", "monthly_average", 
                "de_seasonalized", "num_days", "st_dev_of_days", "unc_mon_mean")
          )

str(ppm_df)

ppm_ts <- ts(ppm_df[3:8], start=c(1958, 3), end=c(2021, 2), frequency=12, class="matrix")


str(ppm_ts)

head(ppm_ts, 5)

tail(ppm_ts, 5)


saveRDS(ppm_ts, "ppm_ts.rds")


### IUCN RED LIST SPECIES
species_df <- read.csv("/home/parfaitg/Downloads/Table 3 Species by kingdom and class - show all.csv",
                       check.names=FALSE,
                       stringsAsFactors=FALSE)

char_cols <- colnames(species_df[sapply(species_df, is.character)])[-1]
species_df[char_cols] <- sapply(species_df[char_cols], function(col) as.integer(gsub(",", "", col)))

str(species_df)


species_mtx <- as.matrix(species_df[-1])

row.names(species_mtx) <- species_df$Name
head(species_mtx)

tail(species_mtx)

saveRDS(species_mtx, "species_mtx.rds")



### CREATE RDA FILES

ghg_df <- readRDS("ghg_df.rds")
plants_arry <- readRDS("plants_arry.rds")
plants_df <- readRDS("plants_df.rds")
ppm_ts <- readRDS("ppm_ts.rds")
sea_ice_df <- readRDS("sea_ice_df.rds")
species_mtx <- readRDS("species_mtx.rds")

species_vec <- unique(row.names(species_mtx))

save(ghg_df, plants_df, sea_ice_df, file="env_data_dfs.rda")

save(species_vec, ppm_ts, species_mtx, ghg_df, plants_arry, file="env_data_objs.rda")



### NON-DF FILES

ghg_t_tests <- combn(unique(ghg_df$gas), 2, simplify=FALSE, function(pair)
  t.test(emissions ~ gas, data=subset(ghg_df, gas %in% pair))
)

saveRDS(ghg_t_tests, file="ghg_t_tests.RDS")

ppm_reg <- summary(lm(monthly_average ~ year + month + decimal_date + num_days, data=ppm_df))

plants_mtx <- with(plants_df, tapply(count, list(status, plant_group), mean))
plant_chisq <- chisq.test(plants_mtx)

save(ghg_t_tests, ppm_reg, plant_chisq, file="env_non_dfs.rda")


### NON-RDATA FILE

write.csv(ppm_df, file="ppm_df.csv", row.names = FALSE, na="")


### DATE/DATETIME
test_data = "/home/parfaitg/Documents/ChiPy/pandas/pandas/tests/io/data/rdata/"

setwd(test_data)

ppm_df <- read.csv("ppm_df.csv")

ppm_df$date <- with(ppm_df, as.Date(paste0(year, "-", month, "-", 1), origin="1970-01-01"))
ppm_df$date_time <- with(ppm_df, as.POSIXct(ifelse(year >= 1970, paste0(year, "-", month, "-", 1), NA),
                                            format = "%Y-%m-%d",
                                            origin="1970-01-01 00:00:00"))
tail(ppm_df)

saveRDS(subset(ppm_df, year >= 1970), "ppm_df.rds")

test_df <- readRDS("/home/parfaitg/Documents/Projects/r_io/r_objs/r_df.rds")
str(test_df)

str(ppm_df)


### DATETIME
path <- "https://www.esrl.noaa.gov/gmd/webdata/ccgg/trends/co2/co2_mm_mlo.txt"

ppm_df <- read.table(path, skip=53, header=FALSE,
                     col.names=c("year", "month", "decimal_date", 
                                 "monthly_average", "deseasonalized",
                                 "num_days", "std_dev_of_days",
                                 "unc_of_mon_mean"))

`row.names<-`(tail(transform(ppm_df, decimal_date=NULL), 5), NULL)

# Converting date in Year.decimal form in R
ppm_df <- within(ppm_df, {
  year_beginning <- as.POSIXct(paste0(year, '-01-01'))
  year_end <- as.POSIXct(paste0(year+1, '-01-01'))
  date <- year_beginning + (decimal_date %% 1) * (year_end - year_beginning)
  date <- as.POSIXct(date, origin="1970-01-01", tz="America/Chicago")
  
  rm(year_beginning, year_end)
})

ppm_df <- ppm_df[c("date", "decimal_date",
                   "monthly_average", "deseasonalized",
                   "num_days", "std_dev_of_days",
                   "unc_of_mon_mean")]

ppm_df <- head(ppm_df, 780)
save(ppm_df, file="ppm_df.rda")

ppm_df <- `row.names<-`(ppm_df[ppm_df$date >= "1970-01-01",],
                        NULL)
load("ppm_df.rda")
head(ppm_df, 5)
tail(ppm_df, 5)

ro <- "/home/parfaitg/Documents/Projects/r_io/r_objs"
load(file.path(ro, "new_pandas_df.rda"))

head(pandas_dataframe, 5)
tail(pandas_dataframe, 5)

load("ppm_df.rda")
tail(ppm_df, 5)


### OUT OF BOUNDS DATE

planetary_boundary <- data.frame(
  earth_sytems_process = c("climate change", "biodiversity loss", "biogeochemical", "ocean acidfication",
                           "land use", "freshwater", "ozone depletion", "atmospheric aerosols", "chemical pollution"),
  control_variable = c("Atmospheric carbon dioxide concentration (ppm by volume)) or increase in radiative forcing (W/m2)",
                       "Extinction rate (number of species per million per year)",
                       "anthropogenic nitrogen removed from the atmosphere (millions of tonnes per year) and anthropogenic phosphorus going into the oceans (millions of tonnes per year)",
                       "Global mean saturation state of calcium carbonate in surface seawater (omega units)",
                       "Land surface converted to cropland (percent)",
                       "Global human consumption of water (km3/yr)",
                       "Stratospheric ozone concentration (Dobson units)",
                       "Overall particulate concentration in the atmosphere, on a regional basis",
                       "Concentration of toxic substances, plastics, endocrine disruptors, heavy metals, and radioactive contamination into the environment"),
  boundary_value = c(350, 10, 35, 2.75, 15, 4000, 276, NA, NA),
  current_value = c(412, 100, 121, 2.90, 11.7, 2600, 283, NA, NA),
  boundary_crossed = c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, NA, NA),
  preindustrial_value = c(280, 1, 0, 3.44, 0, 415, 290, NA, NA),
  preindustrial_start = c(as.POSIXct("1650-01-01"),
                          as.POSIXct("1750-01-01"),
                          as.POSIXct("1850-01-01"),
                          as.POSIXct("1950-01-01"),
                          as.POSIXct("1980-01-01"),
                          as.POSIXct("1750-01-01"),
                          as.POSIXct("1750-01-01"),
                          NA, NA),
  preindustrial_end = c(as.POSIXct("1749-12-31"),
                        as.POSIXct("1849-12-31"),
                        as.POSIXct("1949-12-31"),
                        as.POSIXct("1979-12-31"),
                        as.POSIXct("1999-12-31"),
                        as.POSIXct("1849-12-31"),
                        as.POSIXct("1849-12-31"),
                        NA, NA)
)
