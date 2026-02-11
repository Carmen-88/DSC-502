#1. Run the following lines and study how they work. Then state what they do and output for us. 
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
head(df1)

#The Name, State and Sales lines are adding 3 columns and the data for each to the data frame.

aggregate(df1$Sales, by=list(df1$State), FUN=sum)

#The aggregate line is creating a sum function to add all the sales of each state.


install.packages("dplyr")
library(dplyr)
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

#This line groups the data by state and adds the sales together for each. It also titles each column.


#2. Use R to read the WorldCupMatches.csv from the DATA folder on Google Drive. Then perform the following:

WorldCup = read.csv('G:/My Drive/WorldCupMatches.csv', header=T)
head(WorldCup)

#a. Find the size of the data frame. How many rows, how many columns?

nrow(WorldCup)
#There are 852 rows.

ncol(WorldCup)
#There are 20 columns.


#b. Use summary function to report the statistical summary of your data.

summary(WorldCup)


#c. Find how many unique locations olympics were held at.

unique(WorldCup$City)
#There are 151 unique cities.


#d. Find the average attendance.

mean(WorldCup$Attendance, na.rm=T)
#The average attendance is 45164.8


#e. For each Home Team, what is the total number of goals scored? (Hint: Please refer to question 1)

aggregate(WorldCup$Home.Team.Goals, by=list(WorldCup$Home.Team.Name), FUN=sum)


#f. What is the average number of attendees for each year? Is there a trend or pattern in the data in that sense?

aggregate(WorldCup$Attendance, na.rm=T, by=list(WorldCup$Year), FUN=mean)

#There does not seem to be a trend or pattern in the average attendance as it fluctuates up and down but the average 
#attendance in 2014 is higher than it was in 1930.



#3. Use R to read the metabolites.csv from the DATA folder on Google Drive. Then perform the following:

Metabolite = read.csv('G:/My Drive/metabolite.csv', header=T)
head(Metabolite)


#a. Find how many Alzheimers patients there are in the data set. (Hint: Please refer to question 1)


library(dplyr)
Metabolite %>% summarise(Alzheimer_count = sum(Label == 'Alzheimer', na.rm=T))
#There are 35 Alzheimer's patients in the data set.


#b. Determine the number of missing values for each column. (Hint: is.na( ) )

colSums(is.na(Metabolite))


#c. Remove the rows which has missing value for the Dopamine column and assign the result to a new data frame.
#(Hint: is.na( ) )

Metabolite2 = Metabolite[is.na(Metabolite['Dopamine'])==F, ]
head(Metabolite2)


#d. In the new data frame, replace the missing values in the c4-OH-Pro column with the median value of the same
#column. (Hint: there is median( ) function.)

c4_median = median(Metabolite2$c4.OH.Pro, na.rm=T)
print(c4_median)
Metabolite2$c4.OH.Pro[is.na(Metabolite2$c4.OH.Pro)] = c4_median
head(Metabolite2)


#e. (Optional) Drop columns which have more than 25% missing values. (Hint: when you slice your data frame, you
#can use -c(.., ..., ...) where ... represent one column name)

Metabolite3 = Metabolite[colMeans(is.na(Metabolite)) < 0.25]
head(Metabolite3)







