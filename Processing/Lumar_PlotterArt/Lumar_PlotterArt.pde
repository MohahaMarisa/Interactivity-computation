// see https://processing.org/reference/libraries/pdf/index.html
/*
PImage webImg;

void setup() {
  String url = "https://processing.org/img/processing-web.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
}
Before accessing this array, the data must loaded with the loadPixels() function.
Failure to do so may result in a NullPointerException. Subsequent changes to the 
display window will not be reflected in pixels until loadPixels() is called again. 
After pixels has been modified, the updatePixels() function must be run to update 
the content of the display window.
*/
import processing.pdf.*;
boolean bRecordingPDF;
int pdfOutputCount = 0; 
PImage img; 
String s="20";
void setup() {
  size(500, 500);
  bRecordingPDF = true;

}
 
void keyPressed() {
  // When you press a key, it will initiate a PDF export
  bRecordingPDF = true;
}
 
void draw() {
  if (bRecordingPDF) {
    background(255); // this should come BEFORE beginRecord()
    beginRecord(PDF, "myName_" + pdfOutputCount + ".pdf");
 
    //--------------------------
    // This draws a squiggly drunk walk. 
    noFill(); 
    beginShape();
    float rx = width/2;
    float ry = height/2;
    for (int i=0; i <100; i++) {
      rx = rx + random(-25, 25); 
      ry = ry + random(-25, 25); 
      curveVertex(rx, ry);
    }
    endShape();
    //--------------------------
 
    endRecord();
    bRecordingPDF = false;
    pdfOutputCount++;
  }
}