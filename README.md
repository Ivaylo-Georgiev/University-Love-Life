# 🍓 FMI Love Life

<img alt="Simulation" src="https://github.com/Ivaylo-Georgiev/FMI-Love-Life/blob/master/simulation.gif" width="500">

## Strawberry Prolog Overview

This project is written in _Strawberry Prolog_.  

Strawberry Prolog is being developed in the Institute of Mathematics and Informatics – Bulgarian Academy of Sciences and in the Faculty of Mathematics and Informatics – University of Sofia.

Prolog is a language of a higher level. This turns out to be an advantage and disadvantage at the same time. On one hand it shortens the time of your program development and on the other it may sometimes affect the efficiency. Prolog programs usually work slower than the programs written on language like C but the problem is not in the language but in the Prolog compilers.  

Find more about Strawberry Prolog [here](http://www.dobrev.com/index.html)

## Installation

### Clone

Clone this repo to your local machine using `https://github.com/Ivaylo-Georgiev/FMI-Love-Life.git`  

### Setup

 1. Download and install [Strawberry Prolog](http://www.dobrev.com/download.html)
 2. Run Strawberry Prolog as an Administrator  
 3. Run `FMILoveLife.pro`
 
## Features
 
### Virtual Simulation
 
_FMI Love Life_ is a virtual simulation of the students who are currently enrolled in different bachelor programs.  
 
The boys are represented as blue dots, the girls as pink dots and the player (a male) as a big green dot. The university is represented as a black rectangular outline in the middle of the window. Some of the dots are moving and the others are static. The moving dots have different speeds. The movement (and the lack of movement, respectively), represents the academic activities of the students - as in real life, some people are more dynamic and others, more static. The dots inside the outline of the university are enrolled students and those outside are drop-outs. During the timelapse (4 years), some of the real-life students may deside to drop out, or some of the drop-outs may decide to re-enroll. This possibility is taken into account for the simulation.

The purpose of the simulation is to understand how many girlfriends and buddies (best male friends) a student like me could possibly get during his years at the university. Every single run of the program may generate different results. 

> ⚠️ **Important**: The simulation is intended to be used **FOR FUN** and its accuracy is rather uncertain and undefined.

How a match is determined:  
 * A girl (pink dot) is counted as a girlfriend to the player (big green dot), if they happen to share the same coordinates during the timelapse. 
 * A guy (blue dot)  is counted as a buddy to the player (big green dot), if they happen to share the same coordinates during the timelapse.
 
 > _Made with 🔥 for the Strawberry Prolog and Artificial Intelligence course at FMI_
