// Baseado na ideia de Daniel Shiffman:
// https://github.com/CodingTrain/Rainbow-Code/tree/master/Tutorials/Processing/11_video/sketch_15_6_frog_particles
//  https://youtu.be/WH31daSj4nc?t=14m53s

import processing.video.*;
import de.voidplus.leapmotion.*;

Particle[] particles;

Capture capture;

int w, h;

LeapMotion leap;
PVector[] handsXY = new PVector[4];
int i_hand = 0;

int count = 0;

void setup()
{
  
  size(960, 540);//1920, 1080);
  
  frameRate(90);
  
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    capture = new Capture(this, 640, 480);
  } else if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    capture = new Capture(this, cameras[3]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    capture.start();
  }
  
  /*surface.setResizable(true);
  w = capture.width;
  h = capture.height;
  setSize(w, h);
  surface.setSize(w, h);*/
  
  noStroke();
    
  noCursor();
    
  particles = new Particle [3500];//100];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  background(0);
  
  
  for(int i=0; i<4; i++) {
    handsXY[i] = new PVector();
  }
}

void captureEvent(Capture capture)
{
  capture.read(); 
}

void draw()
{
  if(leap != null)
  {
    i_hand = 0;
    /**/for (Hand hand : leap.getHands ())
    {
      handsXY[i_hand] = hand.getSpherePosition();
      /*println(i_hand + " " + handsXY[i_hand].x + " " + handsXY[i_hand].y + " " + handsXY[i_hand].z);
      
      
      fill(255);
      ellipse(handsXY[i_hand].x, height-handsXY[i_hand].z*height/110.0, 50*handsXY[i_hand].y/60., 50*handsXY[i_hand].y/60.);
      */
      i_hand++;
    }/**/     
  }
  
  /*if (movie.available() == true) {
    movie.read();
    movie.loadPixels();
  }*/
  
  if(count % 2 == 0) {
    for (int i = 0; i < particles.length; i+=2) {
      particles[i].display();
      particles[i].move();
    }
  }
  else {
    for (int i = 1; i < particles.length/2-1; i+=2) {
      particles[i].display();
      particles[i].move();
    }
  }
  count++;
 
   //  Descomentando a chamada abaixo, sera criada uma pasta frames para onde serao copiados
  //os frames da execucao. Va no menu Ferramentas->Movie Maker para transformar esses
  //frames em video. http://www.computacaocriativa.com.br/2017/08/20/processing-movie-maker/
  //saveFrame("/frames/teste_Brizo_####.png");
}

//  WORKAROUND: Para o leap nao conflitar com a camera, iniciamos o sketch SEM o Leap conectado.
//Depois de iniciado o sketch, iniciamos o Leap com a tecla l
void keyReleased()
{ 
  if(key == 'l'){
    leap = new LeapMotion(this).allowGestures("key_tap");
  }
  //println(frameRate + "  " + leap.getFrameRate());
}

//  Limpamos a tela com gesto de apertar uma tecla (na direcao do leap)
void leapOnKeyTapGesture(KeyTapGesture g)
{
    background(0); 
    
    for (Particle particle : particles)
    {
      particle.reset();
    }
}