fiber<- read.csv("fiber.csv")
require(ggplot2)
require(cowplot)

OneWayFit.IDF <- aov(IDF~Entry, data=fiber)
OneWayFit.SDF <- aov(SDF~Entry, data=fiber)
OneWayFit.Raff <- aov(Raff~Entry, data=fiber)
OneWayFit.Verb <- aov(Verb~Entry, data=fiber)
OneWayFit.Stach <- aov(Stach~Entry, data=fiber)

p.hist.IDF <- ggplot(data=fiber, 
                     aes(fiber$IDF)) + geom_histogram(colour = "black", 
                                                      fill="white", 
                                                      binwidth=((max(fiber$IDF)-min(fiber$IDF))/15))

p.hist.SDF <- ggplot(data=fiber, 
                     aes(fiber$SDF)) + geom_histogram(colour = "black", 
                                                      fill="white", 
                                                      binwidth=((max(fiber$SDF)-min(fiber$SDF))/15))

p.hist.Raff <- ggplot(data=fiber, 
                      aes(fiber$Raff)) + geom_histogram(colour = "black", 
                                                        fill="white", 
                                                        binwidth=((max(fiber$Raff)-min(fiber$Raff))/15))

p.hist.Verb <- ggplot(data=fiber, 
                      aes(fiber$Verb)) + geom_histogram(colour = "black", 
                                                        fill="white", 
                                                        binwidth=((max(fiber$Verb)-min(fiber$Verb))/15))

p.hist.Stach <- ggplot(data=fiber, 
                       aes(fiber$Stach)) + geom_histogram(colour = "black", 
                                                          fill="white", 
                                                          binwidth=((max(fiber$Stach)-min(fiber$Stach))/15))

p.hist.logIDF <- ggplot(data=fiber, aes(log(fiber$IDF))) + geom_histogram(colour = "black", fill="white", binwidth=((max(log(fiber$IDF))-min(log(fiber$IDF)))/15))

p.hist.logRaff <- ggplot(data=fiber, aes(log(fiber$Raff))) + geom_histogram(colour = "black", fill="white", binwidth=((max(log(fiber$Raff))-min(log(fiber$Raff)))/15))

