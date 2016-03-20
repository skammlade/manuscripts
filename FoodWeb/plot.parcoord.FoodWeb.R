#load required packages
require(ggplot2)
require(GGally)

#create mean dataset for each foodweb constituent
LocBact <- summarySE(FoodWeb, 
                   measurevar="TotalBact", 
                   groupvars=c("Location"))
LocFung <- summarySE(FoodWeb, 
                   measurevar="TotalFung", 
                   groupvars=c("Location"))
LocAmo <- summarySE(FoodWeb, 
                  measurevar="Amoeba", 
                  groupvars=c("Location"))
LocCil <- summarySE(FoodWeb, 
                  measurevar="Ciliates", 
                  groupvars=c("Location"))
LocFlag <- summarySE(FoodWeb,
                   measurevar="Flagellates", 
                   groupvars=c("Location"))
LocNem <- summarySE(FoodWeb, 
                  measurevar="Nematode", 
                  groupvars=c("Location"))

#load datasets
LocCol <- LocBact[,c(1)]
LocBactCol <- round(LocBact[,c(3)],0)
LocFungCol <- round(LocFung[,c(3)],0)
LocAmoCol <- round(LocAmo[,c(3)],0)
LocCilCol <- round(LocCil[,c(3)],0)
LocFlagCol <- round(LocFlag[,c(3)],0)
LocNemCol <- round(LocNem[,c(3)],1)

#normalize to maximum
NormBact <- (LocBactCol/max(LocBactCol))
NormFung <- (LocFungCol/max(LocFungCol))
NormAmo <- (LocAmoCol/max(LocAmoCol))
NormCil <- (LocCilCol/max(LocCilCol))
NormFlag <- (LocFlagCol/max(LocFlagCol))
NormNem <- (LocNemCol/max(LocNemCol))

df<- data.frame(Location=LocCol, Bacteria=NormBact, Fungi=NormFung, Flagellates=NormFlag,       Amoebae=NormAmo, Ciliates=NormCil, Nematodes=NormNem)

#parallel coordinate plot
p <- ggparcoord(data=df, 
           #which columns to use in plot
           columns = 2:7, 
           #column to use for coloring data
           groupColumn = 1,
           #scale
           scale="globalminmax")
         
#basic theme
p <- p + theme_minimal()

# Decrease amount of margin around x, y values
p <- p + scale_y_continuous(breaks=c(0,1),expand = c(0.05, 0.01))
p <- p + scale_x_discrete(expand = c(0.05, 0.05))

#theme adjustments
p <- p + theme(axis.ticks = element_blank(),
               axis.title = element_blank(),
               axis.text.y = element_text(hjust=10, size=12),
               axis.text.x = element_text(size=12),
               #clear axis lines
               panel.grid.minor = element_blank(),
               panel.grid.major.y = element_blank(),
               #darken vertical lines
               panel.grid.major.x = element_line(color = "#aaaaaa"),
               #adjust legend
               legend.position = "bottom",
               legend.title=element_text(family="Helvetica", size=10, face="bold"),
               legend.text = element_text(size=10))

#increase line width
p <- p + geom_line(size=1.8)

#colorblined palette line color
cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")
p <- p + scale_color_manual(values=cbPalette)

print(p)
