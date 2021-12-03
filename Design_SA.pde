//Importing the Libraries
import peasy.*;
import processing.opengl.*;
import processing.sound.*;

//Using the sun object from the other file
Planet sun;
PeasyCam cam;
PImage sunTexture;
PImage[] textures = new PImage[7];
SoundFile file;


//Setup
void setup() {
  size(1000, 800, OPENGL);
  
  //Loading the images of the planets
  sunTexture = loadImage("sun.jpeg");
  textures[6] = loadImage("neptune.jpeg"); 
  textures[5] = loadImage("saturn.jpeg"); 
  textures[4] = loadImage("jupiter.jpeg"); 
  textures[3] = loadImage("mars.jpeg"); 
  textures[2] = loadImage("earth.jpeg"); 
  textures[1] = loadImage("venus.jpeg"); 
  textures[0] = loadImage("mercury.jpeg"); 
  
  file = new SoundFile(this, "space_background.mp3");
  file.play();
  file.loop();
  
  //creating a new sun planet
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(7, 1);
  
  //Creating a peasycam instance
  cam = new PeasyCam(this, 1000);
  
  }
  

void draw() {
  background(0);
  lights();
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
 
}
