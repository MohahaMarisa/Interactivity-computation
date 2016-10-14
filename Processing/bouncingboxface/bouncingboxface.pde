// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
// adapted from from Greg Borenstein's 2011 example
// http://www.gregborenstein.com/
// https://gist.github.com/1603230
//

/*PImage img;

void setup() {
  // Images must be in the "data" directory to load correctly
  img = loadImage("laDefense.jpg");
}

void draw() {
  image(img, 0, 0);
  image(img, 0, 0, width/2, height/2);
}*/
/*ArrayList<Particle> particles = new ArrayList<Particle>();

// Objects can be added to an ArrayList with add()
particles.add(new Particle());

// Particles can be pulled out of an ArrayList with get()
Particle part = particles.get(0);
part.display();

// The size() method returns the current number of items in the list
int total = particles.size();
println("The total number of particles is: " + total);

// You can iterate over an ArrayList in two ways.
// The first is by counting through the elements:
for (int i = 0; i < particles.size(); i++) {
  Particle part = particles.get(i);
  part.display();
}*/
import oscP5.*;
OscP5 oscP5;

import processing.video.*;
Capture cam;

// num faces found
int found;
float[] rawArray;
PImage lmark;
PImage rmark;
PImage mask;
ArrayList<BouncingBox> particles = new ArrayList<BouncingBox>();
void setup() {
  lmark = loadImage("kitsunemarkings.png");
  rmark = loadImage("kitsunemarkings2.png");
  mask =loadImage("kistuneMASK.png");
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "rawData", "/raw");
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    cam = new Capture(this, 640, 480, cameras[0]);
    cam.start();     
  }     
}

void draw() {  
  background(255);
  //stroke(0);
  noStroke();
  if (cam.available() == true) {cam.read();}
  set(0, 0, cam);
    float startvx;
    float startvx2;
    float startvy;
    float startvy2;
    float endvx;
    float endvx2;
    float endvy;
    float endvy2;
  if(found > 0) {
    startvx = 0.1*(rawArray[62]-rawArray[0])+rawArray[0];
    startvx2 = 0.1*(rawArray[90]-rawArray[32])+rawArray[32];
    startvy = (rawArray[73]+rawArray[1])/2;
    startvy2 = (rawArray[91]+rawArray[33])/2;
    endvx = startvx+0.8*(rawArray[62]-startvx);
    endvx2 = startvx2+0.8*(rawArray[70]-startvx2);
    endvy = (rawArray[63]+rawArray[97])/2;
    endvy2 = (rawArray[71]+rawArray[109])/2;
    pushStyle();
    imageMode(CORNERS);
    blendMode(SUBTRACT);
    image(lmark,startvx, startvy,endvx, endvy);
    image(rmark,startvx2, startvy2,endvx2, endvy2);
    popStyle();
    println("it's drawing the mark");
    float lipheight =rawArray[123] - rawArray[103]; 
    float mouthOpen = rawArray[129]-rawArray[123];
    float originy = (rawArray[129]+rawArray[123])/2;
    float originx = rawArray[128];
    int sizing = 2*int(mouthOpen);
    boolean creating = false;
    if(mouthOpen > 0.2*lipheight && !creating){
      println("start creating");
      BouncingBox anotherLight;
      creating = true;
      anotherLight = new BouncingBox(originx, originy, sizing);
      particles.add(anotherLight);
      if((rawArray[108]-rawArray[96])<1.25*(rawArray[70]-rawArray[62])){
        for (int i = 0; i < particles.size(); i++) {
          int newvel = int(particles.get(i).xx-rawArray[100]);
          if(newvel<0){
            int vel = int(map(newvel, -width,0,1,10));
            particles.get(i).xVel = -1*vel;
          }
          else {int vel = int(map(newvel, 0,width,10,1));
            particles.get(i).xVel = vel;}
        }
      }
      if(mouthOpen >0.5*lipheight && creating){
        particles.get(particles.size()-1).size = sizing;
        println("what does this dooo?");
      }
    }
    if(creating && mouthOpen <0.2*lipheight){
      creating = false;
    }
    for (int i = 0; i < particles.size(); i++) {
      BouncingBox light = particles.get(i);
      light.draw();
      light.update();
    }
    float lside = rawArray[72]-rawArray[0];
    float rside = rawArray[32]-rawArray[90];
    float turnproportion = lside/rside;
    float masksize = 2.5*(rawArray[17]-rawArray[1]);
    if(turnproportion>3.7){
      int y = int(rawArray[1]-masksize/1.8);
      image(mask,rawArray[0], y,0.75*masksize ,masksize);
    }
  }
  else{
    for (int i = 0; i < particles.size(); i++) {
      particles.remove(i);
    }
  }
}

class BouncingBox {
    int xx;
    int yy;
    int xVel = int(random(-5, 5)); 
    int yVel = int(random(-5, 5)); 
    float size; 
    float initialsize;
    int darknessThreshold = 60;
    float noisex = random(0,100);
    BouncingBox(float originx, float originy, int sizing){
      xx = int(originx);
      yy = int(originy);
      initialsize = sizing;
      size = initialsize;
    }
    void move() {
        // Do not change this. 
        xx += xVel; 
        yy += yVel; 
    }

    void draw() {
        // Do not change this.
        pushStyle();
        blendMode(ADD);
        for(int i=0; i<50;i++){
          float opacity = map(i, 0,50,20,-10);
          fill(255,250,240, opacity);
          float realsize = map(i, 0,50, 0, 1.5*size);
          ellipse(xx,yy,realsize, realsize);
        }
        popStyle();
    }

    void update() {
      noisex+=random(0,0.1);
        move();
        int theColorAt=cam.get(xx,yy);
        float theBrightnessOfTheColor=brightness(theColorAt);
        if (xx + size / 2 >= width ||
            xx - size / 2 <= 0 || theBrightnessOfTheColor < darknessThreshold) {
            xVel = -xVel;
        }
        if (yy + size / 2 >= height ||
            yy - size / 2 <= 0 || theBrightnessOfTheColor < darknessThreshold) {
            yVel = -yVel;
        }
        size=initialsize*0.3+initialsize*noise(noisex);
    }
}
/////////////////////////////////// OSC CALLBACK FUNCTIONS//////////////////////////////////

public void found(int i) {
  println("found: " + i);
  found = i;
}

public void rawData(float[] raw) {
  println("raw data saved to rawArray");
  rawArray = raw;
  
}
    //beginShape();
    //  blendMode(SUBTRACT);
    //  fill(0,50,50);
    //  //int skintone=cam.get(int(rawArray[62]),int(rawArray[63]));
    //  //float g = green(skintone);
    //  //float b = blue(skintone);
    //  //fill(.85*(g+b),g,b,100);
    //  vertex(startvx, startvy);
    //  float conx = startvx-1/20*wOfmark;
    //  float cony = startvy+131/55*hOfmark;
    //  float conxx = endvx-10/80*wOfmark;
    //  float conyy = endvy+100;
    //  float con2x = endvx-7/8*wOfmark;
    //  float con2y = 1/11*hOfmark+endvy;
    //  float con2xx = 5/8*wOfmark+startvx;
    //  float con2yy = 5/11*hOfmark+startvy;
    //  bezierVertex(conx, cony, conxx, conyy, endvx, endvy);
    //  bezierVertex(con2x, con2y, con2xx, con2yy, startvx, startvy);
    //endShape();