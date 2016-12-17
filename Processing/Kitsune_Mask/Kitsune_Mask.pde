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
import oscP5.*;
OscP5 oscP5;

import processing.video.*;
Capture cam;
// num faces found
int found;
float[] rawArray;

//which point is selected
int highlighted;

void setup() {
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
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 640, 480, cameras[0]);
    cam.start();     
  }      
}

void draw() {  
  background(255);
  //stroke(0);
  noStroke();
  
  if (cam.available() == true) {
    cam.read();
  }
  set(0, 0, cam);
  
  if(found > 0) {
    float lipheight =1.4*(rawArray[123] - rawArray[103]); 
    fill(100,30,20);
      beginShape();
      vertex(rawArray[96], rawArray[97]);
      vertex(rawArray[98], rawArray[99]);
      vertex(rawArray[100], rawArray[123] - lipheight*1.2);
      vertex(rawArray[102], rawArray[123]-lipheight);
      vertex(rawArray[104], rawArray[123] - lipheight*1.2);
      vertex(rawArray[106], rawArray[107]);
      vertex(rawArray[108], rawArray[109]);
      vertex(rawArray[124], rawArray[125]);
      vertex(rawArray[122], rawArray[123]);
      vertex(rawArray[120], rawArray[121]);
      endShape();
     fill(130,50,20);
      beginShape();
      vertex(rawArray[108], rawArray[109]);
      vertex(rawArray[110], rawArray[111]);
      vertex(rawArray[112], rawArray[113]);
      vertex(rawArray[114], rawArray[115]);
      vertex(rawArray[116], rawArray[117]);
      vertex(rawArray[118], rawArray[119]);
      vertex(rawArray[96], rawArray[97]);
      vertex(rawArray[130], rawArray[131]);
      vertex(rawArray[128], rawArray[129]);
      vertex(rawArray[126], rawArray[127]);
      endShape();
    /*for (int val = 0; val < rawArray.length -1; val+=2){
      if (val == highlighted){ fill(255,0,0);}
      else{fill(100);}
      ellipse(rawArray[val], rawArray[val+1],8,8); 
      text("Use Left and Right arrow keys to cycle through points",20,20);
      text( "current index = [" + highlighted + "," + int(highlighted + 1) + "]", 20, 40);
    }*/
  }
}

void keyPressed(){
  if (keyCode == RIGHT){
  highlighted = (highlighted + 2) % rawArray.length;
  }
  if (keyCode == LEFT){
    highlighted = (highlighted - 2) % rawArray.length;
    if (highlighted < 0){highlighted = rawArray.length-1;
    }
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