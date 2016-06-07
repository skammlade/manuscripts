##    -   ANOVA Tables

##### IDF
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(IDF~race, data=fiber)
summary(OneWayFit)
```
##### SDF
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(SDF~race, data=fiber)
summary(OneWayFit)
```
##### Raffinose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Raff~race, data=fiber)
summary(OneWayFit)
```
##### Stachyose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Stach~race, data=fiber)
summary(OneWayFit)
```
##### Verbascose
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(Verb~race, data=fiber)
summary(OneWayFit)
```
##### Total Oligosaccharides (TOligos)
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TOligos~race, data=fiber)
summary(OneWayFit)
```
##### Total Dietary Fiber (TDF)
```{r echo=FALSE, message=FALSE, warning=FALSE}
fiber<- read.csv("fiber.csv")
OneWayFit <- aov(TDF~race, data=fiber)
summary(OneWayFit)
```