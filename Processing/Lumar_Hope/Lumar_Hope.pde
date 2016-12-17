import geomerative.*;
import processing.pdf.*;
boolean bRecordingPDF;
int pdfOutputCount = 0; 
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RFont f;
RShape H;
String firstletter = "H";
RShape O;
RShape E;
RShape P;
RPoint[] points;
int wordSize;
int wordSize2;
int col = 4;//columns
//----------------------------------------------------------------------------------------------------------------------
void setup(){
  bRecordingPDF = true;
  size(800,800);
  frameRate(24);
  background(255);
  fill(255,102,0);
  stroke(0);
  wordSize = width/4;
  wordSize2= int(wordSize*1.2);
  // VERY IMPORTANT: initialize the library in the setup
  RG.init(this);
  
  //  Load the font file (the file must be in the data folder in the sketch floder)
  H = RG.getText("H", "Comfortaa_Bold.ttf", wordSize, CENTER);
  O = RG.getText("O", "Comfortaa_Bold.ttf", wordSize, CENTER);
  E = RG.getText("E", "Comfortaa_Bold.ttf", wordSize, CENTER);
  P = RG.getText("P", "SpaceMono-Regular.ttf", wordSize, CENTER);

  smooth();
}
//----------------------------------------------------------------------------------------------------------------------
void keyPressed() {
  // PDF export when a key is pressed
  bRecordingPDF = true;
}
//----------------------------------------------------------------------------------------------------------------------
void draw(){
  if (bRecordingPDF) {
    background(255); // this should come BEFORE beginRecord()
    beginRecord(PDF, "Lumar_" + pdfOutputCount + ".pdf");
    
    for(int c=1; c<= col; c++){
      pushMatrix();
      fill(0,0,255);
      translate((wordSize/2+(c-1)*wordSize*0.9)%width,wordSize*0.8);
      noFill();
      noStroke();
      // Draw H
      //if(c!=2){
        RG.setPolygonizer(RG.ADAPTATIVE);
        H.draw();
        RG.setPolygonizer(RG.UNIFORMLENGTH);
        RG.setPolygonizerLength(4);
        points = H.getPoints();
    
          stroke(0);
          strokeWeight(0.3);
          //beginShape();
          for(int i=0; i<points.length; i++){
            //vertex(points[i].x, points[i].y);
            //float xx = map(i, 0, points.length, points[0].x-8, points[points.length-1].x+20);
            //float howManyPi = map(wordSize, 40, 120, 3*PI, 2*PI);
            //float yyInput = map(xx, points[0].x, points[points.length-1].x, 0, howManyPi*PI);
            //float additivecosinewave = -wordSize/6+wordSize/3*cos(2*yyInput*noise(0.001*millis()));
            //float yy = -wordSize/6+wordSize/2*sin(yyInput)+0.5*additivecosinewave;
            line(points[i].x, points[i].y,0,0);
          }
      //}
  //OOOOOOOOOOOO-------------------------------------------------
     translate(0,wordSize);
     if(c!=2){
       RG.setPolygonizer(RG.ADAPTATIVE);
       O.draw();
       RG.setPolygonizer(RG.UNIFORMLENGTH);
       RG.setPolygonizerLength(4);
       points = O.getPoints();
       
       if(points != null){
          for(int i=0; i<points.length; i++){
             line(points[i].x, points[i].y,0,0);
          }
        }
     }
   //PPPP----------------------------------------------    
      translate(-20,wordSize);
      if(c!=3){
      RG.setPolygonizer(RG.ADAPTATIVE);
      P.draw();
    
      RG.setPolygonizer(RG.UNIFORMLENGTH);
      RG.setPolygonizerLength(4);
      points = P.getPoints();
  
      if(points != null){
        for(int i=0; i<points.length; i++){
          //vertex(points[i].x, points[i].y);
          float xxInput = map(i, 0, points.length,0, 2*PI);
          float xx = 13+5.3*(16*pow(sin(xxInput),3));
          float yyInput =map(xxInput,0, 2*PI,-2*PI, 0);
          float yy = 100+6.7*(13*cos(yyInput)-5*cos(2*yyInput)-2*cos(3*yyInput)-cos(4*yyInput));
          line(points[i].x, points[i].y,0,0);
        }
       }
      }
    //EEEEEEEEEE-----------------------------------------------------------
      translate(20,wordSize);
      if(c!=4){
        stroke(0);
        RG.setPolygonizer(RG.ADAPTATIVE);
        E.draw();
      
        RG.setPolygonizer(RG.UNIFORMLENGTH);
        RG.setPolygonizerLength(4);
        points = E.getPoints();
    
        if(points != null){
          for(int i=0; i<points.length; i++){
            line(points[i].x, points[i].y,0,0);
          }
        }
      }
       popMatrix();
    }
    //--------------------------
    endRecord();
    bRecordingPDF = false;
    pdfOutputCount++;
  }
}