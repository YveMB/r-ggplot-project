library("tidyverse")
## direct to data
interviews_plotting<-read_csv("data_output/interviews_plotting.csv")

##ggplot - this just tells ggplot what data we want to use
## aes - add aesthetics
## geom - adds geometry. point - scatter plot
ggplot(data=interviews_plotting, 
       aes(x=no_membrs, y=number_items)) +
  geom_point()
  


