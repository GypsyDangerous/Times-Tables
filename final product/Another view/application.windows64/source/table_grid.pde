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

  void run()
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

  void title()
  {
    textSize(50);
    textAlign(CENTER);
    text("TIMES TABLE Visualization, Modulo: " + fullgrid.temp.modulo + ", " + int(fullgrid.rows*fullgrid.cols) + " " + "Tables", width/2, 60);
    text("N to N + " + int((fullgrid.rows*fullgrid.cols)-1), width/2, 125);
  }

  void reset()
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
