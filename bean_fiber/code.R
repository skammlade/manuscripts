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


fiber<- read.csv("fiber.csv")
ftypeSummary <- apply(fiber[, 7:14], 2, function(x) tapply(x, fiber$race, summary))
ftypeSummary <- lapply(ftypeSummary, do.call, what = rbind)
ftypeSummary

fiber.one<- read.csv("fiber_facet.csv")
ftypeSummary <- apply(fiber.one[, 8, drop=FALSE], 2, function(x) tapply(x, fiber.one$ftype, summary))
ftypeSummary <- lapply(ftypeSummary, do.call, what = rbind)
ftypeSummary

library(xtable)
fiber<- read.csv("fiber.csv")
options(xtable.caption.placement = 'bottom', # notice \floatsetup overrides
        xtable.include.rownames = FALSE,
        xtable.comment = FALSE,
        xtable.booktabs = TRUE)

xtable(
  data.frame(
    Race = c(Durango, Jalisco, Mesoamerican), 
    Entries = c((sum(fiber$race=="durango", na.rm=TRUE)/2), (sum(fiber$race=="jalisco", na.rm=TRUE)/2), (sum(fiber$race=="mesoamerican", na.rm=TRUE)/2`))), 
  caption='caption')


## Summary Statistics

```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber.one<- read.csv("fiber_facet.csv")
ftypeSummary <- apply(fiber.one[, 8, drop=FALSE], 2, function(x) tapply(x, fiber.one$ftype, summary))
ftypeSummary <- lapply(ftypeSummary, do.call, what = rbind)
library(knitr)
kable(ftypeSummary, caption="Summary statistics for fiber types across all entries.")
```

| Race | # Entries |
  -------|----------
  Durango | `r sum(fiber$race=="durango", na.rm=TRUE)/2`
Jalisco | `r sum(fiber$race=="jalisco", na.rm=TRUE)/2`
Mesoamerican | `r sum(fiber$race=="mesoamerican", na.rm=TRUE)/2`

Table: Number of entries representing each race.

| Market Class | # Entries |
  ------------ | ----------
  pinto | `r sum(fiber$mktclass=="pinto", na.rm=TRUE)/2`
navy | `r sum(fiber$mktclass=="navy", na.rm=TRUE)/2`
black | `r sum(fiber$mktclass=="black", na.rm=TRUE)/2`
GN | `r sum(fiber$mktclass=="GN", na.rm=TRUE)/2`
small red | `r sum(fiber$mktclass=="small red", na.rm=TRUE)/2`
pink | `r sum(fiber$mktclass=="pink", na.rm=TRUE)/2`
carioca | `r sum(fiber$mktclass=="carioca", na.rm=TRUE)/2`
tan | `r sum(fiber$mktclass=="tan", na.rm=TRUE)/2`
black mottle | `r sum(fiber$mktclass=="black mottle", na.rm=TRUE)/2`
flor de mayo | `r sum(fiber$mktclass=="flor de mayo", na.rm=TRUE)/2`
red mottle | `r sum(fiber$mktclass=="red mottle", na.rm=TRUE)/2`
small white | `r sum(fiber$mktclass=="small white", na.rm=TRUE)/2`

Table: Number of entries representing each market class.


```{r fig.width = 8, fig.height=8, fig.align='center', echo=FALSE, message=FALSE, warning=FALSE, fig.cap="Histograms of unique fiber components."}
source('plot.hist.R')
library(Rmisc)
plot_grid(p.hist.IDF, p.hist.SDF, p.hist.Verb, p.hist.Raff, p.hist.Stach, labels = c("A", "B", "C", "D", "E", "F"), ncol = 2)
```
