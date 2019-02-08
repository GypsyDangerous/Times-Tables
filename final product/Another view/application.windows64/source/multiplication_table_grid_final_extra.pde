grid fullgrid;
table vis;
void setup()
{
  fullScreen();
  fullgrid = new grid();
  vis = new table(width/2 + width/4, height/2, 2, width/10, 240);
  stroke(204);
  noFill();
}

void draw()
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
