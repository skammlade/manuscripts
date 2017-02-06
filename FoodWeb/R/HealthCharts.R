attach(Health)
library(ggplot2)

#summary tables of each variable to obtain standard erros
SummSolvita <- summarySE(Health, 
                         measurevar="Solvita", 
                         groupvars=c("Location"))
SummOrgC <- summarySE(Health, 
                      measurevar="OrgC", 
                      groupvars=c("Location"))
SummOrgN <- summarySE(Health, 
                      measurevar="OrgN", 
                      groupvars=c("Location"))
SummHealthScore <- summarySE(Health, 
                             measurevar="HealthScore", 
                             groupvars=c("Location"))

#letters values for differences in least squares means estimates between locations
lettersSolvita <- c("a","a","a","b")
lettersOrgC <- c("a","b","b","c")
lettersOrgN <- c("a","ab","bc","c")
lettersHealthScore <- c("a","ab","bc","c")

#plots with error bars and letters showing significant differences 
# error bars help http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/#Helper functions
plotSolvita <- ggplot(SummSolvita, 
                      aes(x=Location, 
                          y=Solvita, 
                          fill=Location))
plotSolvita <- plotSolvita + geom_bar(position=position_dodge(),
                        stat="identity")
plotSolvita <- plotSolvita + geom_errorbar(aes(ymin=Solvita-se, 
                                 ymax=Solvita+se),
                             width=.2,
                             position=position_dodge(0.9))
plotSolvita <- plotSolvita + theme(axis.text.x = element_text(angle=70, 
                                                vjust=0.5))
plotSolvita <- plotSolvita + geom_text(aes(label=lettersSolvita, 
                             y=Solvita+se),
                         position=position_dodge(width=0.9), 
                         vjust=-0.25)

plotOrgC <- ggplot(SummOrgC, 
                   aes(x=Location, 
                       y=OrgC, 
                       fill=Location))
plotOrgC <- plotOrgC + geom_bar(position=position_dodge(),
                     stat="identity")
plotOrgC <- plotOrgC + geom_errorbar(aes(ymin=OrgC-se, 
                              ymax=OrgC+se),
                          width=.2,
                          position=position_dodge(0.9))
plotOrgC <- plotOrgC + theme(axis.text.x = element_text(angle=70, 
                                             vjust=0.5))
plotOrgC <- plotOrgC + geom_text(aes(label=lettersOrgC, 
                          y=OrgC+se),
                      position=position_dodge(width=0.9), 
                      vjust=-0.25)

plotOrgN <- ggplot(SummOrgN, 
                   aes(x=Location, 
                       y=OrgN, 
                       fill=Location))
plotOrgN <- plotOrgN + geom_bar(position=position_dodge(),
                     stat="identity")
plotOrgN <- plotOrgN + geom_errorbar(aes(ymin=OrgN-se, 
                              ymax=OrgN+se),
                          width=.2,
                          position=position_dodge(0.9))
plotOrgN <- plotOrgN + theme(axis.text.x = element_text(angle=70, 
                                             vjust=0.5))
plotOrgN <- plotOrgN + geom_text(aes(label=lettersOrgN, 
                          y=OrgN+se),
                      position=position_dodge(width=0.9), 
                      vjust=-0.25)

plotHealthScore <- ggplot(SummHealthScore, 
                          aes(x=Location, 
                              y=HealthScore, 
                              fill=Location))
plotHealthScore <- plotHealthScore + geom_bar(position=position_dodge(),
                            stat="identity")
plotHealthScore <- plotHealthScore + geom_errorbar(aes(ymin=HealthScore-se, 
                                     ymax=HealthScore+se),
                                 width=.2,
                                 position=position_dodge(0.9))
plotHealthScore <- plotHealthScore + theme(axis.text.x = element_text(angle=70, 
                                                    vjust=0.5))
plotHealthScore <- plotHealthScore + geom_text(aes(label=lettersHealthScore, 
                                 y=HealthScore+se),
                             position=position_dodge(width=0.9), 
                             vjust=-0.25)

#cowplot align vertically
library(cowplot)
plot_grid(plotSolvita, 
          plotOrgC, 
          plotOrgN,
          plotHealthScore, 
          labels = c("A", "B", "C", "D"), 
          ncol = 2, 
          align="h")

#plots with error bars and letters removing xlables, xtitle, and xticks
cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")
plotSolvita <- ggplot(SummSolvita, aes(x=Location, y=Solvita, fill=Location))
+ geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=Solvita-se, ymax=Solvita+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(), legend.position="none")+geom_text(aes(label=lettersSolvita, y=Solvita+se),position=position_dodge(width=0.9), vjust=-0.25)+scale_fill_manual(values=cbPalette)+ylab(expression(atop(paste('Soil respiration'), '(ppm CO'[2]*' 24h'^-1*')')))#+ylim(0,28)

#this works!! 
#+ylab(expression(atop(paste('Soil respiration\n'), '(ppm CO'[2]*' 24h'^-1*')')))

plotOrgC<-ggplot(SummOrgC, aes(x=Location, y=OrgC, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=OrgC-se, ymax=OrgC+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.ticks.x=element_blank(),axis.title.x=element_blank(),legend.position="none")+geom_text(aes(label=lettersOrgC, y=OrgC+se),position=position_dodge(width=0.9), vjust=-0.25)+labs(y="Organic carbon\n(ppm)")+scale_fill_manual(values=cbPalette)#+ylim(0,175)

plotOrgN<-ggplot(SummOrgN, aes(x=Location, y=OrgN, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=OrgN-se, ymax=OrgN+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(),axis.ticks.x=element_blank(),axis.title.x=element_blank(), legend.position="none")+geom_text(aes(label=lettersOrgN, y=OrgN+se),position=position_dodge(width=0.9), vjust=-0.25)+labs(y="Organic nitrogen\n(ppm)")+scale_fill_manual(values=cbPalette)#+ylim(0,35)

plotHealthScore<-ggplot(SummHealthScore, aes(x=Location, y=HealthScore, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=HealthScore-se, ymax=HealthScore+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.ticks.x=element_blank(),axis.title.x=element_blank(), legend.position="none")+geom_text(aes(label=lettersHealthScore, y=HealthScore+se),position=position_dodge(width=0.9), vjust=-0.25)+labs(y="Soil health score")+scale_fill_manual(values=cbPalette)#+ylim(0,8)    

fake<-ggplot(SummHealthScore, aes(x=Location, y=HealthScore, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=HealthScore-se, ymax=HealthScore+se),width=.2,position=position_dodge(0.9))+theme(axis.text.x = element_blank(), axis.ticks.x=element_blank(),axis.title.x=element_blank(), legend.position="top", legend.title=element_text(face="bold"))+geom_text(aes(label=lettersHealthScore, y=HealthScore+se),position=position_dodge(width=0.9), vjust=-0.25)+labs(y="Soil health score")+scale_fill_manual(values=cbPalette, labels=c("1-Conv  ","2-Conv  ","3-Org  ","4-Org  "))  

plot_grid(plotSolvita, plotOrgC, plotOrgN, plotHealthScore, labels = c("A", "B", "C", "D"), ncol = 1, align="v")


#plots with horizontal bars using +coord_flip() and theme(....legend.position="none")
plotSolvitaHoriz<-ggplot(SummSolvita, aes(x=Location, y=Solvita, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=Solvita-se, ymax=Solvita+se),width=.2,position=position_dodge(0.9))+theme(legend.position="left",axis.text.y = element_blank(), axis.title.y=element_blank(), axis.ticks.y=element_blank(),axis.title.x=element_text(family="Helvetica", face="bold", size=12, vjust=-.5), plot.margin=unit(c(0.5,0.5,0.5,-1.5), "cm"))+geom_text(aes(label=lettersSolvita, y=Solvita+se+1),position=position_dodge(width=0.9), vjust=.3)+coord_flip()+labs(y="Soil Respiration\n (CO2 ppm/24hr)")+scale_fill_manual(labels=c("1-Conv","2-Conv","3-Org", "4-Org"),values=c("red", "orange","yellow","green"))
plotOrgCHoriz<-ggplot(SummOrgC, aes(x=Location, y=OrgC, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=OrgC-se, ymax=OrgC+se),width=.2,position=position_dodge(0.9))+theme(axis.text.y = element_blank(), axis.title.y=element_blank(), axis.ticks.y=element_blank(),axis.title.x=element_text(family="Helvetica", face="bold", size=12, vjust=-.5),legend.position="none", plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"))+geom_text(aes(label=lettersOrgC, y=OrgC+se+10),position=position_dodge(width=0.9), vjust=0.3)+coord_flip()+labs(y="Organic Carbon\n (ppm)")
plotOrgNHoriz<-ggplot(SummOrgN, aes(x=Location, y=OrgN, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=OrgN-se, ymax=OrgN+se),width=.2,position=position_dodge(0.9))+theme(axis.text.y = element_blank(), axis.title.y=element_blank(), axis.ticks.y=element_blank(),axis.title.x=element_text(family="Helvetica", face="bold", size=12, vjust=-.5),legend.position="none", plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"))+geom_text(aes(label=lettersOrgN, y=OrgN+se+2),position=position_dodge(width=0.9), vjust=0.3)+coord_flip()+labs(y="Organic Nitrogen\n (ppm)")
plotHealthScoreHoriz<-ggplot(SummHealthScore, aes(x=Location, y=HealthScore, fill=Location))+geom_bar(position=position_dodge(),stat="identity")+geom_errorbar(aes(ymin=HealthScore-se, ymax=HealthScore+se),width=.2,position=position_dodge(0.9))+theme(legend.position="none",axis.text.y = element_blank(), axis.title.y=element_blank(), axis.ticks.y=element_blank(),axis.title.x=element_text(margin=margin(0,20,0,0),family="Helvetica", face="bold", size=12, vjust=-.5), plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"))+geom_text(aes(label=lettersHealthScore, y=HealthScore+se+0.5),position=position_dodge(width=0.9), vjust=0.3)+coord_flip()+labs(y="Soil Health Score\n")
#cowplot
plot_grid(plotSolvitaHoriz, plotOrgCHoriz, plotOrgNHoriz, plotHealthScoreHoriz, labels = c("A", "B", "C", "D"), ncol = 4, align="h")