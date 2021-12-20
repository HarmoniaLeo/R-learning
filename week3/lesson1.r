library("tidyverse")
is_div_2_3 <- function(x){
    if(x%%2==0){
        return(TRUE)
    }else if(x%%3==0){
        return(TRUE)
    }else{
        return(FALSE)
    }
}
v <- c(1,2,3,4,5)
map(v,is_div_2_3)
example_f <- function(x){
    if(is_div_2_3(x)){
        return(x)
    }else{
        return(0)
    }
}
map_dbl(v,example_f)
library(english)
example_f_eng <- function(x){as.character(as.english(example_f(x)))}
max_cor_val <- function(df,col_name){
    v_col <- select(df,all_of(col_name))
    df_num <- df %>% 
    select_if(is.numeric) %>% 
    select(-all_of(col_name))
    correlations <- unlist(map(df_num,function(x){cor(x,v_col,use="complete.obs")}))
    max_abs_cor_var <- names(which(abs(correlations)==max(abs(correlations))))
    cor <- as.double(correlations[max_abs_cor_var])
    return(data.frame(var_name=max_abs_cor_var,cor=cor))
}
penguins %>% 
group_by(species) %>% 
nest() %>% 
mutate(max_cor=map(data,~max_cor_val(.x,"body_mass_g"))) %>% 
select(-data) %>% 
unnest(cols=max_cor)
impute_by_mean <- function(x){
    mu <- mean(x,na.rm=1)
    impute_f <- function(z){
        if(is.na(z)){
            return(mu)
        }else{
            return(z)
        }
    }
    return(map_dbl(x,impute_f))
}
x <- c(1,2,NA,4)
impute_by_mean((x))
