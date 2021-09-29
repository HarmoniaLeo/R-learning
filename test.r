a <- seq(5,2)

demo_func_1 <- function(x){
    x[2] <- -10
    print(x)
}
print(a)
demo_func_1(a