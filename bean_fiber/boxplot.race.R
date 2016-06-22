#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber.csv")

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub <- subset(fiber, 
                   mktclass=='GN' | 
                     mktclass=='pink' | 
                     mktclass=='pinto' | 
                     mktclass=='small red' | 
                     mktclass=='black' | 
                     mktclass=='small white')

#load required packages
require(ggplot2)
require(cowplot)

#insoluble dietary fibersub
p.IDF.race <- ggplot(fibersub, 
                    aes(x=race, y=IDF, fill=race))

p.IDF.race <- p.IDF.race + geom_boxplot()

p.IDF.race <- p.IDF.race + theme(legend.position="none",
                                 legend.title=element_blank(),
                                 plot.title = element_text(size=15),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=0, hjust=0.5, 
                                                            vjust=1, 
                                                            size=12),
                                 axis.title.y = element_blank())

#add point at mean
p.IDF.race <- p.IDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.IDF.race <- p.IDF.race + labs(title="Insoluble DF")



#SOLUBLE dietary fibersub
p.SDF.race <- ggplot(fibersub, 
                    aes(x=race, y=SDF, fill=race))

p.SDF.race <- p.SDF.race + geom_boxplot()

p.SDF.race <- p.SDF.race + theme(legend.position="none",
                                 plot.title = element_text(size=15),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=00, hjust=0.5, 
                                                            vjust=1, 
                                                            size=12),
                                 axis.title.y = element_blank())

#add point at mean
p.SDF.race <- p.SDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.SDF.race <- p.SDF.race + labs(title="Soluble DF")




#RAFF
p.Raff.race <- ggplot(fibersub, 
                     aes(x=race, y=Raff, fill=race))

p.Raff.race <- p.Raff.race + geom_boxplot()

p.Raff.race <- p.Raff.race + theme(legend.position="none",
                                   plot.title = element_text(size=15),
                                   axis.title.x = element_blank(),
                                   axis.text.x = element_text(angle=0, hjust=0.5, 
                                                              vjust=1, 
                                                              size=12),
                                   axis.title.y = element_blank())

#add point at mean
p.Raff.race <- p.Raff.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Raff.race <- p.Raff.race + labs(title="Raffinose")





#STACH
p.Stach.race <- ggplot(fibersub, 
                      aes(x=race, y=Stach, fill=race))

p.Stach.race <- p.Stach.race + geom_boxplot()

p.Stach.race <- p.Stach.race + theme(legend.position="none",
                                     legend.title=element_blank(),
                                     plot.title = element_text(size=15),
                                     axis.title.x = element_blank(),
                                     axis.text.x = element_text(angle=0, hjust=0.5, 
                                                                vjust=1, 
                                                                size=12),
                                     axis.title.y = element_blank())

#add point at mean
p.Stach.race <- p.Stach.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Stach.race <- p.Stach.race + labs(title="Stachyose")



#VERB
p.Verb.race <- ggplot(fibersub, 
                     aes(x=race, y=Verb, fill=race))

p.Verb.race <- p.Verb.race + geom_boxplot()

p.Verb.race <- p.Verb.race + theme(legend.position="none",
                                   plot.title = element_text(size=15),
                                   axis.title.x = element_blank(),
                                   axis.text.x = element_text(angle=0, hjust=0.5, 
                                                              vjust=1, 
                                                              size=12),
                                   axis.title.y = element_blank())

#add point at mean
p.Verb.race <- p.Verb.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Verb.race <- p.Verb.race + labs(title="Verbascose")



#total oligos
p.TOligos.race <- ggplot(fibersub, 
                        aes(x=race, y=TOligos, fill=race))

p.TOligos.race <- p.TOligos.race + geom_boxplot()

p.TOligos.race <- p.TOligos.race + theme(legend.position="none",
                                         plot.title = element_text(size=15),
                                         axis.title.x = element_blank(),
                                         axis.text.x = element_text(angle=0, hjust=0.5, 
                                                                    vjust=1, 
                                                                    size=12),
                                         axis.title.y = element_blank())

#add point at mean
p.TOligos.race <- p.TOligos.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.TOligos.race <- p.TOligos.race + labs(title="Total Oligosaccharides")




#total dietary fibersub
p.TDF.race <- ggplot(fibersub, 
                    aes(x=race, y=TDF, fill=race))

p.TDF.race <- p.TDF.race + geom_boxplot()

p.TDF.race <- p.TDF.race + theme(legend.position="none",
                                 legend.title=element_blank(),
                                 plot.title = element_text(size=15),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=0, hjust=0.5, 
                                                            vjust=1, 
                                                            size=12),
                                 axis.title.y = element_blank())

#add point at mean
p.TDF.race <- p.TDF.race + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.TDF.race <- p.TDF.race + labs(title="Total Dietary fibersub")

#multiple plots
plot_grid(p.Raff.race, p.Stach.race, p.Verb.race, p.TOligos.race, labels = c("A", "B", "C", "D"), ncol = 2, align="v")
