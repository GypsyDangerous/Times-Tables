grid grid;
void setup()
{
  //size(640, 480);
  fullScreen();
  grid = new grid();
}

void draw()
{
  background(51);
  stroke(255);
  noFill();
  grid.run();
}
