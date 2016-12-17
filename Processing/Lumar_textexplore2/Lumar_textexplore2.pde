import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

void setup(){
  // Initilaize the sketch
  size(900,400);
  frameRate(24);

  // Choice of colors
  background(0);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("JENNY HU", "Comfortaa_Bold.ttf", 140, CENTER);

  // Enable smoothing
  smooth();
}

void draw(){
  // Clean frame
  background(0);
  
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  
  // Draw the group of shapes
  noFill();
  noStroke();
  //stroke(0,0,200,150);
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  
  // Get the points on the curve's shape
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  //RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  RG.setPolygonizerLength(3);
  points = grp.getPoints();
  
  // If there are any points

  if(points != null){
    noFill();
    stroke(255);
    strokeWeight(1);
    colorMode(HSB, 255); 
    //beginShape();
    for(int i=1; i<points.length; i++){
 
      
      float dx = points[i].x - points[i-1].x; 
      float dy = points[i].y - points[i-1].y; 
      float orientation = atan2(dy,dx); 
      float myHue = map(orientation, -PI,PI, 0,255); 
      stroke(myHue,255,200); 
      
      float px = points[i].x;
      float py = points[i].y;
      float len  = random(3,6); 
      line(px,py, px+ len*dy, py-len*dx);
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