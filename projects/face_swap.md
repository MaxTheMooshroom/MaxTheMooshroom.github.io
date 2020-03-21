---
title: Gender Face Swap
show-icon: false
---

My idea is to create a pipeline of Neural Networks (NNs) for the sole purpose of converting an input image of someone's face into a face of the opposite sex.

### Auto Encoders
The core of the pipeline would be a pair of Auto Encoders (AEs), one for each sex. An AE is a neural network structure that drastically reduces the number of neurons in the central layer and then tries to reconstruct the input data, as shown here:

<img src="https://www.compthree.com/images/blog/ae/ae.png" width="500" />

I propose the following steps:

step 1:
train the AEs to do what they're supposed to. Compare output to input for initial training.

Step 2:
Plug the outputs of the AEs into a GAN. Take real inputs, tweak the values in the latent space layer derived from the inputs,
and classify the results as "real" or "fake" with a discriminator network. 

Step 3:
train a classifier for classifying images as male or female. Feed a male image into the female AR, and vice versa.


Step 4:
Use the starting classifier on the output images to see if they successfully converted

The final pipeline will look like this:
![AE_PIPELINE](/projects/ae_pipeline.png)


If you are interested, please email me at Max.Alexander3721@gmail.com or DM me on Slack or Discord if you have me on either of those platforms. 
