library(readr)
library(tidyverse)
library(ggplot2)
library(wesanderson)
comp<-read_csv("//cdc.gov/project/CCID_NCIRD_DVD_PPLB/_PMDDL/Chelsea/method comparison/kingfisher duo/duo_flex_results080620.csv", 
               col_types = cols(sample = col_character(),
                 CUID = col_character()))

#used this one
comp %>% 
  ggplot() +
  aes(x = method, y = result, fill = discordant)+
  geom_tile(size = 1L, color = "grey") + 
  scale_color_manual(values = wes_palette(n = 2, name = "Royal1"))+ 
  scale_fill_manual(values = wes_palette(n = 2, name = "Royal1")) + 
  facet_wrap(~sample, ncol = 4) + 
  labs(x = "Method", y = "Result", fill = "Disordant \nResult") + 
  theme_bw() +
  theme(strip.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.line = element_line(colour = "grey"), 
        panel.border = element_rect(color = "grey")) 
ggsave("KF_comp_results080620.png", height = 4, width = 5, units = "in")  
    

comp %>% 
  ggplot() +
  aes(x = result, y = method, fill = method)+
  geom_tile(size = 1L, color = "grey") + 
  scale_color_manual(values = wes_palette(n = 2, name = "Royal1"))+ 
  scale_fill_manual(values = wes_palette(n = 2, name = "Royal1")) + 
  facet_wrap(~sample, ncol = 1) + 
  labs(x = "Method", y = "Result", fill = "Disordant Result") + 
  theme_bw() +
  theme(strip.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.line = element_line(colour = "grey"), 
        panel.border = element_rect(color = "grey")) 


