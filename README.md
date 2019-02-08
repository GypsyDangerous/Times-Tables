# Times-Tables
Repo for my Times tables project. Inspired by Simon Tiger https://github.com/simon-tiger/times_tables. All of the code is my own but the idea came from Simon


**The final product of my times table grid.**

I created this application by mapping N number of points around a circle of radius R, that N number of points is the modulo of the time tables.
I then use a for loop to draw a line from point i to point i * multiplier % modulo. 
the times tables are layed out in a grid that fits within a 1920x1080 screen.

**What are times tables and how do they work?**

````
We start by mapping n number of points around a circle with radius r and give each point a number from 0 to n-1.
Next we select a multiplier like 2 or 5 or 12.
Next we take one point and multiply it by the multiplier, then modulus that product by n.
Next we connect a line from the original point to the point with the number that we got from our operation.
We do the last two steps for all the points on the circle.
````
