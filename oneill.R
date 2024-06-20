#install.packages("combinat")
library(combinat)

E <- 700
d <- c(100,200,250,350)
players <- length(d)
absolute <- rep(0, players)
turns <- 0
for(per in permn(seq(1,players))){
  estate <- E
  for (i in seq(1, players)) {
    if (estate > 0) {
      if(estate >= d[per[i]]){
        absolute[per[i]] <- absolute[per[i]] + d[per[i]]
        estate <- estate - d[per[i]]
      } else {
        absolute[per[i]] <- absolute[per[i]] + estate
        estate <- 0
      }
    } else {
      break
    }
  }
  
  turns <- turns + 1
}

result <- round(absolute / turns,0) # Increase precision if you want to reach exactly E
print(result)
print(sum(result))

