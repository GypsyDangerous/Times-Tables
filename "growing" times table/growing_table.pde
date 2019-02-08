table mult;
boolean pressed = false;
float ro;
void setup()
{
  //size(640, 480);
  fullScreen();
  mult = new table();
}

void draw()
{
  background(51);
  translate(width/2, height/2);
  pushMatrix();
  strokeWeight(2);
  //rotate(radians(radians(millis())));
  rotate(HALF_PI);
  stroke(255);
  noFill();
  mult.circle();
  mult.displaymultiplication();
  mult.update();
  popMatrix();
  mult.displaymultiplier();
}
