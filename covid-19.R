
```{r}

rm(list=ls()) # Removes all variables store previously 
library(Hmisc) # import

data <- read_csv("COVID19_line_list_data.csv") 
describe(data) # Hmisc command

#Cleaned up death column 
data$death_dummy <- as.integer(data$death != 0)

#Death Rate 
sum(data$death_dummy) / nrow(data)

#Age 
#Claim: People who die are older 
dead = subset(data,death_dummy == 1) 
alive = subset(data,death_dummy == 0)

mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

#is this statistically significant?
t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.99)

#normally, if p-value < 0.05, we reject null hypothesis

#here, p-value ~ 0, so we rejected the null hypothesis and conclude that this is statistically significant

#Gender 
#claim: gender has no effect 
men = subset(data, gender == "male") 
women = subset(data, gender == "female") 
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)

#is this statistically significant? 
t.test(men$death_dummy, women$death_dummy, alternative = "two.sided", conf.level = 0.99) 

#99% confidence: men have from 0.8% to 8.8% higher chance of dying.
#p-value = 0.002 < 0.05, so this is statistically significant.
```
