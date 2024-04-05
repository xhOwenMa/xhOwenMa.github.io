---
layout: page
title: F1Tenth Vehicle
description: Vision-Based End-to-End Autonomous Driving (Robotics)
img: 
importance: 2
category: Current
related_publications: false
---

In the media: [Washington University AV Mini-City](https://hecmedia.org/posts/washington-university-av-mini-city)

[Project Documentation](/assets/pdf/F1Tenth_Documentation.pdf); [code](https://github.com/xhOwenMa/f1tenth)

The goal of this project is to develop a fully autonomous vehicle capable of safely navigating through a miniature city using only a single front-facing camera. The majority of the codes is written in Python, and we used ROS2 to establish communications between all the components of the robotic vehicle. 

At a high-level, the vehicle functions operates according to the following pipeline:
- the front-facing camera captures the current frame which the vehicle is `seeing'
- this raw image is used as the input to a lane detection model, which outputs a greyscale map that detects where the lane markings are
  - We trained a custom lane detection model by collecting images within our miniature city and manually annotating them.
  - To ensure a comprehensive dataset while minimizing laborious manual data collection and annotation, we applied various data augmentation techniques during training to improve our model's performance.
- The centerline trajectory is computed based on the detected lane markings, which the vehicle aims to follow.
- the vehicle relies on the [Stanley Controller](https://github.com/AtsushiSakai/PythonRobotics/blob/master/PathTracking/stanley_controller/stanley_controller.py), a path tracking simulation algorithm to compute the steering based on the computed trajectory. The acceleration of the vehicle is computed using a PID speed control.

However, there are several limitations to using a path tracking simulation tool for steering control:
- An accurate mapping matrix is required to convert pixel distances to real-world 3-dimensional space and vice versa to execute the computed controls.
- Proper computation depends on all components of the stack functioning optimally; any unexpected issues, such as camera jitter or position changes, can lead to imprecise simulations.
- Most crucially, the centerline trajectory must be accurately computed, which itself relies on precise predictions from the lane detection model, which may not always be possible when the captured image frame contains light glare or is blurry due to camera instability and other factors.

Hence, to create a truly end-to-end autonomous driving system, we needed to train a controller that can directly output steering control from images. To do so, we utilized the [CALRA](https://carla.org//) simulator, and explored the potential of sim-to-real transfers. More specifically, we trained end-to-end deep reinforcement learning agents that directly output steering controls from images within CARLA, and then deployed and tested these agents on our robotic vehicle. You can find more information about this at: [Verifiable Controls for End-to-End Autonomous Driving](/projects/master_thesis).