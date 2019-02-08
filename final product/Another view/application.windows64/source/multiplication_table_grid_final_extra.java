import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class multiplication_table_grid_final_extra extends PApplet {

grid fullgrid;
table vis;
public void setup()
{
  
  fullgrid = new grid();
  vis = new table(width/2 + width/4, height/2, 2, width/10, 240);
  stroke(204);
  noFill();
}

public void draw()
{
  background(51);
  fullgrid.title();

  fullgrid.run();
  pushMatrix();
  
  vis.update();
  vis.position();
  //scale(2);
  vis.showcircle();
  vis.showmultiplication(); 
  vis.showmultiplier();
  popMatrix();
}

class table
{
  int modulo;
  
  float pointnum;
  float diameter;
  float radius;
  float multiplier;
  float initmultiplier;
  float vel;
  
  PVector point;
  PVector pos;
  
  ArrayList<PVector> points;

  table(float x, float y, float mult, float d, int m)
  {
    
    points = new ArrayList<PVector>();
    
    point = new PVector();
    pos = new PVector(x, y);
    
    modulo = m;
    vel = .05f;
    pointnum = TWO_PI/modulo;
    diameter = d;
    radius = diameter*.5f;
    initmultiplier = mult;
    multiplier = mult;

    generatepoints();
  }

  public void position()
  {
    translate(pos.x-25, pos.y+100);
  }


  public void showcircle()
  {
    beginShape();
    for (PVector p : points)
    {
      vertex(p.x, p.y);
    }
    endShape();
  }

  public void showmultiplication()
  {
    if (multiplier < 0)
    {
      multiplier = initmultiplier;
    }
    for (int i = 0; i < points.size(); i++)
    {
      PVector origin = points.get(i);
      float s = (i * multiplier) % modulo;
      PVector stop = points.get(PApplet.parseInt(s));
      line(origin.x, origin.y, stop.x, stop.y);
      i++;
    }
  }

  public void showmultiplier()
  {
    textAlign(RIGHT);
    textSize(12);
    text(multiplier, radius, radius);
  }

  public void grow()
  {
    multiplier += vel;
  }
  
  public void roundmult()
  {
    multiplier = round(multiplier);
  }

  public void shrink()
  {
    multiplier -= vel;
  }
  
  public void reset()
  {
   multiplier = 0; 
  }

  public void generatepoints()
  {
    for (float k = 0; k < TWO_PI; k+= pointnum)
    {
      point.x = radius * sin(k);
      point.y = radius * cos(k);
      points.add(point.copy());
    }
  }

  public void update()
  {
    if (mousePressed && (mouseButton == LEFT))
    {
      grow();
    }
    if (mousePressed && (mouseButton == RIGHT))
    {
      roundmult();
    }
    if (keyPressed && key != 'r')
    {
      shrink();
    }
    if (keyPressed && key == 'r')
    {
      reset();
    }
  }
}
class grid
{
  ArrayList<table> tables;

  table temp;

  float rows;
  float cols;
  float x;
  float y;
  float changepos;

  int multiplier;

  grid()
  {
    reset();
  }

  public void run()
  {
    for (table t : tables)
    {
      pushMatrix();
      //t.update();
      t.position();
      t.showcircle();
      t.showmultiplication(); 
      t.showmultiplier();
      popMatrix();
    }

    //if (keyPressed && key == 'r')
    //{
    //  reset();
    //}
  }

  public void title()
  {
    textSize(50);
    textAlign(CENTER);
    text("TIMES TABLE Visualization, Modulo: " + fullgrid.temp.modulo + ", " + PApplet.parseInt(fullgrid.rows*fullgrid.cols) + " " + "Tables", width/2, 60);
    text("N to N + " + PApplet.parseInt((fullgrid.rows*fullgrid.cols)-1), width/2, 125);
  }

  public void reset()
  {
    temp = new table(0, 0, 0, width/10, 240);
    rows = 4;
    cols = 4;
    x = temp.diameter - (temp.radius/2);
    y = temp.diameter - (temp.radius/2);
    multiplier = 2;
    changepos = (temp.diameter - (temp.radius/2))+temp.radius;
    tables = new ArrayList<table>();

    for (int i = 0; i < (rows*cols); i++)
    {
      tables.add(new table(x, y, multiplier, width/10, 240));
      x += changepos;

      if (x > (changepos * rows))
      {
        y += changepos;
        x -= (changepos * rows);
      }

      multiplier++;
    }
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "multiplication_table_grid_final_extra" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
