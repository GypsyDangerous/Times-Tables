grid fullgrid;
void setup()
{
  fullScreen();
  fullgrid = new grid();
  stroke(204);
  noFill();
}

void draw()
{
  background(51);
  fullgrid.title();
  
  fullgrid.run();
}
