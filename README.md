# Description of shape builder

## Set up
* shapebuilder.pde in folder shape builder is written in Processing language.

## What it does?
* When the file is run, a window containing a grid will apear.
* Click anywhere on the window's screen, a dot will be drawn at the nearest grid point. 
* Everytime the mouse is clicked, a new dot in the same manner. 
* Every dot is connected to the previous dot. The last dot is also connected to the very first dot.
* Assuming that each dot has an unit weight. The dot that is closest to the mass of center of all dots will be red, while the furthest dot from the center will be blue.
* An existing dot can be drag to another grid point by press and drag with the mouse cursor. Once the mouse is released, the dot will be at the nearest grid point.
* The shape can be moved by pressing the up, down, left, right buttons on the keyboard.
* <u>This program was my assessment in COMP115/COMP1000 Introduction to Computer Programming.</u>
* For a visual illustration, click [here](https://youtu.be/IzrPOdNmgEQ) for a youtube video.
* My plan is to figure out the last three features described in the video, and as followed:
1. Double-clicking at an already existing node should remove the node.
2. If none of the lines are intersecting (besides adjacent lines having a common point), the whole shape must be filled with colour code (0, 0, 255, 127) (semi-transparent blue).
3. Each time you press the ENTER key, a new graph is generated. The old graph should still be displayed on the display window. 

## Constraints
Constraints are made by the teaching team. My guess is to make sure we don't use the short cuts; that we uderstand the logic and not be too dependant.

* You cannot use any extra processing libraries or plugins.
* You cannot use any Java libraries or plugins. 
* You cannot use classes.
* You cannot use multiple tabs or multiple files.
* You cannot use transformations such as rotate,translate, scale.
* You cannot use images.
* You must submit a single pde file.