# Times-Tables
Repo for my Times tables project.

**The final product of my times table grid.**

I created this application by mapping N number of points around a circle of radius R, that N number of points is the modulo of the time tables. I then use a for loop to draw a line from point i to point (i * multiplier) % modulo. 

the times tables are layed out in a grid that fits within a 16:9 screen. the number of columns and rows can be changed in the code, the current number of columns and rows is the max that can fit on a 16:9 screen.

**What are times tables and how do they work?**

````
* We start by mapping n number of points around a circle with radius r and give each point a number from 0 to n-1.
* Next we select a multiplier like 2, 5, 12, 51.
* Next we take one point and multiply it by the multiplier, then modulus that product by n.
* Next we connect a line from the original point to the point with the number that we got from our operation. 
* We do the last two steps for all the points on the circle.
````
