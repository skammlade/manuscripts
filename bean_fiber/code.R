| mktclass | IDF | 
  ---------|--------
  black | `r mean(fiber.one$mktclass=="black" & fiber.one$ftype=="IDF", na.rm=TRUE)`a
black mottle | `r mean(fiber.one$mktclass=="blackmottle" & fiber.one$ftype=="IDF", na.rm=TRUE)` 
carioca | `r mean(fiber.one$mktclass=="carioca" & fiber.one$ftype=="IDF", na.rm=TRUE)` b
flor de mayo | `r mean(fiber.one$mktclass=="flordemayo" & fiber.one$ftype=="IDF", na.rm=TRUE)`
GN | `r mean(fiber.one$mktclass=="GN" & fiber.one$ftype=="IDF", na.rm=TRUE)`
navy | `r mean(fiber.one$mktclass=="navy" & fiber.one$ftype=="IDF", na.rm=TRUE)`
pink | `r mean(fiber.one$mktclass=="pink" & fiber.one$ftype=="IDF", na.rm=TRUE)`
pinto | `r mean(fiber.one$mktclass=="pinto" & fiber.one$ftype=="IDF", na.rm=TRUE)`
red mottle | `r mean(fiber.one$mktclass=="redmottle" & fiber.one$ftype=="IDF", na.rm=TRUE)`
small red | `r mean(fiber.one$mktclass=="smallred" & fiber.one$ftype=="IDF", na.rm=TRUE)`
small white | `r mean(fiber.one$mktclass=="smallwhite" & fiber.one$ftype=="IDF", na.rm=TRUE)`
tan | `r mean(fiber.one$mktclass=="tan" & fiber.one$ftype=="IDF", na.rm=TRUE)`






library(gridExtra)
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}
#store legend image from p.stach
legend <- get_legend(p.Stach.race)
#remove legend from p.stach
p.Stach.race <- p.Stach.race + theme(legend.position="none")
grid.arrange(p.Stach.race, p.TOligos.race, legend, 
             ncol=2, 
             nrow = 2, 
             layout_matrix = rbind(c(1,2), c(3,3)),
             widths = c(2.7, 2.7), heights = c(2.5, 0.2))

grid.arrange(p.Verb.race, p.Raff.race, p.Stach.race, p.TOligos.race, legend, ncol=2, nrow = 3,
             layout_matrix = rbind(c(1,2,3,4), c(5,5)),
             widths = c(2.7, 2.7), heights = c(2.5, 2.5, 0.2))

#multiple plots
plot_grid(p.Stach.race, p.TOligos.race, legend, 
          labels = c("A", "B"), ncol = 2, nrow=3, heights=c(2.5,0.5)) 
#layout_matrix = rbind(c(1,2), c(3,3)),
#widths = c(2.7, 2.7), 
#heights = c(2.5, 0.2))


library(gridExtra)
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}

legend <- get_legend(p.IDF.race)
p.IDF.race <- p.IDF.race + theme(legend.position="none")
grid.arrange(p.IDF.race, p.SDF.race, legend, 
             ncol=2, 
             nrow = 2, 
             layout_matrix = rbind(c(1,2), c(3,3)),
             widths = c(4, 4), heights = c(4.5, 0.5))