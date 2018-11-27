class Particle {
  float x;
  float y;
  
  float vx;
  float vy;
  
  /**/
  float vxStart, vyStart;
  int diameter;
  int diameterStart = 12;
  /**/

  float scale = 1.0f;//0.5f;  //  estamos usando uma captura de metade do tamanho da tela...  

  Particle()
  {
    x = width/2;
    y = height/2;
    float a = random(TWO_PI);
    float speed = random(1,2) * 2;
    vxStart = cos(a)*speed;
    vyStart = sin(a)*speed;
    
    diameter = diameterStart;
  }

  void reset()
  {
    x = width/2;
    y = height/2;
  }

  void display() 
  {
    color c = capture.get(int((width-x)*scale),int(y*scale));
    fill(c,25);
    ellipse(x, y, diameter, diameter);
  }

  float dSqr1, dSqr2 = 0;

  void move()
  {
    dSqr1 = sq(handsXY[0].x - x) + sq( (height - height*handsXY[0].z/110.) - y);
    dSqr2 = sq(handsXY[1].x - x) + sq( (height - height*handsXY[1].z/110.) - y);
    if(dSqr1 < 10000 * handsXY[0].y/360. || dSqr2 < 10000 * handsXY[1].y/360.)
    {
    //dSqr1 = sq(mouseX - x) + sq(mouseY - y);;
    //if(dSqr1 < 10000) {
      vx = vxStart;
      vy = vyStart;
      x = x + vx;
      y = y + vy;
      diameter = diameterStart;
    }
    else
    {
      x = x + vx;
      y = y + vy;
      diameter = diameterStart / 5;
    }
    
    //  wrap-around
    
    if (y < 0) {
      y = height;
    } 

    if (y > height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    } 

    if (x > width) {
      x = 0;
    }
  }

}