library("tidyverse")
library("palmerpenguins")
select(penguins,-species,-bill_length_mm,-body_mass_g)
filter(penguins,species=="Gentoo")
penguins %>% 
filter(species=="Gentoo")  %>%  #行逻辑索引
select(species,bill_length_mm,body_mass_g)  #列选取
penguins %>% 
mutate(flipper_bill_ratio = flipper_length_mm/bill_length_mm) %>% 
select(species,bill_length_mm,flipper_length_mm,flipper_bill_ratio)
penguins %>% 
mutate(flipper_bill_ratio = flipper_length_mm/bill_length_mm) %>% 
select(species,bill_length_mm,flipper_length_mm,flipper_bill_ratio)  %>% 
rename(f_over_b=flipper_bill_ratio)  %>% 
arrange(desc(bill_length_mm))
penguins  %>% 
summarize(num_rows=n(),avg_weight_kg=mean(body_mass_g/1000,na.rm=TRUE),avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm,na.rm=TRUE))
penguins  %>% 
group_by(species) %>% 
summarize(num_rows=n(),avg_weight_kg=mean(body_mass_g/1000,na.rm=TRUE),avg_flipper_bill_ratio=mean(flipper_length_mm/bill_length_mm,na.rm=TRUE))
penguins  %>% 
summarize(across(everything(),~sum(is.na(.x))))
penguins  %>% 
summarize(across(where(is.numeric),~mean(.x,na.rm=TRUE)))
penguin_bill_lengths_df <- penguins %>% 
arrange(desc(bill_length_mm)) %>% 
select(species,bill_length_mm)
species  <- unique(penguins$species)
latin_name <- c("Pygoscelis ade","Pygo papua","Pygo anta")
latin_names_df <- data.frame(species,latin_name)
penguin_bill_lengths_df %>% 
inner_join(latin_names_df)
