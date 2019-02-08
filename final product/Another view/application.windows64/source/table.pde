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
    vel = .05;
    pointnum = TWO_PI/modulo;
    diameter = d;
    radius = diameter*.5;
    initmultiplier = mult;
    multiplier = mult;

    generatepoints();
  }

  void position()
  {
    translate(pos.x-25, pos.y+100);
  }


  void showcircle()
  {
    beginShape();
    for (PVector p : points)
    {
      vertex(p.x, p.y);
    }
    endShape();
  }

  void showmultiplication()
  {
    if (multiplier < 0)
    {
      multiplier = initmultiplier;
    }
    for (int i = 0; i < points.size(); i++)
    {
      PVector origin = points.get(i);
      float s = (i * multiplier) % modulo;
      PVector stop = points.get(int(s));
      line(origin.x, origin.y, stop.x, stop.y);
      i++;
    }
  }

  void showmultiplier()
  {
    textAlign(RIGHT);
    textSize(12);
    text(multiplier, radius, radius);
  }

  void grow()
  {
    multiplier += vel;
  }
  
  void roundmult()
  {
    multiplier = round(multiplier);
  }

  void shrink()
  {
    multiplier -= vel;
  }
  
  void reset()
  {
   multiplier = 0; 
  }

  void generatepoints()
  {
    for (float k = 0; k < TWO_PI; k+= pointnum)
    {
      point.x = radius * sin(k);
      point.y = radius * cos(k);
      points.add(point.copy());
    }
  }

  void update()
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
