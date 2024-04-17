---
layout: page
title: Verifiable Controls for End-to-End Autonomous Driving
description: Master's Thesis
img: 
importance: 1
category: Current
related_publications: false
---

This thesis research project encompasses research spanning reinforcement learning for end-to-end autonomous driving controls, conditional generative networks for scaling verification tools to high-dimensional image space, and formal methods and reachability analysis to obtain and verify safety guarantees on the end-to-end autonomous driving controllers.

## End-to-End Controllers

Motivated from challenges we observed from the [F1Tenth Robotic Vehicle Project](/projects/f1tenth), we started our projects by training various deep reinforcement learning-based agenets in the [CALRA](https://carla.org//) simulator. To accomplish this:
- we developed a reinforcement learning environment wrapper for CARLA using [OpenAI's Gymnasium](https://gymnasium.farama.org/index.html) API. This environment is designed to enable fully customizable single-agent RL experiments. We plan to open-source these codes in the near future. Stay tuned! :star:
- we experimented with various deep RL algorithms:
  - Deep Q-Learning where we simplified our action space into discrete space
  - Deep Deterministic Policy Gradient
  - Proximal Policy Optimization
  - etc.

## Verification

#### Generative Networks

To formally verify our deep neural network controllers that take images as inputs, we must address the curse of dimensionality: it is infeasible to produce a safety certification for all possible images because the entire space is continuous and high-dimensional. To tackle this, we employed generative networks that can take a few fine-grained variables representing the underlying true state of the vehicle as input and generate the images that the vehicle would be perceiving. 

More specifically:
- We used conditional generative adversarial networks (cGAN) to generate images conditioned on the true states of the vehicle, which include the vehicle's distance to the center lane, its heading error, and its global position within the map.
- After training this network, we can concatenate the generator network with the neural network controller to obtain a network that takes the true states of the vehicle as input and outputs the steering control.

This approach enables us to utilize existing verification tools and methods that are well-defined to formally verify the safety guarantees of our neural network controllers.

#### Verifying the Safety Gurantees

Ongoing :gem: