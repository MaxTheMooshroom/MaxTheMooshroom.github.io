---
layout: post
title: Caffe Implementation with Heroku
---

Starting out with some context, I wanted to create a Flask web application that would run [Yahoo's NSFW image Predictor](https://github.com/yahoo/open_nsfw). So I did everything outlined in their tutorial and ran it. Aaannd immediately ran into a problem.
The `caffe` module refused to import. So I did some more reading. From this reading, I discovered that you need to run `apt-get install caffe-cpu`. 

There were 2 problems: 1) I'm running windows. 2) That installation wouldn't carry over to  heroku once I uploaded it. So I had to dig into how to tell heroku to get the file. Okay, cool. A tangible goal. After reading Heroku's documentation, I found that it was as simple as creating an `Aptfile` file, similar to teh `Procfile`, and just adding `caffe-cpu`. Done. Push it to Heroku, and...! Bootup failure. Still can't import the `caffe` module. Drats.

So I looked into what else is needed? Turns out you have to run something called `make` on other installation files after you download them. Well, okay. How is that done? Once again reading Heroku's great documentation, I found that you need a buildpack to do that. Unfortunately, as it turns out, Heroku doesn't have an official caffe buildpack. Drats again. So I looked online, hoping I could fenagle someone else's attempt. None exist with any real content. The only one that exists (that I could find) seems to be unfinished. 

Okay, well, I was unsure what to do. So I reached out to some peers and started asking questions. The only response I got was that an alternative was to dockerize it and use a different service. However, I'd like to finish this anyways. After all, I already have a bunch of hours invested. I know, I know... Sunk cost fallacy. But it's a good learning experience!

TO BE CONTINUED!
