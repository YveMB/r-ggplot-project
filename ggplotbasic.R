library("tidyverse")
## direct to data
interviews_plotting<-read_csv("data_output/interviews_plotting.csv")

##ggplot - this just tells ggplot what data we want to use
## aes - add aesthetics
## geom - adds geometry. point - scatter plot
## (alpha=0.5) - makes some points lighter 
## geom_jitter makes them move a little so they can be seen better 
ggplot(data=interviews_plotting, 
       aes(x=no_membrs, y=number_items)) +
  geom_jitter(alpha=0.5)

## could also do like this 
interview_plot +
  geom_point()


