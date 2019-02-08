float pointnum;
float num;
float d;
float r;
int multiplier;
PVector point;
ArrayList<PVector> points;
void setup()
{
  size(640, 480);
  num = 120;
  pointnum = TWO_PI/num;
  points = new ArrayList<PVector>();
  point = new PVector();
  d = 400;
  r = d*.5;
  multiplier = 2;

  for (float k = 0; k < TWO_PI; k+= pointnum)
  {
    point.x = r * sin(k);
    point.y = r * cos(k);
    points.add(point.copy());
  }
}

void draw()
{
  background(51);
  translate(width/2, height/2);
  stroke(255);
  noFill();

  beginShape();
  for (PVector p : points)
  {
    vertex(p.x, p.y);
  }
  endShape();
  
  for (int i = 0; i < points.size(); i++)
  {
    PVector origin = points.get(i);
    int s = (i * multiplier) % (points.size() -1);
    PVector stop = points.get(s);
    line(origin.x, origin.y, stop.x, stop.y);
  }
  
  if(frameCount % 120 == 0)
  {
   multiplier++; 
   println(multiplier);
  }
}
