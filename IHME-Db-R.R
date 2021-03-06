## David Jackson
## davidjayjackson@gmail.com
## Data Source: http://www.healthdata.org/covid
##
## load libraries
##
library(RSQLite)
library(ggplot2)
library(scales)
##
db <- dbConnect(SQLite(), dbname="../COVIDDB/IHME.sqlite3")
##
BMH<- read.csv("./DATA/Best_mask_hospitalization_all_locs.csv")
dbWriteTable(db, "BMH",BMH ,overwrite=TRUE)
BMH$date <- as.Date(BMH$date)
summary(BMH$date)
##
RFHOSP <- read.csv("./DATA/Reference_hospitalization_all_locs.csv")
dbWriteTable(db, "RFHOSP",RFHOSP ,overwrite=TRUE)
RFHOSP$date <- as.Date(RFHOSP$date)
summary(RFHOSP$date)
##
STATS <- read.csv("./DATA/Summary_stats_all_locs.csv")
# names(STATS)
dbWriteTable(db, "STATS",STATS ,overwrite=TRUE)
##
WORSE <- read.csv("./DATA/Worse_hospitalization_all_locs.csv")

dbWriteTable(db, "WORSE",WORSE ,overwrite=TRUE)
WORSE$date <- as.Date(WORSE$date)
##
dbListTables(db)
