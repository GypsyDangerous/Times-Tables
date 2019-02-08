class table
{
  float pointnum;
  int modulo;
  float d;
  float r;
  int multiplier;
  PVector point;
  PVector pos;
  ArrayList<PVector> points;

  table(float x, float y, int mult)
  {
    modulo = 360;
    pointnum = TWO_PI/modulo;
    points = new ArrayList<PVector>();
    point = new PVector();
    pos = new PVector(x, y);
    d = width/8;
    r = d*.5;
    multiplier = mult;

    for (float k = 0; k < TWO_PI; k+= pointnum)
    {
      point.x = r * sin(k);
      point.y = r * cos(k);
      points.add(point.copy());
    }
  }

  void position()
  {
    translate(pos.x, pos.y);
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
    for (int i = 0; i < points.size(); i++)
    {
      PVector origin = points.get(i);
      int s = (i * multiplier) % modulo;
      PVector stop = points.get(s);
      line(origin.x, origin.y, stop.x, stop.y);
      i++;
    }
  }

  void showmultiplier()
  {
    textAlign(RIGHT);
    text(multiplier, r, r);
  }
}
