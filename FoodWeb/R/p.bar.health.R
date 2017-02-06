attach(Health)
library(ggplot2)
library(cowplot)
library(gridExtra)

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

#palette for colorblind and black and white viewing
cbPalette<-c("#a1dab4", "#41b6c4", "#2c7fb8","#253494")

#solvita plot
p.Solvita <- ggplot(SummSolvita, 
                      aes(x=Location, 
                          y=Solvita, 
                          fill=Location))
p.Solvita <- p.Solvita + geom_bar(position=position_dodge(),
                                      stat="identity")
p.Solvita <- p.Solvita + geom_errorbar(aes(ymin=Solvita-se, 
                                               ymax=Solvita+se),
                                           width=.2,
                                           position=position_dodge(0.9))
p.Solvita <- p.Solvita + theme(axis.text.x = element_blank(), 
                                   axis.title.x=element_blank(), 
                                   axis.ticks.x=element_blank(), 
                                   legend.position="none",
                               axis.text.y = element_text(size=20,
                                                          family="Helvetica"),
                               axis.title.y = element_text(size=25, 
                                                           family="Helvetica"))
p.Solvita <- p.Solvita + geom_text(aes(label=lettersSolvita, 
                                           y=Solvita+se),
                                       position=position_dodge(width=0.9), 
                                       vjust=-0.25)
p.Solvita <- p.Solvita + scale_fill_manual(values=cbPalette)
p.Solvita <- p.Solvita + ylab(expression(atop(paste('Soil respiration'), '(ppm CO'[2]*' 24h'^-1*')')))
p.Solvita <- p.Solvita + scale_y_continuous(expand = c(0, 0),limits= c(0,28)) 

#organic carbon plot
p.OrgC <- ggplot(SummOrgC, 
                   aes(x=Location, 
                       y=OrgC, 
                       fill=Location))
p.OrgC <- p.OrgC + geom_bar(position=position_dodge(), 
                                stat="identity") 
p.OrgC <- p.OrgC + geom_errorbar(aes(ymin=OrgC-se, 
                                         ymax=OrgC+se),
                                     width=.2,
                                     position=position_dodge(0.9))
p.OrgC <- p.OrgC + theme(axis.text.x = element_blank(), 
                             axis.ticks.x=element_blank(),
                             axis.title.x=element_blank(),
                             legend.position="none",
                         axis.text.y = element_text(size=20, family="Helvetica"),
                         axis.title.y = element_text(size=25, 
                                                     family="Helvetica"))
p.OrgC <- p.OrgC + geom_text(aes(label=lettersOrgC, 
                                     y=OrgC+se),
                                 position=position_dodge(width=0.9), 
                                 vjust=-0.25)
p.OrgC <- p.OrgC + labs(y="Organic carbon\n(ppm)")
p.OrgC <- p.OrgC + scale_fill_manual(values=cbPalette) 
p.OrgC <- p.OrgC + scale_y_continuous(expand = c(0, 0),limits= c(0,175)) 

#organic nitrogen plot
p.OrgN <- ggplot(SummOrgN, 
                   aes(x=Location, 
                       y=OrgN, 
                       fill=Location))
p.OrgN <- p.OrgN + geom_bar(position=position_dodge(),
                                stat="identity")
p.OrgN <- p.OrgN + geom_errorbar(aes(ymin=OrgN-se, 
                                         ymax=OrgN+se),
                                     width=.2,
                                     position=position_dodge(0.9))
p.OrgN <- p.OrgN + theme(axis.text.x = element_blank(),
                             axis.ticks.x=element_blank(),
                             axis.title.x=element_blank(), 
                             legend.position="none",
                         axis.text.y = element_text(size=20, family="Helvetica"),
                         axis.title.y = element_text(size=25, 
                                                     family="Helvetica"))
p.OrgN <- p.OrgN + geom_text(aes(label=lettersOrgN, 
                                     y=OrgN+se),
                                 position=position_dodge(width=0.9), 
                                 vjust=-0.25)
p.OrgN <- p.OrgN + labs(y="Organic nitrogen\n(ppm)")
p.OrgN <- p.OrgN + scale_fill_manual(values=cbPalette)
p.OrgN <- p.OrgN + scale_y_continuous(expand = c(0, 0),limits= c(0,35))    

#health score plot
p.Score <- ggplot(SummHealthScore, 
                          aes(x=Location, 
                              y=HealthScore, 
                              fill=Location))
p.Score <- p.Score + geom_bar(position=position_dodge(),
                                              stat="identity")
p.Score <- p.Score + geom_errorbar(aes(ymin=HealthScore-se, 
                                                       ymax=HealthScore+se),
                                                   width=.2,
                                                   position=position_dodge(0.9))
p.Score <- p.Score + theme(axis.text.x = element_blank(), 
                                           axis.ticks.x=element_blank(),
                                           axis.title.x=element_blank(),
                           legend.position="bottom",
                           axis.text.y = element_text(size=20, family="Helvetica"),
                           axis.title.y = element_text(size=25, 
                                                       family="Helvetica"))
p.Score <- p.Score + geom_text(aes(label=lettersHealthScore, 
                                                   y=HealthScore+se),
                                               position=position_dodge(width=0.9), 
                                               vjust=-0.25)
p.Score <- p.Score + labs(y="Soil health score")
p.Score <- p.Score + scale_fill_manual(values=cbPalette)
p.Score <- p.Score + scale_y_continuous(expand = c(0, 0),limits= c(0,8))    

legend <- get_legend(p.Score)

p.Score <- p.Score + theme(legend.position="none")

p1 <- ggplotGrob(p.Solvita)
p2 <- ggplotGrob(p.OrgC)
p3 <- ggplotGrob(p.OrgN)
p4 <- ggplotGrob(p.Score)

grid::grid.newpage()
grid::grid.draw(rbind(p1, p2, p3, p4, ncol=2, nrow = 2, 
                      layout_matrix = rbind(c(1,2),c(3,4), heights = c(2.5, 2.5, 0.5))))

maxWidth = grid::unit.pmax(p.Solvita$widths[2:3], p.OrgC$widths[2:3], p.OrgN$widths[2:3], p.Score$widths[2:3])

p1$widths[2:3] <- as.list(maxWidth)
p2$widths[2:3] <- as.list(maxWidth)
p3$widths[2:3] <- as.list(maxWidth)
p4$widths[2:3] <- as.list(maxWidth)

grid.arrange(p1, p2, p3, p4, legend, ncol=2, nrow = 3, 
             layout_matrix = rbind(c(1,2),c(3,4), c(5,5)), heights = c(2.5, 2.5, 0.5))

grid.arrange(p.Solvita, p.OrgC, p.OrgN, p.Score, legend, ncol=2, nrow = 3, 
             layout_matrix = rbind(c(1,2),c(3,4), c(5,5)), heights = c(2.5, 2.5, 0.5))

grid.arrange(p.Solvita, p.OrgC, p.OrgN, p.Score, legend, ncol=4, nrow = 2, 
             layout_matrix = rbind(c(1,2,3,4), c(5,5)), heights = c(2.5, 0.5))

library(cowplot)
plot_grid(p.Solvita, p.OrgC, p.OrgN, p.Score, 
          labels = c("A", "B", "C", "D"), align = "hv")

plot_grid(p.Solvita, p.OrgC, p.OrgN, p.Score, labels = c("A", "B", "C", "D"), ncol = 2, nrow=3, layout_matrix=rbind(c(1,2,3,4),c(5,5)), widths=c(2.7,2.7), heights=c(2.7,1))