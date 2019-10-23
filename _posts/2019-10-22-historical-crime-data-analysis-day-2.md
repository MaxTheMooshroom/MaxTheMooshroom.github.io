---
layout: post
title: Historical Crime Data Analysis Day 2
image: /img/crime-analysis-annual-violent-race.png
---
So after cleaning the data yesterday, I was able to figure out what each column meant. I decided to look at violent crime based on race.<br>
So I I ran feature extraction on rows where column `VTYPE` is 1, meaning violent crime.
Then I took each year's violent crimes and graphed the race that committed the most violent crimes that year and the total number of violent crimes that year.<br>
The race data was broken up across 2 columns though, and gets more complex after the split, so I had to append the 2nd column to a copy of the first one.<br>
The results are inconclusive because this only shows the top race compared to the total. Next is showing every race and adjusting to per capita percentages. <br>
![Annual Crime Rates for 1992 to 2016](/img/crime-analysis-annual-violent-race.png)

There's more to come in a bit!
