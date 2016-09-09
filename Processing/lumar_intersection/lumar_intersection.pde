int numoflines = 100;
//datatype[] name = new dataype[#]
Line thelines[] = new Line[0];
void setup() {
  size(800,800);//FX2D high density renderer inside size - fullscreen(renderer,whichscreen); //pixelDensity();
  for(int i=0; i<numoflines; i++){
    thelines = (Line[])append(thelines, new Line());
  }
}
void draw() {
  background(200,130,165); //<>// //<>//
  for(int i=0; i<thelines.length;i++){
    for(int j = i+1; j<thelines.length; j++){//testing all the other lines in the array
      float xintersect=(thelines[i].b -thelines[j].b)/(thelines[j].slope - thelines[i].slope);
      
      if(xintersect>thelines[i].startX && xintersect<thelines[i].endX &&
        xintersect>thelines[j].startX && xintersect<thelines[j].endX){//if the xintersect is within the domain of both lines, the circle is drawn
        float yintersect = xintersect*thelines[i].slope+thelines[i].b;
        noStroke();
        fill(200,220,245,140);
        ellipse(xintersect, yintersect, 20,20);
      }
    }
  }
  for(int i=0; i<thelines.length;i++){//seperate for loop for drawing the lines ensures
  //that the circles appear behind everything!
    thelines[i].draw();
  }
}
class Line { 
  float startX = random(0,width);
  float startY = random(0,height);
  float endX = random(0,width);
  float endY = random(0,height);
  float slope =(endY-startY)/(endX-startX);
  //slope is delta y over delta x 
  float b = startY- slope*startX;//b = y-mx
  void draw(){
    stroke(255,230,230);
    strokeWeight(1);
    line(startX, startY, endX, endY);
  }
}
void mousePressed(){
  Line morelines[] = new Line[0];
  clear();
  for(int i=0; i<numoflines; i++){
    morelines = (Line[])append(morelines, new Line());
  }
  thelines = morelines;
}