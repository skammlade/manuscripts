#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber_facet.csv")


#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
sub.raff <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                         fiber$ftype %in% c('Raff'), ]

sub.stach<- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                    fiber$ftype %in% c('Stach'), ]

sub.verb <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                    fiber$ftype %in% c('Verb'), ]

sub.toligos <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                    fiber$ftype %in% c('TOligos'), ]

sub.IDF <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                    fiber$ftype %in% c('IDF'), ]

sub.SDF<- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                    fiber$ftype %in% c('SDF'), ]

sub.TDF<- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                  fiber$ftype %in% c('TDF'), ]



out.raff.mkt = boxplot(sub.raff$value ~ sub.raff$mktclass, plot=FALSE)$out
out.raff.mkt <- sub.raff[sub.raff$value %in% out.raff.mkt,]
out.raff.mkt <- subset(out.raff.mkt, select=c(Entry, mktclass, race, Rep, value))

out.raff.race = boxplot(sub.raff$value ~ sub.raff$race, plot=FALSE)$out
out.raff.race <- sub.raff[sub.raff$value %in% out.raff.race,]
out.raff.race <- subset(out.raff.race, select=c(Entry, mktclass, race, Rep, value))


out.stach.mkt = boxplot(sub.stach$value ~ sub.stach$mktclass, plot=FALSE)$out
out.stach.mkt <- sub.stach[sub.stach$value %in% out.stach.mkt,]
out.stach.mkt <- subset(out.stach.mkt, select=c(Entry, mktclass, race, Rep, value))

out.stach.race = boxplot(sub.stach$value ~ sub.stach$race, plot=FALSE)$out
out.stach.race <- sub.stach[sub.stach$value %in% out.stach.race,]
out.stach.race <- subset(out.stach.race, select=c(Entry, mktclass, race, Rep, value))


out.verb.mkt = boxplot(sub.verb$value ~ sub.verb$mktclass, plot=FALSE)$out
out.verb.mkt <- sub.verb[sub.verb$value %in% out.verb.mkt,]
out.verb.mkt <- subset(out.verb.mkt, select=c(Entry, mktclass, race, Rep, value))

out.verb.race = boxplot(sub.verb$value ~ sub.verb$race, plot=FALSE)$out
out.verb.race <- sub.verb[sub.verb$value %in% out.verb.race,]
out.verb.race <- subset(out.verb.race, select=c(Entry, mktclass, race, Rep, value))


out.toligos.mkt = boxplot(sub.toligos$value ~ sub.toligos$mktclass, plot=FALSE)$out
out.toligos.mkt <- sub.toligos[sub.toligos$value %in% out.toligos.mkt,]
out.toligos.mkt <- subset(out.toligos.mkt, select=c(Entry, mktclass, race, Rep, value))

out.toligos.race = boxplot(sub.toligos$value ~ sub.toligos$race, plot=FALSE)$out
out.toligos.race <- sub.toligos[sub.toligos$value %in% out.toligos.race,]
out.toligos.race <- subset(out.toligos.race, select=c(Entry, mktclass, race, Rep, value))


out.IDF.mkt = boxplot(sub.IDF$value ~ sub.IDF$mktclass, plot=FALSE)$out
out.IDF.mkt <- sub.IDF[sub.IDF$value %in% out.IDF.mkt,]
out.IDF.mkt <- subset(out.IDF.mkt, select=c(Entry, mktclass, race, Rep, value))

out.IDF.race = boxplot(sub.IDF$value ~ sub.IDF$race, plot=FALSE)$out
out.IDF.race <- sub.IDF[sub.IDF$value %in% out.IDF.race,]
out.IDF.race <- subset(out.IDF.race, select=c(Entry, mktclass, race, Rep, value))


out.SDF.mkt = boxplot(sub.SDF$value ~ sub.SDF$mktclass, plot=FALSE)$out
out.SDF.mkt <- sub.SDF[sub.SDF$value %in% out.SDF.mkt,]
out.SDF.mkt <- subset(out.SDF.mkt, select=c(Entry, mktclass, race, Rep, value))

out.SDF.race = boxplot(sub.SDF$value ~ sub.SDF$race, plot=FALSE)$out
out.SDF.race <- sub.SDF[sub.SDF$value %in% out.SDF.race,]
out.SDF.race <- subset(out.SDF.race, select=c(Entry, mktclass, race, Rep, value))


out.TDF.mkt = boxplot(sub.TDF$value ~ sub.TDF$mktclass, plot=FALSE)$out
out.TDF.mkt <- sub.TDF[sub.TDF$value %in% out.TDF.mkt,]
out.TDF.mkt <- subset(out.TDF.mkt, select=c(Entry, mktclass, race, Rep, value))

out.TDF.race = boxplot(sub.TDF$value ~ sub.TDF$race, plot=FALSE)$out
out.TDF.race <- sub.TDF[sub.TDF$value %in% out.TDF.race,]
out.TDF.race <- subset(out.TDF.race, select=c(Entry, mktclass, race, Rep, value))
