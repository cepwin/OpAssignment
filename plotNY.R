plotNY<-function() {
  ##require necessary libraries
  require(ggplot2)
  
  ##read the file
  x=read.csv("payments.csv")
  
  ##get only the necessary columns
  xSmall<-x[(x$Provider.State=="NY"),c(1,6,10,11)]

##set up the title and theme
title1<-"New York Covered Cost vs Payments"
##limiting the size of the legend as disease names are long
theme1<-theme(legend.text=element_text(size=3))

##create the plot...using logs as it allows for a clearer plot
plot1<-ggplot(xSmall,aes(x=log(Average.Total.Payments),y=log(Average.Covered.Charges),color=DRG.Definition)) + 
  geom_point(alpha=0.3) + xlab("Average Total Payments(log)") + ylab("Average Covered Charges (log)") + ggtitle(title1) + theme1

#print out the plot
png(file="plot1-ny.png")
print(plot1)
dev.off()

}