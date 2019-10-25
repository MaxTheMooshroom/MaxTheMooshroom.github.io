---
layout: post
title: Historical Crime Data Analysis
image: /img/crime-analysis-annual-violent-race-final.png
---
## Day 1<br>
<br>
I've started an adventure to find the race, if any, highest at risk of being the victim of a violent crime.
In this pursuit, I've located a data table with reported crimes from 1992 to 2016. <br>

I spent the day cleaning up the 4,377,389-row by 152-column table. <br>
It had a <strong>lot</strong> of unneccesary data, and probably still does. I'll continue to work on it for now. <br>

More updates will come as I continue working. :D



## Day 2
<br>
So after cleaning the data yesterday, I was able to figure out what each column meant. I decided to look at violent crime based on race.<br>
So I ran feature extraction on rows where column `VTYPE` is 1, meaning violent crime.
Then I took each year's violent crimes and graphed the race that had the most victims of violent crimes that year and the total number of violent crimes that year.<br>
The race data was broken up across 2 columns though, and gets more complex after the split, so I had to append the 2nd column to a copy of the first one.<br>
The results are inconclusive because this only shows the top race compared to the total. Next is showing every race and adjusting to per capita percentages. <br><br>
![Annual Crime Rates for 1992 to 2016](/img/crime-analysis-annual-violent-race.png)<br>
__*Source: National Crime Victimization Survey*__<br><br>
There's more to come in a bit!


## Day 3
<br>
I spent the day reforming the data into something useable, and got this:<br><br>
![Annual Crime Rates from 1992 to 2016](/img/crime-analysis-annual-violent-race-cleaned.png)<br>
__*Source: National Crime Victimization Survey*__<br><br>


## Day 4
<br>
I did a lot of chopping. The population's racial distribution wasn't as detailed as the data I had, so I took the population for only the specific singular races in both sets. Doing it for races with relatively miniscule populations would require guessing and I want to keep the data as accurate as possible, even if that means I have less of it as a result. So, I compared the crime experienced by those races to the total population of those races and used that to adjust to per capita, using US Census data. However, the data spanned only from 2009 to 2017, so the overlapping useable data is from 2009 to 2016. <br><br>
![Annual Crime Rates from 1992 to 2016](/img/crime-analysis-annual-violent-race-final.png)<br>
__*Source: National Crime Victimization Survey*__<br><br>
After that, we run each year's samples through a chi-squared test. If a year's result is more than 0.95, that means that the data from that year is outside of what you'd expect through random variation and can be considered to be biased. When you graph the data, as seen below, you can see that the results for each year are biased except 2016.<br>
![chi-squared-test-results](/img/chi-squared-test-results.png)
<br>
So, we reject the hypothesis that all of these races are assaulted in equal proportions.

[My work!](https://colab.research.google.com/drive/1eJNNqO0pN2wxLq6e9DAFTczW5Pbdjj_i)<br>
[National Crime Victimization Survey](https://www.icpsr.umich.edu/icpsrweb/NACJD/studies/36834/summary)<br>
[Census Data](https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_B02001)



