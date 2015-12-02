# Vagrant Dev Toolkit
A modular collection of bash scripts to use to set up vagrant development evironments.

Call me old fashioned, but I'm not intrested in using puppet or chef when something much more simple will do. I created this repo as a starting point for developing web projects, and dropped in some of my more commonly used scripts.

Intended usage:
- Clone this repo into folder within a web project.
- Edit setup.sh to add or remove only the tech needed for the project.
- Stand up vagrant box.
- Dev.

Current setup scripts include:
- node
- mongodb
- meteor
- redis
- apache
- nginx
- mysql
- php 

Note: I haven't tested all of these 100%.

My plan is to slowly add baseline config files for each platform so that I can get up and running under different configs as quick as possible.
