class table
{
  float pointnum;
  float num;
  float d;
  float r;
  float multiplier;
  int i;
  PVector point;
  ArrayList<PVector> points;

  table()
  {
    num = 180;
    num *= 2;
    pointnum = TWO_PI/num;
    points = new ArrayList<PVector>();
    point = new PVector();
    d = height - (height/6);
    r = d*.5;
    multiplier = 1;

    for (float k = 0; k < TWO_PI; k+= pointnum)
    {
      point.x = r * sin(k);
      point.y = r * cos(k);
      points.add(point.copy());
    }
  }


  void circle()
  {
    beginShape();
    for (PVector p : points)
    {
      vertex(p.x, p.y);
    }
    endShape();
  }

  void displaymultiplication()
  {
    if (multiplier <= 0)
    {
      multiplier = 1;
    }
    for (int i = 0; i < points.size(); i++)
      //if (i < points.size())
    {
      PVector origin = points.get(i);
      float s = (i * multiplier) % (points.size() -1);
      PVector stop = points.get(int(s));
      line(origin.x, origin.y, stop.x, stop.y);
      i++;
    }
  }

  void displaymultiplier()
  {
    textSize(50);
    text(multiplier, width/3, height/3);
  }

  void update()
  {
    multiplier = (millis() * .0001) + 1;
    stroke((multiplier*12)%255, 255, 255);
  }
}
