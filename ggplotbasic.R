library("tidyverse")
## direct to data
interviews_plotting<-read_csv("data_output/interviews_plotting.csv")

##ggplot - this just tells ggplot what data we want to use
## could also do like this 
interview_plot +
  geom_point()

## aes - add aesthetics
## geom - adds geometry. point - scatter plot
## (alpha=0.5) - makes some points lighter 
## geom_jitter makes them move a little so they can be seen better 
## can use the width and height arguements to specify the jitter
interview_plot<- ggplot(data=interviews_plotting, 
       aes(x=no_membrs, y=number_items)) +
  geom_jitter(alpha=0.5, width=0.15, height=0.15, size=4)
ggsave("fig_output/membrs_item.png", interview_plot, width=15, height=10, 
       dpi=72)

##to see on screen and have the villages id's by colour - if you put the color 
##spec in the ggplot aes it applies to all - if you do it in jitter it only applies to the 
## geomjitter commmand
interview_plot_village<-ggplot(data=interviews_plotting, 
       aes(x=no_membrs, y=number_items, color=village)) +
  geom_jitter(alpha=0.5, width=0.15, height=0.15, size=2)+
  geom_smooth(method="lm")
ggsave("fig_output/membrs_item.png", interview_plot_village, width=15, height=10, 
       dpi=72)