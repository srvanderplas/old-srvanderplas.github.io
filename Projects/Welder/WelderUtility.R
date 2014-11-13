obj <- ls()

millermatic140 <- use*0
millermatic140[2,1:2] <- use[2,1:2]

millermatic180 <- use*0
millermatic180[2,1:2] <- use[2,1:2]

millermatic211 <- use*0
millermatic211[2,1:3] <- use[2,1:3]

millermatic212 <- use*0
millermatic212[2,1:3] <- use[2,1:3]

millermatic252 <- use*0
millermatic252[2,1:3] <- use[2,1:3]

millermatic350 <- use*0
millermatic350[2,1:3] <- use[2,1:3]

diversion165 <- use*0
diversion165[2:3,1:3] <- use[2:3,1:3]

diversion180 <- use*0
diversion180[2:3,1:3] <- use[2:3,1:3]

syncrowave210 <- use
syncrowave210[1:2,4:5] <- 0

syncrowave250 <- use
syncrowave250[1:2,4:5] <- 0

dynasty200 <- use
dynasty200[2,4:5] <- 0

dynasty280 <- use
dynasty280[2,4:5] <- 0

dynasty350 <- use
dynasty350[2,4:5] <- 0

XMT304 <- use

multimatic200 <- use*0
multimatic200[1:3,1:3] <- use[1:3,1:3]
multimatic200[1,3] <- 0

invertec155 <- use*0
invertec155[1,1:2] <- use[1,1:2]

AC225 <- use*0
AC225[1,1:3] <- use[1,1:3]
AC225[1,2] <- 0

buzz <- use*0
buzz[1,1:2] <- use[1,1:2]

invertec275 <- use*0
invertec275[1:3,1:2] <- use[1:3,1:2]

idealarc250 <- use*0
idealarc250[1,1:3] <- use[1,1:3]

invertec160 <- use*0
invertec160[1:3,1:2] <- use[1:3,1:2]

precision225 <- use*0
precision225[1:3,1:3] <- use[1:3,1:3]

precision275 <- use*0
precision275[1:3,1:3] <- use[1:3,1:3]

precision375 <- use*0
precision375[1:3,1:3] <- use[1:3,1:3]

squarewave175 <- use*0
squarewave175[1:3,1:3] <- use[1:3,1:3]

powermig140 <- use*0
powermig140[2,1:2] <- use[2,1:2]

powermig180 <- use*0
powermig180[2,1:2] <- use[2,1:2]

powermig210 <- use*0
powermig210[1:3,1:2] <- use[1:3,1:2]

powermig210.addon <- use*0
powermig210.addon[1:3,1:2] <- use[1:3,1:2]
powermig210.addon[2,3] <- use[2,3]

powermig256 <- use*0
powermig256[2,1:2] <- use[2,1:2]

idealarc305 <- use*0
idealarc305[2,1:2] <- use[2,1:2]

invertec350 <- use*0
invertec350[1:3,1:5] <- use[1:3,1:5]
invertec350[1:2,4:5] <- 0

invertig131 <- use*0
invertig131[2:3,1:2] <- use[2:3,1:2]
invertig131[3,4:5] <- use[3,4:5]

invertig221 <- use
invertig221[1:2,4:5] <- 0

powerarc140 <- use*0
powerarc140[1,1:2] <- use[1,1:2]

powerarc160 <- use*0
powerarc160[1:3,1:2] <- use[1:3,1:2]

powerarc200 <- use*0
powerarc200[1,1:2] <- use[1,1:2]

powerarc300 <- use*0
powerarc300[1,1:2] <- use[1,1:2]

powerarc140T <- use*0
powerarc140T[1:3,1:2] <- use[1:3,1:2]

powertig200 <- use*0
powertig200[1:3,1:2] <- use[1:3,1:2]

powerarc200T <- use*0
powerarc200T[1:3,1:2] <- use[1:3,1:2]

powertig185 <- use*0
powertig185[1:3,1:3] <- use[1:3,1:3]
powertig185[1,3] <- 0

powertig200DV <- use*0
powertig200DV [1:3,1:3] <- use[1:3,1:3]
powertig200DV [3:4,4:5] <- use[3:4,4:5] 
powertig200DV [1,3] <- 0

powertig250EX <- use*0
powertig250EX [1:3,1:3] <- use[1:3,1:3]
powertig250EX [3:4,4:5] <- use[3:4,4:5] 
powertig250EX [1,3] <- 0

powertig280T <- use*0
powertig280T[1:4,1:2] <- use[1:4,1:2]

powertig325T <- use*0
powertig325T [1:3,1:3] <- use[1:3,1:3]
powertig325T [3:4,4:5] <- use[3:4,4:5] 
powertig325T [1,3] <- 0

powermig140 <- use*0
powermig140[2,1:2] <- use[2,1:2]

powermig200E <- use*0
powermig200E[2,1:2] <- use[2,1:2]

powermig200 <- use*0
powermig200[1:2,1:2] <- use[1:2,1:2]

powermig250 <- use*0
powermig250[1:2,1:2] <- use[1:2,1:2]

powermts200 <- use*0
powermts200[1:3,1:2] <- use[1:3,1:2]

powermts250 <- use*0
powermts250[1:3,1:2] <- use[1:3,1:2]

thermalarc95 <- use*0
thermalarc95[1:3,1:2] <- use[1:3,1:2]

thermalarc160 <- use*0
thermalarc160[1:3,1:2] <- use[1:3,1:2]

thermalarc186 <- use*0
thermalarc186[1:3,1:3] <- use[1:3,1:3]

arcmaster200 <- use*0
arcmaster200[1:3,1:3] <- use[1:3,1:3]

arcmaster300 <- use*0
arcmaster300[1:3,1:2] <- use[1:3,1:2]
welderlist <- list("Millermatic 140" = millermatic140, 
                   "Millermatic 180" = millermatic180, 
                   "Millermatic 211" = millermatic211, 
                   "Millermatic 212" = millermatic212, 
                   "Millermatic 252" = millermatic252, 
                   "Millermatic 350" = millermatic350, 
                   "Diversion 165" = diversion165, 
                   "Diversion 180" = diversion180, 
                   "Syncrowave 210" = syncrowave210,
                   "Syncrowave 250" = syncrowave250,
                   "Dynasty 200" = dynasty200,
                   "Dynasty 280" = dynasty280,
                   "Dynasty 350" = dynasty350,
                   "XMT 304" = XMT304,
                   "Multimatic 200" = multimatic200, 
                   "Invertec V155" = invertec155,
                   "Buzz AC225" = AC225, 
                   "Buzz" = buzz, 
                   "Invertec 275" = invertec275,
                   "Idealarc 250" = idealarc250,
                   "Invertec V160" = invertec160,
                   "Precision TIG 225" = precision225,
                   "Precision TIG 275" = precision275,
                   "Precision TIG 375" = precision375,
                   "PowerMIG 140" = powermig140, 
                   "PowerMIG 180" = powermig180, 
                   "PowerMIG 210" = powermig210, 
                   "PowerMIG 210 + Addon" = powermig210.addon, 
                   "PowerMIG 256" = powermig256, 
                   "Idealarc 305" = idealarc305, 
                   "Invertec 350" = invertec350,
                   "Squarewave 175" = squarewave175,
                   "Invertig 131" = invertig131,
                   "Invertig 221" = invertig221,
                   "Powerarc 140" = powerarc140,
                   "Powerarc 160" = powerarc160,
                   "Powerarc 200" = powerarc200,
                   "Powerarc 300" = powerarc300,
                   "Powerarc 140T" = powerarc140T,
                   "Power i-TIG 200" = powertig200,
                   "Powerarc 200T" = powerarc200T,
                   "Power i-TIG 185" = powertig185,
                   "Power i-TIG 200DV" = powertig200DV,
                   "Power i-TIG 250EX" = powertig250EX,
                   "Power i-TIG 280T" = powertig280T,
                   "Power i-TIG 325T" = powertig325T,
                   "Power i-MIG 140" = powermig140,
                   "Power i-MIG 200E" = powermig200E,
                   "Power i-MIG 200" = powermig200,
                   "Power i-MIG 250" = powermig250,
                   "PowerMTS 200" = powermts200,
                   "PowerMTS 250S" = powermts250,
                   "Thermalarc 95" = thermalarc95,
                   "Thermalarc 160" = thermalarc160,
                   "Thermalarc 186" = thermalarc186,
                   "ArcMaster 200" = arcmaster200,
                   "ArcMaster 300" = arcmaster300)

welderlist2 <- list("Buzz" = buzz, 
                    "Millermatic 180" = millermatic180, 
                    "Multimatic 200" = multimatic200, 
                    "PowerMIG 210" = powermig210, 
                    "PowerMIG 210 + Addon" = powermig210.addon, 
                    "Squarewave 175" = squarewave175, 
                    "Syncrowave 210" = syncrowave210)

obj2 <- ls()
obj2 <- obj2[!obj2%in%c(obj, "welderlist", "welderlist2")]
rm(list=obj2)
rm(obj2)
