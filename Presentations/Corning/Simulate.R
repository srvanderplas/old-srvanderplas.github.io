library(lubridate)
library(plyr)
data <- data.frame(
  time = seq(ymd('2001-09-01'),ymd('2014-12-31'),by='days'),
  capacity.factor = 100)

# Outages
outage.start <- seq(ymd('2002-02-15'),ymd('2012-08-15'), by='months')[1+18*(0:7)]
outage.length <- rpois(8, 35)
idx <- which(data$time%in%outage.start)
outage <- unlist(lapply(1:8, function(i) seq(idx[i],(idx+outage.length)[i])))
data$capacity.factor[outage] <- 0
data$outage <- FALSE
data$outage[outage] <- TRUE

# Downpowers
# assume 2-3 days, approximately every 60 days
idx <- which(data$capacity.factor>0)
downpower.start <- rpois(100, 90)
downpower.duration <- sample(1:2, 100, replace=T)
downpower.start <- cumsum(downpower.start)
downpower.start <- idx[downpower.start]
downpower.start <- downpower.start[!is.na(downpower.start)] 
downpower.end <- downpower.start + downpower.duration[1:length(downpower.start)]
downpower <- unlist(lapply(1:length(downpower.start), function(i) downpower.start[i]:downpower.end[i]))

data$capacity.factor[downpower] <- rnorm(length(downpower), 50, 10)

# Unplanned Outages
# assume once a year, from 1-6 days
idx <- which(data$capacity.factor==100)
unplanned.start <- sample(idx, 10)
unplanned.end <- unplanned.start + sample(1:6, 10, replace=T)
unplanned <- unlist(lapply(1:10, function(i) unplanned.start[i]:unplanned.end[i]))
data$capacity.factor[unplanned] <- 0

# one other outage of 20ish days
idx <- which(data$capacity.factor==100)
unplanned.start <- sample(idx, 1)
unplanned.end <- unplanned.start + rnorm(1, 20, 5)
unplanned <- unplanned.start:unplanned.end
data$capacity.factor[unplanned] <- 0
qplot(data=data, x=time, y=capacity.factor, geom="line")

data$monthyear <- data$time
day(data$monthyear) <- 1

month.summary <- ddply(data, .(monthyear), summarize, capacity.factor=mean(capacity.factor), outage=sum(outage)>0)
qplot(data=month.summary, x=monthyear, y=capacity.factor, geom="line") + 
  geom_segment(data=subset(month.summary, outage), aes(x=monthyear, xend=monthyear, y=0, yend=capacity.factor), colour="red")
month.summary$cyclemonth <- c(12:18, 1:18, 1:18, 1:18, 1:18, 1:18, 1:18, 1:18, 1:27) 

new.d <- month.summary[-which(month.summary$outage), ]
N <- 100000
boots2 <- matrix(0, nrow=N, ncol=23)
EFboot2 <- rep(0, N)
nsamp <- dim(new.d)[1]
for(i in 1:N){
  boots2[i,] <- sample(which(new.d$cyclemonth<=16), 23, replace=TRUE)
  EFboot2[i] <- sum(new.d$EFPDL[boots2[i,]])  
}

EFmeandens2 <- density(EFboot2)
EFmeanCDF2 <- cumsum(EFmeandens2$y/sum(EFmeandens2$y))
