#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber_facet.csv")

#load required packages
require(ggplot2)
require(cowplot)
require(gridExtra)

#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.oli <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                         fiber$ftype %in% c('Raff', 'Stach', 'Verb'), ]

#summary statistics of fibersub.oli
summ.df <- summarySE(fibersub.oli, measurevar="value", groupvars=c("mktclass","ftype"))

#oligosaccharides by mktclass
p.oli.mkt <- ggplot(summ.df, aes(x=ftype, y=value, colour=mktclass))

p.oli.mkt <- p.oli.mkt  + geom_line(aes(group=mktclass)) + geom_point() + geom_errorbar(aes(ymin=value-se, ymax=value+se), width=.1)

p.oli.mkt <- p.oli.mkt + theme(axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                           family="Helvetica", 
                                                           face="bold",
                                                           size=14),
                                 axis.text.y=element_text(family="Helvetica",
                                                          size=14),
                                 axis.title.x=element_blank(),
                                 legend.text=element_text(size=12), 
                                 legend.title=element_text(face="bold", 
                                                           size=12),
                                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                 legend.position=c(0.8,0.7))

#makes legend one row of text - must reference the aes
p.oli.mkt <- p.oli.mkt + guides(colour=guide_legend(ncol=1, 
                                                    title="market class"))

#change x axis lables
p.oli.mkt <- p.oli.mkt + scale_x_discrete(labels=c("Raff" = "Raffinose", 
                                                   "Stach" = "Stachyose", 
                                                   "Verb" = "Verbascose"), 
                                          expand=c(0.1,0))

p.oli.mkt <- p.oli.mkt + labs(title="Raffinose Family Oligosaccharide Pathway \n Raffinose - Stachyose - Verbascose", 
                              y="% dry wt.")

p.oli.mkt



