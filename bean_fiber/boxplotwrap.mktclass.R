#create grades dataset
#attach(fiber)
fiber<- read.csv("fiber_facet.csv")

#load required packages
require(ggplot2)
require(cowplot)
require(gridExtra)


#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.raff <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                         fiber$ftype %in% c('Raff'), ]

#RAFF
p.raff.mkt <- ggplot(fibersub.raff, 
                      aes(x=mktclass, y=value, fill=mktclass))

p.raff.mkt <- p.raff.mkt + facet_wrap(~race, nrow=1, scales="free_x", switch="x")

p.raff.mkt <- p.raff.mkt + geom_boxplot()

#plot theme
p.raff.mkt <- p.raff.mkt + theme(axis.text.x=element_blank(),
                                   axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                             family="Helvetica", 
                                                             face="bold",
                                                             size=14),
                                   axis.text.y=element_text(family="Helvetica",
                                                            size=14), 
                                   axis.ticks.x=element_blank(),
                                   legend.text=element_text(size=12), 
                                   plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                   legend.position="none",
                                   strip.text.x=element_text(size=12, face="bold"),
                                   panel.margin.x=unit(0.25, "lines"))

#add point at mean
p.raff.mkt <- p.raff.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#y axis title, plot title
p.raff.mkt <- p.raff.mkt+ labs(y=NULL, 
                                   x=NULL, 
                                   title="Raffinose")

#remove legend title
p.raff.mkt <- p.raff.mkt  + guides(fill=guide_legend(title=NULL))

# Get the ggplot grob
g.raff = ggplotGrob(p.raff.mkt)

# Check for the widths - you need to change the two that are set to 1null
#g.raff$widths
# The required widths are 4 and 7

# Replace the default widths with relative widths:
library(grid)
g.raff$widths[4] = unit(4, "null")
g.raff$widths[7] = unit(2, "null")


#Stach
#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.stach <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                         fiber$ftype %in% c('Stach'), ]

#Stach
p.stach.mkt <- ggplot(fibersub.stach, 
                     aes(x=mktclass, y=value, fill=mktclass))

p.stach.mkt <- p.stach.mkt + facet_wrap(~race, nrow=1, scales="free_x", switch="x")

p.stach.mkt <- p.stach.mkt + geom_boxplot()

#plot theme
p.stach.mkt <- p.stach.mkt + theme(axis.text.x=element_blank(),
                                 axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                           family="Helvetica", 
                                                           face="bold",
                                                           size=14),
                                 axis.text.y=element_text(family="Helvetica",
                                                          size=14), 
                                 axis.ticks.x=element_blank(),
                                 legend.text=element_text(size=12), 
                                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                 legend.position="none",
                                 strip.text.x=element_text(size=12, face="bold"),
                                 panel.margin.x=unit(0.25, "lines"))

#add point at mean
p.stach.mkt <- p.stach.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#y axis title, plot title
p.stach.mkt <- p.stach.mkt+ labs(y=NULL, 
                               x=NULL, 
                               title="Stachyose")

#remove legend title
p.stach.mkt <- p.stach.mkt  + guides(fill=guide_legend(title=NULL))

# Get the ggplot grob
g.stach = ggplotGrob(p.stach.mkt)

# Check for the widths - you need to change the two that are set to 1null
#g.stach$widths
# The required widths are 4 and 7

# Replace the default widths with relative widths:
library(grid)
g.stach$widths[4] = unit(4, "null")
g.stach$widths[7] = unit(2, "null")



#Verb
#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.verb <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                          fiber$ftype %in% c('Verb'), ]

#verb
p.verb.mkt <- ggplot(fibersub.verb, 
                      aes(x=mktclass, y=value, fill=mktclass))

p.verb.mkt <- p.verb.mkt + facet_wrap(~race, nrow=1, scales="free_x", switch="x")

p.verb.mkt <- p.verb.mkt + geom_boxplot()

#plot theme
p.verb.mkt <- p.verb.mkt + theme(axis.text.x=element_blank(),
                                   axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                             family="Helvetica", 
                                                             face="bold",
                                                             size=14),
                                   axis.text.y=element_text(family="Helvetica",
                                                            size=14), 
                                   axis.ticks.x=element_blank(),
                                   legend.text=element_text(size=12), 
                                   plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                   legend.position="none",
                                   strip.text.x=element_text(size=12, face="bold"),
                                   panel.margin.x=unit(0.25, "lines"))

#add point at mean
p.verb.mkt <- p.verb.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#y axis title, plot title
p.verb.mkt <- p.verb.mkt+ labs(y=NULL, 
                                 x=NULL, 
                                 title="Verbascose")

#remove legend title
p.verb.mkt <- p.verb.mkt  + guides(fill=guide_legend(title=NULL))

# Get the ggplot grob
g.verb = ggplotGrob(p.verb.mkt)

# Check for the widths - you need to change the two that are set to 1null
#g.verb$widths
# The required widths are 4 and 7

# Replace the default widths with relative widths:
library(grid)
g.verb$widths[4] = unit(4, "null")
g.verb$widths[7] = unit(2, "null")


#toligos
#subset fiber data to remove black mottle, flor de mayo, red mottle, carioca, and tan
fibersub.toligos <- fiber[fiber$mktclass %in% c('GN', 'pink', 'pinto', 'small red', 'black', 'small white') & 
                         fiber$ftype %in% c('TOligos'), ]

#total oligos
p.toligos.mkt <- ggplot(fibersub.toligos, 
                     aes(x=mktclass, y=value, fill=mktclass))

p.toligos.mkt <- p.toligos.mkt + facet_wrap(~race, nrow=1, scales="free_x", switch="x")

p.toligos.mkt <- p.toligos.mkt + geom_boxplot()

#plot theme
p.toligos.mkt <- p.toligos.mkt + theme(axis.text.x=element_blank(),
                                 axis.title.y=element_text(margin=margin(0,17,0,0), 
                                                           family="Helvetica", 
                                                           face="bold",
                                                           size=14),
                                 axis.text.y=element_text(family="Helvetica",
                                                          size=14), 
                                 axis.ticks.x=element_blank(),
                                 legend.text=element_text(size=10), 
                                 legend.position="none",
                                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
                                 strip.text.x=element_text(size=12, face="bold"),
                                 panel.margin.x=unit(0.25, "lines"))


#add point at mean
p.toligos.mkt <- p.toligos.mkt + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 2, fill= "white")

#y axis title, plot title
p.toligos.mkt <- p.toligos.mkt+ labs(y=NULL, 
                               x=NULL, 
                               title="Total Oligosaccharides")

#remove legend title
p.toligos.mkt <- p.toligos.mkt  + guides(fill=guide_legend(title="marketclass"))

#save legend as a grob
#legend <- get_legend(p.toligos.mkt)

#remove legend from p.toligos
p.toligos.mkt <- p.toligos.mkt + theme(legend.position="none")

# Get the ggplot grob
g.toligos = ggplotGrob(p.toligos.mkt)

# Check for the widths - you need to change the two that are set to 1null
#g.toligos$widths
# The required widths are 4 and 7

# Replace the default widths with relative widths:
library(grid)
g.toligos$widths[4] = unit(4, "null")
g.toligos$widths[7] = unit(2, "null")


grid.arrange(g.raff, g.stach, g.verb, g.toligos, ncol=2, nrow = 2, 
             layout_matrix = rbind(c(1,2),c(3,4)), heights = c(2.5, 2.5))


