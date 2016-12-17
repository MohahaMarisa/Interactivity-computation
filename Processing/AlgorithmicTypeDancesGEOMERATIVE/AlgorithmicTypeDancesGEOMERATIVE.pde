import geomerative.*;
//import cardboard.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;

import peasy.*;
PeasyCam cam;

DMachine DM;
float h2;//=height/2
float w2;//=width/2
float d2;//=diagonal/2
float CAPHEIGHT = 300;
// determines the main artboard size (radius)
float ArtboardRadius = 500;

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
ArrayList<Starpoint> starArray = new ArrayList<Starpoint>();
IntList inventoryOfEndpointi = new IntList();
int index = 0;
float letterXmax=0;
float pointsArrayIndexOfMax=0;
void setup() {
  //fullScreen(PCardboard.STEREO);
  inventoryOfEndpointi.append(0);
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("R", "Comfortaa_Bold.ttf", 400, LEFT);
  
  size( 1280, 720, P3D );
  d2 = dist(0, 0, w2, h2);
  colorMode(HSB, 100);
  cam = new PeasyCam(this, 100);
  cam.lookAt(650, 300, 0);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  cam.setDistance(800);
  cam.setYawRotationMode();
  ortho();
  smooth();
  background(0);
  strokeCap(CORNER);
  
  n1 = radians(180);
  n2 = n1 + nShift;

  DM = new DMachine();
  fDM = createGraphics(width, height,P3D);
  
  starArray.add(new Starpoint(width/2, height/2,0));
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(1);
  points = grp.getPoints();
  for(int i=0; i<points.length;i++){//need to map the letter data to the size of the cycloid thingy
    points[i].y = points[i].y+120;
   }
}

void draw() {
  background(0);
  // draw Artboard (BIG CIRCLE)
  noFill();
  stroke(100);
  strokeWeight(1);
  ellipse(width/2, height/2, ArtboardRadius*2, ArtboardRadius*2);

  // draw Initial Points (Begin Points)
  DM.draw1stBeginPoint(n1, Radius1st, speedModif1st);
  DM.draw2ndBeginPoint(n2, Radius2nd, speedModif2nd);
  DM.CalculateEndPoint(armlength);

  float distances = dist(DM.tX, DM.tY, width/2,height/2);
  //float zz = map(distances,0,ArtboardRadius, 0,CAPHEIGHT);// letterXmax
  float zz = 0;
  
  stroke(100);
  line(DM.tX,DM.tY,0,DM.tX,DM.tY,zz);
  int sizeOfArray = starArray.size()%10000;
  starArray.add(new Starpoint(DM.tX, DM.tY,sizeOfArray));

  for (int i = 1; i < starArray.size()-1; i++) {
    Starpoint point = starArray.get(i);
    point.render();
    if (!(point.hasBeenChecked)){
      point.findIfMaxLetter(starArray.get(i-1),starArray.get(i+1),i);
    }else if(point.hasBeenChecked && !(point.endCurve) && (inventoryOfEndpointi.get(inventoryOfEndpointi.size()-1)>i)){
      if(!(point.mapped)){
        for(int j=1;j<inventoryOfEndpointi.size();j++){
          if(i<inventoryOfEndpointi.get(j)&&i>inventoryOfEndpointi.get(j-1)){
            int indexOfTarget = inventoryOfEndpointi.get(j);
            int indexOflastEndpoint = inventoryOfEndpointi.get(j-1);
            point.mappingToEndpoints(i, starArray.get(indexOfTarget).z, indexOfTarget, indexOflastEndpoint, starArray.get(indexOflastEndpoint).z) ;//determines the endZ
          }
        }
      }else if(point.mapped){
        point.moveTowardsEndZ();
      }
    }
  }
}
class Starpoint {
  boolean hasBeenChecked = false;
  boolean endCurve = false;
  boolean mapped = false;
  float x, y, z, endZ;
  float hue;
  Starpoint(float xx, float yy, int arraySize){
    hue = map(arraySize,0,9999,0,100);
    x = xx;
    y = yy;
     //calculate z position from DM.tx and ty
    float distance = dist(xx, yy, width/2,height/2);
    //z = map(distance,0,ArtboardRadius, 0, CAPHEIGHT);
    z=0;
  }
  void render(){
    pushMatrix();
    //color is mapped according to where it is in the array to ensure a rainbow no matter how many points there are
    stroke(hue,100,100);
    translate(0,0,z);
    point(x,y,1);
    popMatrix();
  }
  void moveTowardsEndZ(){
    z = 0.9*z+0.1*endZ;
  }
  void mappingToEndpoints(int currentPointIndex, float targetZ, int targetEndpointindex, int lastEndpointindex, float lastZ){//mapping between 0 and the next end point
    //mapped to 0
    //endZ = map(currentPointIndex,lastEndpointindex,targetEndpointindex, 0,targetEndpointZ);
    endZ = map(currentPointIndex,lastEndpointindex,targetEndpointindex,lastZ,targetZ);
    mapped = true;
    //endZ=;
    
  }
  void findIfMaxLetter(Starpoint p1,Starpoint p2, int index){
    if((p1.x>=this.x && p2.x>=this.x)|| (p1.x<=this.x && p2.x<=this.x)||(p1.y>=this.y && p2.y>=this.y)|| (p1.y<=this.y && p2.y<=this.y)){
      this.endCurve=true;
      addEndCurveIndexValueToGlobalArraylist(index);
      //clearly it's an edge, go search for an appropriate z
      FloatList inventoryZ = new FloatList();//stores the multiple possible z's
          for (int j=0; j<points.length; j++){
            float ltrY = points[j].y;//they have to match y values generally
            if (this.y>ltrY-1+height/2 && this.y<ltrY+1+height/2){inventoryZ.append(points[j].x);}
   
          }
          inventoryZ.append(0);
          this.endCurve=true;
          addEndCurveIndexValueToGlobalArraylist(index);
          //which of the posible z's will it take from the inventory?
          println(inventoryZ.size()); 
          int whichZ = floor(random(0,inventoryZ.size()-1));
          println("whichZ "+whichZ);
          this.z = inventoryZ.get(whichZ);
    }else{
    float radialDistance = sq(p1.x-width/2)+sq(p1.y-height/2);
    float radialDistance1 = sq(this.x-width/2)+sq(this.y-height/2);
    if (radialDistance>=radialDistance1){//is it bigger farther away?
    //if it is, is the next one smaller?
      float radialDistance2 = sq(p2.x-width/2)+sq(p2.y-height/2);
      
      if (radialDistance>=radialDistance2){//is it smaller?//aka, is it an end point
      
        //clearly it's an edge, go search for an appropriate z
        FloatList inventoryZ = new FloatList();
          for (int j=0; j<points.length; j++){
            float ltrY = points[j].y;//they have to match y values generally
            if (this.y>ltrY-1+height/2 && this.y<ltrY+1+height/2){inventoryZ.append(points[j].x);}
          }
          this.endCurve=true;
          addEndCurveIndexValueToGlobalArraylist(index);
          inventoryZ.append(0);
          //which of the posible z's will it take from the inventory?
          int whichZ = int(random(0,inventoryZ.size()-1));
          this.z = inventoryZ.get(whichZ);
          //for(int l =0; l<inventoryZ.size(); l++){//half of the x is will get the smallest z position, the other half the biggest
          //    this.endCurve=true;
          //    addEndCurveIndexValueToGlobalArraylist(index);
          //    if (letterXmax > inventoryZ.get(l) && DM.tX>width/2){this.z = inventoryZ.get(l);letterXmax = this.z;}
          //    if (letterXmax < inventoryZ.get(l) && DM.tX<width/2){this.z = inventoryZ.get(l);letterXmax = this.z;}
          //}
        }
      }
    }
      this.hasBeenChecked = true;
      
    }
}
void addEndCurveIndexValueToGlobalArraylist(int indexValue){
   inventoryOfEndpointi.append(indexValue);
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