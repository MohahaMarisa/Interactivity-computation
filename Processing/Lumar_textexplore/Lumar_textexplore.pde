import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(1000,400);
  frameRate(24);

  // Choice of colors
  background(200);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("FORM", "VeraMono.ttf", 140, CENTER);

  // Enable smoothing
  smooth();
}

void draw(){
  // Clean frame
  background(200);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  
  // Draw the group of shapes
  noFill();
  stroke(255,0,0);
  //stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  
  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  RG.setPolygonizerLength(1);
  points = grp.getPoints();
  
  // If there are any points

  if(points != null){
    noFill();
    stroke(54,65,125);
    strokeWeight(0.3);
    //beginShape();
    for(int i=0; i<points.length; i++){
      //vertex(points[i].x, points[i].y);
      float xx = map(i, 0, points.length, points[0].x, points[points.length-1].x);
      float yyInput = map(xx, points[0].x, points[points.length-1].x, 0, 3*PI);
      float additivecosinewave = -20+120/3*cos(2*yyInput*noise(0.001*millis()));
      float yy = -20+120/2*sin(yyInput)+additivecosinewave;
      line(points[i].x, points[i].y,xx,yy);
    }
    //endShape();
  
    //fill(0);
    /*noFill();
    stroke(0);
    for(int i=0; i<points.length; i++){
      ellipse(points[i].x, points[i].y,20,20);  
    }*/
  }
  //noLoop();
}