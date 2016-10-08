plotData<-function() {
  
##require necessary libraries
require(tidyr)
require(ggplot2)
require(gridExtra)
  
##read the file
x=read.csv("payments.csv")

##select only the relevant columns
xSmall<-x[,c(1,6,10,11)]

##gather the data so that ggplot can plot payments and charges by color on the same plot
df<-gather(data=xSmall,Type,Dollars,Average.Covered.Charges,Average.Total.Payments,-Provider.State,-DRG.Definition)

##split by definition so we can construct graphs of each separate disease
dlist <- split(df,df$DRG.Definition)

##set up the title and theme...I'm controlling size of text a lot as otherwise there is no room for the plots
title1<-as.character(dlist[[1]]$DRG.Definition[1])
theme1<-theme(plot.title=element_text(size=5),legend.title=element_text(size=8),legend.text=element_text(size=5),axis.title.x=element_text(size=8),
              axis.title.y=element_text(size=8),axis.text=element_text(size=5))

##create the graphs for each disease
 plot1<-ggplot(dlist[[1]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 title<-as.character(dlist[[2]]$DRG.Definition[1])
 plot2<-ggplot(dlist[[2]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 title<-as.character(dlist[[3]]$DRG.Definition[1])
 plot3<-ggplot(dlist[[3]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 title<-as.character(dlist[[4]]$DRG.Definition[1])
 plot4<-ggplot(dlist[[4]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 title<-as.character(dlist[[5]]$DRG.Definition[1])
 plot5<-ggplot(dlist[[5]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 title<-as.character(dlist[[6]]$DRG.Definition[1])
 plot6<-ggplot(dlist[[6]],aes(x=Provider.State,y=Dollars,color=Type)) + geom_point() + xlab("State") + ggtitle(title1) + theme1
 
 ##print them out in one plot
 png(file="plot2-all.png")
 grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,ncol=2,nrow=3)
 dev.off()
}




