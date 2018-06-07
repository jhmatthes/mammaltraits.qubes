# Load data for the app

dat  <- read.delim("data/PanTHERIA_1-0_WR05_Aug2008.txt",header=TRUE, sep="\t",na.strings="-999.00")
dat$metmass <- dat$X18.1_BasalMetRate_mLO2hr / dat$X5.1_AdultBodyMass_g
dat$species <- paste(dat$MSW05_Genus,dat$MSW05_Species,sep=" ")
order.names <- unique(dat[,1])
