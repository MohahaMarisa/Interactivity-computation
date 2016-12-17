import geomerative.*;
// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

import peasy.*;

PeasyCam cam;
DMachine DM;
float CAPHEIGHT = 400;
float h2;//=height/2
float w2;//=width/2
float d2;//=diagonal/2
// determines the main artboard size (radius)
float ArtboardRadius = 400;

// Animation for starting circles
float Radius1st = floor(random(ArtboardRadius * 0.2, ArtboardRadius * 0.5));
float Radius2nd = floor(random(ArtboardRadius * 0.2, ArtboardRadius * 0.5));
float speedModif1st = floor(random(3)+1);
float speedModif2nd = floor(random(3)+1);

// arm lengths
float armlength = (ArtboardRadius * 1.05) + floor(random(-75, 75));

// beginning location of drawing arm circles and it's speed
float n1, n2;
float nShift = radians(floor(random(45, 135)));
float nSpeed = 0.0005;

// a new layer for the drawing machine
PGraphics fDM;
ArrayList<PVector> starArray = new ArrayList<PVector>();
int index = 0;

int znum=0;
void setup() {
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("B", "Comfortaa_Bold.ttf", 300, CENTER);
  
  size( 1280, 720, P3D );
  colorMode(HSB, 100);
  ortho();
  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2);
  cam = new PeasyCam(this, 100);
  cam.lookAt(650, 300, 0);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  cam.setDistance(300);
  cam.setYawRotationMode();
  smooth();
  background(0);
  strokeCap(CORNER);
  
  n1 = radians(180);
  n2 = n1 + nShift;

  DM = new DMachine();
  fDM = createGraphics(width, height,P3D);
  starArray.add(new PVector(width/2,height/2,0));
}

void draw() {
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(1);
  points = grp.getPoints();
  int numLetter=points.length;
  background(0, map(dist(mouseX, mouseY, w2, h2), 0, d2, 60, -10));
  noFill();
  stroke(100);
  strokeWeight(1);
  ellipse(width/2, height/2, ArtboardRadius*2, ArtboardRadius*2);

  // draw Initial Points (Begin Points)
  DM.draw1stBeginPoint(n1, Radius1st, speedModif1st);
  DM.draw2ndBeginPoint(n2, Radius2nd, speedModif2nd);
  DM.CalculateEndPoint(armlength);


  float zz=0;
  for (int i=1; i<starArray.size()-1; i++){
    float searchY = DM.tY;
    float searchX = DM.tX;
    
    float radialDistance = sq(starArray.get(i-1).x-width/2)+sq(starArray.get(i-1).y-height/2);
    float radialDistance1 = sq(searchX-width/2)+sq(searchY-height/2);
    if (radialDistance1>radialDistance){
      float radialDistance2 = sq(starArray.get(i+1).x-width/2)+sq(starArray.get(i+1).y-height/2);
      if (radialDistance2<radialDistance1){
        //clearly it's an edge, go search for an appropriate z
        for (int j=0; j<points.length; j++){
          float ltrY = points[j].y;
          if (searchY>ltrY-1+height/2 && searchY<ltrY+1+height/2){
            zz = points[j].x;
          }
        }
      }
    }
  }
  stroke(100);
  line(DM.tX,DM.tY,0, DM.tX,DM.tY,zz);
  starArray.add(new PVector(DM.tX,DM.tY,0));
  noFill();
  beginShape();
  for (int i = 0; i < starArray.size(); i++) {
    PVector point = starArray.get(i);
    curveVertex(point.x, point.y, point.z);
  }
  endShape();
  znum++;
  if(keyPressed){
    transformToLetter();
  }
}
void transformToLetter(){
  println("transform");

}
//////////////////
class DMachine {
  float MAxx1, MAyy1;
  float MAxx2, MAyy2;
  float tX, tY;

  float anim;

  DMachine() {
    anim = 0;
  }
  void draw1stBeginPoint(float n1_, float Radius1st_, float speedModif1st_) {
    float MAx1, MAy1;
    MAx1 = width/2 + ArtboardRadius * cos(n1);
    MAy1 = height/2 + ArtboardRadius * -sin(n1);
    stroke(60);
    strokeWeight(1);
    fill(0);
    ellipse(MAx1, MAy1, Radius1st, Radius1st);

    // resets the angle
    n1 -= nSpeed;
    if (degrees(n1) < 0) {
      n1 = radians(360);
    }

    noStroke();
    fill(255);
    MAxx1 = MAx1 + cos(anim * speedModif1st) * Radius1st/2;
    MAyy1 = MAy1 + sin(anim * speedModif1st) * Radius1st/2;
    anim += 0.025;
    fill(60);
    ellipse(MAxx1, MAyy1, 5, 5);
  }

  void draw2ndBeginPoint(float n2_, float Radius2nd_, float speedModif2nd) {
    float MAx2 = width/2 + ArtboardRadius * cos(n2);
    float MAy2 = height/2 + ArtboardRadius * -sin(n2);
    stroke(60);
    strokeWeight(1);
    fill(0);
    ellipse(MAx2, MAy2, Radius2nd, Radius2nd);

    // resets the angle
    n2 -= nSpeed;
    if (degrees(n2) < 0) {
      n2 = radians(360);
    }

    noStroke();
    fill(255);
    MAxx2 = MAx2 + sin(anim * speedModif2nd) * Radius2nd/2;
    MAyy2 = MAy2 + cos(anim * speedModif2nd) * Radius2nd/2;
    anim += 0.025;
    fill(60);
    ellipse(MAxx2, MAyy2, 5, 5);
  }

  void CalculateEndPoint(float armlength_) {
    // "crazy" math stuff here
    // only look if you dare!

    stroke(60);
    fill(60);

    // distance between the two main points
    float a = dist(MAxx1, MAyy1, MAxx2, MAyy2);
    line(MAxx1, MAyy1, MAxx2, MAyy2);

    // the mid-point
    float a2X = lerp(MAxx1, MAxx2, 0.5);
    float a2Y = lerp(MAyy1, MAyy2, 0.5);
    ellipse(a2X, a2Y, 5, 5);

    // The armlength "compensator" aka the triangle height calculator
    float fD1 = abs(sq(armlength) - sq(a/2));
    float fD2 = sqrt(fD1);

    // "compensation" angle 
    float alpha = asin(abs(MAyy1 - MAyy2) / a);

    if (MAyy1 - MAyy2 < 0 && MAxx1 - MAxx2 < 0) {
      // works in between "180-270"
      // a is \ angle
      tX = a2X + fD2 * cos(-PI/2+alpha);
      tY = a2Y + fD2 * sin(-PI/2+alpha);
    } else if (MAyy1 - MAyy2 < 0 && MAxx1 - MAxx2 > 0) {
      // works in between 90-180
      // a is / angle
      tX = a2X + fD2 * cos(PI/2-alpha);
      tY = a2Y + fD2 * sin(PI/2-alpha);
    } else if (MAyy1 - MAyy2 > 0 && MAxx1 - MAxx2 > 0) {
      // works in between 0-90
      // a is \ angle
      tX = a2X + fD2 * cos(PI/2+alpha);
      tY = a2Y + fD2 * sin(PI/2+alpha);
    } else if (MAyy1 - MAyy2 > 0 && MAxx1 - MAxx2 < 0) {
      // works in between 270-360
      // a is / angle
      tX = a2X + fD2 * cos(-PI/2-alpha);
      tY = a2Y + fD2 * sin(-PI/2-alpha);
    }

    // final lines
    line(MAxx1, MAyy1, tX, tY);
    line(MAxx2, MAyy2, tX, tY);
  }
}