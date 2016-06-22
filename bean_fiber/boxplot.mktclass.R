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
p.IDF.mkt <- ggplot(fibersub, 
                        aes(x=mktclass, y=IDF, fill=mktclass))

p.IDF.mkt <- p.IDF.mkt + geom_boxplot()

p.IDF.mkt <- p.IDF.mkt + theme(legend.position="none",
                               plot.title = element_text(size=15),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=12),
                               axis.title.y = element_blank())

#add point at mean
p.IDF.mkt <- p.IDF.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.IDF.mkt <- p.IDF.mkt + labs(title="Insoluble DF")



#SOLUBLE dietary fibersub
p.SDF.mkt <- ggplot(fibersub, 
                    aes(x=mktclass, y=SDF, fill=mktclass))

p.SDF.mkt <- p.SDF.mkt + geom_boxplot()

p.SDF.mkt <- p.SDF.mkt + theme(legend.position="none",
                               plot.title = element_text(size=15),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=12),
                               axis.title.y = element_blank())

#add point at mean
p.SDF.mkt <- p.SDF.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.SDF.mkt <- p.SDF.mkt + labs(title="Soluble DF")




#RAFF
p.Raff.mkt <- ggplot(fibersub, 
                    aes(x=mktclass, y=Raff, fill=mktclass))

p.Raff.mkt <- p.Raff.mkt + geom_boxplot()

p.Raff.mkt <- p.Raff.mkt + theme(legend.position="none",
                                 plot.title = element_text(size=15),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=60, hjust=1, 
                                                            vjust=1, 
                                                            size=12),
                                 axis.title.y = element_blank())

#add point at mean
p.Raff.mkt <- p.Raff.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Raff.mkt <- p.Raff.mkt + labs(title="Raffinose")





#STACH
p.Stach.mkt <- ggplot(fibersub, 
                    aes(x=mktclass, y=Stach, fill=mktclass))

p.Stach.mkt <- p.Stach.mkt + geom_boxplot()

p.Stach.mkt <- p.Stach.mkt + theme(legend.position="none",
                                   plot.title = element_text(size=15),
                                   axis.title.x = element_blank(),
                                   axis.text.x = element_text(angle=60, hjust=1, 
                                                              vjust=1, 
                                                              size=12),
                                   axis.title.y = element_blank())

#add point at mean
p.Stach.mkt <- p.Stach.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Stach.mkt <- p.Stach.mkt + labs(title="Stachyose")



#VERB
p.Verb.mkt <- ggplot(fibersub, 
                      aes(x=mktclass, y=Verb, fill=mktclass))

p.Verb.mkt <- p.Verb.mkt + geom_boxplot()

p.Verb.mkt <- p.Verb.mkt + theme(legend.position="none",
                                 plot.title = element_text(size=15),
                                 axis.title.x = element_blank(),
                                 axis.text.x = element_text(angle=60, hjust=1, 
                                                            vjust=1, 
                                                            size=12),
                                 axis.title.y = element_blank())

#add point at mean
p.Verb.mkt <- p.Verb.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.Verb.mkt <- p.Verb.mkt + labs(title="Verbascose")



#total oligos
p.TOligos.mkt <- ggplot(fibersub, 
                        aes(x=mktclass, y=TOligos, fill=mktclass))

p.TOligos.mkt <- p.TOligos.mkt + geom_boxplot()

p.TOligos.mkt <- p.TOligos.mkt + theme(legend.position="none",
                                       plot.title = element_text(size=15),
                                       axis.title.x = element_blank(),
                                       axis.text.x = element_text(angle=60, hjust=1, 
                                                                  vjust=1, 
                                                                  size=12),
                                       axis.title.y = element_blank())

#add point at mean
p.TOligos.mkt <- p.TOligos.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.TOligos.mkt <- p.TOligos.mkt + labs(title="Total Oligosaccharides")




#total dietary fibersub
p.TDF.mkt <- ggplot(fibersub, 
            aes(x=mktclass, y=TDF, fill=mktclass))

p.TDF.mkt <- p.TDF.mkt + geom_boxplot()

p.TDF.mkt <- p.TDF.mkt + theme(legend.position="none",
                               plot.title = element_text(size=15),
                               axis.title.x = element_blank(),
                               axis.text.x = element_text(angle=60, hjust=1, 
                                                          vjust=1, 
                                                          size=12),
                               axis.title.y = element_blank())

#add point at mean
p.TDF.mkt <- p.TDF.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#labels
p.TDF.mkt <- p.TDF.mkt + labs(title="Total Dietary fibersub")

#multiple plots
plot_grid(p.Raff.mkt, p.Stach.mkt, p.Verb.mkt, p.TOligos.mkt, labels = c("A", "B", "C", "D"), ncol = 2)
