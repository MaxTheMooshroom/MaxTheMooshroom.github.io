
# Multifactoral Meal-Planner (WIP) (Pre-release)

I'm working on a food research project where I compile [food and nutrition data from the USDA](https://fdc.nal.usda.gov/download-datasets.html), as well as some recipe databases, to create a web app that performs the following functions:

- The user provides their current weight and target weight and the app will provide them with safe instructions on how to meet that goal. (eg gain 1 pound per week, lose 2 pounds per week, etc.)

- The app allows you to do meticulous meal planning that optimizes against parameters such as ingredient overlap (different meals having the same dry ingredients) so they can be prepped all at the same time at the start of the month, cook time (the time it takes to make a meal, even with pre-prepped mixtures), and how many days worth of food you make at a time (which saves you cook time if you do a large batch rather than several small batches each day)

- The user can provide food expense budgets, dietary restrictions, and health conditions. The app will come up with a list of suggestions based on existing scheduling the user previously configured. This is done by cross-referencing several databases with one another to find suitable matches meeting all requirements.


The current implementation is written in [Django](https://www.djangoproject.com/), a Python framework, however in the future I want to change it out for a [Flutter](https://flutter.dev/) app, so as to be more accessible.
