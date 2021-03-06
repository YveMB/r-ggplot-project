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

ggplot(data=interviews_plotting, 
       aes(x=no_membrs, y=number_items, color=village)) +
  geom_jitter(alpha=0.5, width=0.15, height=0.15, size=2)+
  geom_smooth(method="lm")

ggplot(data=interviews_plotting, 
       aes(x=rooms, y=village, color=respondent_wall_type)) +
  geom_jitter(alpha=0.5, width=0.15, height=0.15, size=2)+
  geom_smooth(method="lm")

ggplot(data=interviews_plotting, 
       aes(x=village, y=rooms)) +
         geom_jitter(aes(color=respondent_wall_type), alpha=0.5, width=0.2, height=0.2, size=3)

 ##if we want to look at the frequency of a variabe we could us a histogram
ggplot(data=interviews_plotting, aes(x=no_membrs, fill=village))+
  geom_histogram(binwidth=1, color="white")

##if we want to look at the frequency polygon
ggplot(data=interviews_plotting, aes(x=no_membrs, color=village))+
  geom_freqpoly(binwidth=1)

##if we want to look at the frequency polygon but with density 
ggplot(data=interviews_plotting, aes(x=no_membrs, y=stat(density), color=village))+
  geom_freqpoly(binwidth=1)

##if we want to look at continuos data this can help 
ggplot(data=interviews_plotting, aes(x=no_membrs, color=village))+
 geom_density()

##Looking at catagorical data
##classic plot is a bar chart 
ggplot(data=interviews_plotting, aes(x=respondent_wall_type, fill =village))+
geom_bar()
## to put them side by side 
ggplot(data=interviews_plotting, aes(x=respondent_wall_type, fill =village))+
  geom_bar(position="dodge")

## to do four individual graphs, loose the grids and change the color
ggplot(data=interviews_plotting, aes(x=village, fill=village))+
  geom_bar(position="dodge")+
  facet_wrap(~respondent_wall_type)+
  theme(panel.grid.major=element_blank(), panel.grid.minor=element_blank())+
  scale_fill_brewer(palette="RdBu")

##to make the fill 100% and be a proportion, add labels position="fill" will put top but 
## can also do - looks at wall type by village 
ggplot(data=interviews_plotting, aes(x=respondent_wall_type, fill =village))+
  geom_bar(position="fill")+
  ylab("Proportion")+
  xlab("Respondent Wall Type")+
  stat_count(geom="text", 
             aes(label=stat(count)), 
             position= position_fill (vjust=0.5), colour="white")

## can also do village by wall type
ggplot(data=interviews_plotting, aes(x=village, fill =respondent_wall_type))+
  geom_bar(position="fill")+
  ylab("Proportion")+
  xlab("Village")+
  scale_fill_brewer(palette="Accent")+
  stat_count(geom="text", 
             aes(label=stat(count)), 
             position= position_fill (vjust=0.5), colour="white")

##doing box plots - with scatter plot over top by village
ggplot(data=interviews_plotting,
       aes(x=respondent_wall_type, y=rooms))+
         geom_boxplot(alpha=0)+
  geom_jitter(alpha=0.5, width=0.2, height=0.2, 
              aes(colour=village))
  
##doing box plots - with scatter plot over top in red
ggplot(data=interviews_plotting,
       aes(x=respondent_wall_type, y=rooms))+
  geom_boxplot(alpha=0)+
  geom_jitter(alpha=0.5, width=0.2, height=0.2, colour="tomato")
 
## doing 
ggplot(data=interviews_plotting,
       aes(x=respondent_wall_type, y=liv_count))+
  geom_boxplot(alpha=0)+
  geom_jitter(alpha=0.5, width=0.2, height=0.2, 
              aes(colour=memb_assoc))

counts<-data.frame()


## doing 
ggplot(data=interviews_plotting,
       aes(x=respondent_wall_type, y=liv_count, fill=memb_assoc,
           colour=memb_assoc))+
  geom_boxplot(alpha=0.5)+
  geom_point(alpha=0.5, 
             position=position_jitterdodge(jitter.width=0.1, 
                                             jitter.height=0.1)) 
 ##violin plot  
ggplot(data = interviews_plotting, 
       aes(x=respondent_wall_type, y=rooms, colour = village))+
  geom_violin(alpha=0)+
  geom_jitter(alpha=0.5, width=0.2, height=0.2)

## can also do labs(x="village", y="proportion", title="xx")
ggplot(data = interviews_plotting,
       aes(fill=respondent_wall_type, x=village))+
  geom_bar(position=("fill"))+
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), colour="white")+
  ylab("Proportion")+
  xlab("Village")+
  labs(caption="Title should be here") + 
  theme(plot.caption = element_text(hjust=0.5, size=rel(1.2)))+
  ggtitle("Proportion of wall type by village")+
  scale_fill_discrete(label=c("Burnt brick", "Cement", "Mud Daub", "Sun Bricks"))+
  guides(fill=guide_legend(title="wall type"))

## can also do labs(x="village", y="proportion", title="xx")
ggplot(data = interviews_plotting,
       aes(fill=memb_assoc, x=respondent_wall_type))+
  geom_bar(position=("fill"))+
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), colour="white")+
  ylab("Proportion")+
  xlab("Wall type")+
  
  ## can also do labs(x="village", y="proportion", title="xx")
  ##scale_y_reverse - puts 0 at top
  ggplot(data = interviews_plotting,
         aes(fill=memb_assoc, x=respondent_wall_type))+
  geom_bar(position=("fill"))+
  stat_count(geom="text", aes(label=stat(count)),
             position=position_fill(vjust=0.5), colour="white", size=2)+
  ylab("Proportion")+
  xlab("Wall type")+
  labs(caption="Title should be here") + 
  theme(plot.caption = element_text(hjust=0.5, size=rel(1.2)))+
  ggtitle("Proportion of wall type by village")+
  scale_x_discrete(label=c("Burnt brick", "Cement", "Mud Daub", "Sun Bricks"))+
  scale_y_continuous(breaks=c(0,0.5,1))+
  guides(fill=guide_legend(title="wall type"))+
  scale_fill_discrete(label=c("No", "Yes", "No Response"))+
  labs(caption="Title should be here", size=5) + 
  theme(plot.caption = element_text(hjust=0.5))+
  ggtitle("Proportion of wall type by village")+
  guides(fill=guide_legend(title="Member\nAssociation"))+
  facet_wrap(~village, nrow=3)+
  theme(axis.text.x=element_text(angle=90, hjust=1, size=10))

## Plotting
ggplot(data = interviews_plotting,
       aes(fill=number_items, x=respondent_wall_type, y=number_items))+
  geom_col()
  
