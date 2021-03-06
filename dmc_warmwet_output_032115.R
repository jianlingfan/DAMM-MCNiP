#upload####
#warm is at 5deg, sum and win warm is at 3deg
df <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/mydataFlux.csv", sep=",",header=T, na.strings="NA")

bulk <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulk_032115.csv", sep=",",header=T, na.strings="NA")
rhizo <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizo_032115.csv", sep=",",header=T, na.strings="NA")

bulkwarm5 <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkwarm5_032215.csv", sep=",",header=T, na.strings="NA")
rhizowarm5 <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizowarm5_032215.csv", sep=",",header=T, na.strings="NA")
bulkcold5 <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkcold5_032215.csv", sep=",",header=T, na.strings="NA")
rhizocold5 <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizocold5_032215.csv", sep=",",header=T, na.strings="NA")

bulkwarm2x <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkwarm2x_032215.csv", sep=",",header=T, na.strings="NA")
rhizowarm2x <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizowarm2x_032215.csv", sep=",",header=T, na.strings="NA")
bulkcold0.5x <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkcold_032215.csv", sep=",",header=T, na.strings="NA")
rhizocol0.5x <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizocold_032215.csv", sep=",",header=T, na.strings="NA")

bulkwet <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkwet_032115.csv", sep=",",header=T, na.strings="NA")
rhizowet <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizowet_032115.csv", sep=",",header=T, na.strings="NA")
bulkdry <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/bulkdry_032115.csv", sep=",",header=T, na.strings="NA")
rhizodry <-read.csv("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/rhizodry_032115.csv", sep=",",header=T, na.strings="NA")

#bulk rhizo scale####
#convert mg/cm3/hr to mg/m2/hr
frac = 0.2048506
normal <- NULL
normal <- (rhizo*frac+bulk*(1-frac))*(0.1*100*100*100)
warm <- NULL
warm <- (rhizowarm*frac+bulkwarm*(1-frac))*(0.1*100*100*100)
sumwarm <- NULL
sumwarm <- (rhizosumwarm*frac+bulksumwarm*(1-frac))*(0.1*100*100*100)
winwarm <- NULL
winwarm <- (rhizowinwarm*frac+bulkwinwarm*(1-frac))*(0.1*100*100*100)
wet <- NULL
wet <- (rhizowet*frac+bulkwet*(1-frac))*(0.1*100*100*100)
dry <- NULL
dry <- (rhizodry*frac+bulkdry*(1-frac))*(0.1*100*100*100)

#save plots code 1 panel####
pdf(("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/warm_032115.pdf"))

par(mfrow=c(1,2))
par(mar = c(5,5,1,1))
par(oma = c(0,0,0,0))
#C min
plot(df$timeNA, warm$CMIN, type="l", ylim=c(0,350), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("C flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$CMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","Warmed"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#N min
plot(df$timeNA, warm$NMIN, type="l", ylim = c(0,5), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("N flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$NMIN, col = 4, cex = 0.5, type="l")

dev.off()

#save plots code 4 panel CMIN####
pdf(("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/warmwet_031615.pdf"))

par(mfrow=c(2,2))
par(mar = c(5,5,1,1))
par(oma = c(0,0,0,0))
#summer warming
plot(df$timeNA, sumwarm$CMIN, type="l", ylim = c(0,300), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("C flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$CMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","Summer warming"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#winter warming
plot(df$timeNA, winwarm$CMIN, type="l", ylim = c(0,300), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("C flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$CMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","Winter warming"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#0.5x soilM
plot(df$timeNA, dry$CMIN, type="l", ylim = c(0,300), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("C flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$CMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","0.5x Soil Moisture"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#2x soilM
plot(df$timeNA, wet$CMIN, type="l", ylim= c(0,300), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("C flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$CMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","2x Soil Moisture"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

dev.off()

#save plots code 4 panel NMIN####
pdf(("C:/Users/rose/Dropbox/current/root research/data 2014/Ch4/warmwet_nmin_031615.pdf"))

par(mfrow=c(2,2))
par(mar = c(5,5,1,1))
par(oma = c(0,0,0,0))
#summer warming
plot(df$timeNA, sumwarm$NMIN, type="l", ylim = c(0,5), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("N flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$NMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","Summer warming"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#winter warming
plot(df$timeNA, winwarm$NMIN, type="l", ylim = c(0,5), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("N flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$NMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","Winter warming"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#0.5x soilM
plot(df$timeNA, dry$NMIN, type="l", ylim = c(0,5), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("N flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$NMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","0.5x Soil Moisture"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

#2x soilM
plot(df$timeNA, wet$NMIN, type="l", ylim= c(0,5), col =6, cex = 0.5, cex.axis = 1.3, cex.lab = 1.5, xlab = "Day of year", ylab = expression("N flux (mg " ~ m^{-2} ~ hr^{-1} ~ ")"))
points(df$timeNA, normal$NMIN, col = 4, cex = 0.5, type="l")
legend("topleft",c("Ambient","2x Soil Moisture"),
       pch = c(16,16),
       col=c(4,6),cex=1.3, bty = "n"
)

dev.off()