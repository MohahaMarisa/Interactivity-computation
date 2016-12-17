import geomerative.*;
import processing.pdf.*;
boolean bRecordingPDF;
int pdfOutputCount = 0; 
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape love;
RShape heart;
RPoint[] points;
//RPoint[] hpoints;
int wordSize = 180;
int wordSize2 = int(wordSize*1.2);
void setup(){
  bRecordingPDF = true;
  // Initilaize the sketch
  size(700,400);
  frameRate(24);

  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  love = RG.getText("Form", "VeraMono.ttf", wordSize, CENTER);
  //heart = RG.getText("?", "SpaceMono-Regular.ttf", wordSize2, CENTER);

  // Enable smoothing
  smooth();
}
void keyPressed() {
  // When you press a key, it will initiate a PDF export
  bRecordingPDF = true;
}
void draw(){
    if (bRecordingPDF) {
    background(255); // this should come BEFORE beginRecord()
    beginRecord(PDF, "myName_" + pdfOutputCount + ".pdf");
 

     // Clean frame
  background(255);
  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2);
  
  // Draw the group of shapes
  noFill();
  noStroke();
  //stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  love.draw();
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(4);
  points = love.getPoints();

  if(points != null){
    noFill();
    stroke(0);
    strokeWeight(0.3);
    //beginShape();
    for(int i=0; i<points.length; i++){
      //vertex(points[i].x, points[i].y);
      float xx = map(i, 0, points.length, points[0].x-8, points[points.length-1].x+20);
      float howManyPi = map(wordSize, 40, 120, 3*PI, 2*PI);
      float yyInput = map(xx, points[0].x, points[points.length-1].x, 0, howManyPi*PI);
      float additivecosinewave = -wordSize/6+wordSize/3*cos(2*yyInput*noise(0.001*millis()));
      float yy = -wordSize/9+wordSize/2*sin(yyInput)+0.5*additivecosinewave;
      line(points[i].x, points[i].y,xx,yy);
    }
  /*translate(30,60);
  RG.setPolygonizer(RG.ADAPTATIVE);
  heart.draw();
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(4);
  points = heart.getPoints();

  if(points != null){
    noFill();
    stroke(255,0,0);
    strokeWeight(0.3);
    //beginShape();
    for(int i=0; i<points.length; i++){
      //vertex(points[i].x, points[i].y);
      float xxInput = map(i, 0, points.length,0, 2*PI);
      float xx = 13+5.3*(16*pow(sin(xxInput),3));
      float yyInput =map(xxInput,0, 2*PI,-2*PI, 0);
      float yy = 100+6.7*(13*cos(yyInput)-5*cos(2*yyInput)-2*cos(3*yyInput)-cos(4*yyInput));
      line(points[i].x, points[i].y,xx,-yy);
    }
  }*/
  }

    //--------------------------
 
    endRecord();
    bRecordingPDF = false;
    pdfOutputCount++;
  }
 
}