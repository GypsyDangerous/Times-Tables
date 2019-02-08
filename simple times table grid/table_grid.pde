class grid
{
  ArrayList<table> tables;
table t;
  float rows;
  float cols;
  float x;
  float y;
  int m;
  float posvel;

  grid()
  {
    t = new table(0,0,0);
    rows = 6;
    cols = 3;
    x = 180;
    y = 180;
    m = 2;
    posvel = 180+t.r;
    tables = new ArrayList<table>();
    for (int i = 0; i < (rows*cols); i++)
    {
      tables.add(new table(x, y, m));
      x += posvel;
      if(x > (posvel * rows))
      {
        y += posvel;
        x -= (posvel * rows);
      }
      m++;
    }
  }



  void run()
  {
    for (table t : tables)
    {
      pushMatrix();
      t.position();
      t.showcircle();
      t.showmultiplication();
      t.showmultiplier();
      popMatrix();
    }
  }
}
