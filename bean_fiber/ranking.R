
library(data.table)
fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub <- subset(fiber, mktclass=='GN' | mktclass=='pink' | mktclass=='pinto' | mktclass=='small red' | mktclass=='black' | mktclass=='small white')


summ.IDF <-summarySE(fibersub, measurevar="IDF", groupvars=c("Entry","mktclass","race"))
summ.IDF <- data.frame(summ.IDF)
sub.IDF <- subset(summ.IDF, select=c(Entry, mktclass, race, IDF, sd, se, ci))
clean.IDF <- sub.IDF[order(-sub.IDF$IDF), ]
clean.IDF[,4:7] <- round(clean.IDF[,4:7], 2)
df.IDF <- data.table(clean.IDF)
head.IDF <- head(df.IDF, 5)
tail.IDF <- tail(df.IDF,5)


summ.SDF <-summarySE(fibersub, measurevar="SDF", groupvars=c("Entry","mktclass","race"))
summ.SDF <- data.frame(summ.SDF)
sub.SDF <- subset(summ.SDF, select=c(Entry, mktclass, race, SDF, sd, se, ci))
clean.SDF <- sub.SDF[order(-sub.SDF$SDF), ]
clean.SDF[,4:7] <- round(clean.SDF[,4:7], 2)
df.SDF <- data.table(clean.SDF)
head.SDF <- head(df.SDF, 5)
tail.SDF <- tail(df.SDF,5)


summ.TDF <-summarySE(fibersub, measurevar="TDF", groupvars=c("Entry","mktclass","race"))
summ.TDF <- data.frame(summ.TDF)
sub.TDF <- subset(summ.TDF, select=c(Entry, mktclass, race, TDF, sd, se, ci))
clean.TDF <- sub.TDF[order(-sub.TDF$TDF), ]
clean.TDF[,4:7] <- round(clean.TDF[,4:7], 2)
df.TDF <- data.table(clean.TDF)
head.TDF <- head(df.TDF, 5)
tail.TDF <- tail(df.TDF,5)


summ.Raff <-summarySE(fibersub, measurevar="Raff", groupvars=c("Entry","mktclass","race"))
summ.Raff <- data.frame(summ.Raff)
sub.Raff <- subset(summ.Raff, select=c(Entry, mktclass, race, Raff, sd, se, ci))
clean.Raff <- sub.Raff[order(-sub.Raff$Raff), ]
clean.Raff[,4:7] <- round(clean.Raff[,4:7], 2)
df.Raff <- data.table(clean.Raff)
head.Raff <- head(df.Raff, 5)
tail.Raff <- tail(df.Raff,5)


summ.Stach <-summarySE(fibersub, measurevar="Stach", groupvars=c("Entry","mktclass","race"))
summ.Stach <- data.frame(summ.Stach)
sub.Stach <- subset(summ.Stach, select=c(Entry, mktclass, race, Stach, sd, se, ci))
clean.Stach <- sub.Stach[order(-sub.Stach$Stach), ]
clean.Stach[,4:7] <- round(clean.Stach[,4:7], 2)
df.Stach <- data.table(clean.Stach)
head.Stach <- head(df.Stach, 5)
tail.Stach <- tail(df.Stach,5)


summ.Verb <-summarySE(fibersub, measurevar="Verb", groupvars=c("Entry","mktclass","race"))
summ.Verb <- data.frame(summ.Verb)
sub.Verb <- subset(summ.Verb, select=c(Entry, mktclass, race, Verb, sd, se, ci))
clean.Verb <- sub.Verb[order(-sub.Verb$Verb), ]
clean.Verb[,4:7] <- round(clean.Verb[,4:7], 2)
df.Verb <- data.table(clean.Verb)
head.Verb <- head(df.Verb, 5)
tail.Verb <- tail(df.Verb,5)


summ.TOligos <-summarySE(fibersub, measurevar="TOligos", groupvars=c("Entry","mktclass","race"))
summ.TOligos <- data.frame(summ.TOligos)
sub.TOligos <- subset(summ.TOligos, select=c(Entry, mktclass, race, TOligos, sd, se, ci))
clean.TOligos <- sub.TOligos[order(-sub.TOligos$TOligos), ]
clean.TOligos[,4:7] <- round(clean.TOligos[,4:7], 2)
df.TOligos <- data.table(clean.TOligos)
head.TOligos <- head(df.TOligos, 5)
tail.TOligos <- tail(df.TOligos,5)