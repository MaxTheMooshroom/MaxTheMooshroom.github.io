---
layout: post
title: Historical Crime Data Analysis
image: /img/crime-analysis-annual-violent-race-final.png
---
## Day 1<br>
<br>
I spent the day cleaning up a 4,377,389-row by 152-column data frame. <br>
It had a <strong>lot</strong> of unneccesary data, and probably still does. I'll continue to work on it for now. <br>

More updates will come as I continue working. :D



## Day 2
<br>
So after cleaning the data yesterday, I was able to figure out what each column meant. I decided to look at violent crime based on race.<br>
So I I ran feature extraction on rows where column `VTYPE` is 1, meaning violent crime.
Then I took each year's violent crimes and graphed the race that committed the most violent crimes that year and the total number of violent crimes that year.<br>
The race data was broken up across 2 columns though, and gets more complex after the split, so I had to append the 2nd column to a copy of the first one.<br>
The results are inconclusive because this only shows the top race compared to the total. Next is showing every race and adjusting to per capita percentages. <br>
![Annual Crime Rates for 1992 to 2016](/img/crime-analysis-annual-violent-race.png)<br>

There's more to come in a bit!


## Day 3
<br>
I spent the day reforming the data into something useable, and got this:<br>
![Annual Crime Rates from 1992 to 2016](/img/crime-analysis-annual-violent-race-cleaned.png)


## Day 4
<br>
I did a lot of chopping. The population's racial distribution wasn't as detailed as the data I had, so I took the population for only the specific singular races. Doint it for races with miniscule populations would require guessing and It is of my preference to keep the data as accurate as possible, even if that means I have less of it as a result. So, I compared the crime experienced by those races to the total population of those races, and used that to adjust to per capita. However, the data spanned only from 2009 to 2017, so the overlapping useable data is from 2009 to 2016. <br>
![Annual Crime Rates from 1992 to 2016](/img/crime-analysis-annual-violent-race-final.png)<br><br>
When analyzing a graph of the chi squared test results of each year, you can see that the results are statistically significant every year except 2016.<br>
![chi-squared-test-results](/img/chi-squared-test-results.png)
<br>
So, we fail to reject the hypothesis that all of these races are assaulted in equal proportions.



