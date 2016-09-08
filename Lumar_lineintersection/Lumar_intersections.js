var thelines = [];
var numoflines = 12;
function setup() {
  createCanvas(800,800);
  for(var i=0; i<numoflines; i++){
    thelines.push(new Linemaker());
  }
}
function draw() {
  background(255,235,230);
  for(var i=0; i<thelines.length;i++){//goes through each line in the array
    thelines[i].draw();
    for(var j = i+1; j<thelines.length; j++){//compares it to all the lines behind it
      var xintersect=(thelines[i].b -thelines[j].b)/(thelines[j].slope - thelines[i].slope);//SEE NOTES
      var yintersect = xintersect*thelines[i].slope+thelines[i].b;
      //if the xintersect is within the domain of both lines, the circle is drawn
      if(xintersect>thelines[i].startX && xintersect<thelines[i].endX &&
        xintersect>thelines[j].startX && xintersect<thelines[j].endX){
        stroke(255);
        strokeWeight(1);
        fill(190,210,255,200);
        ellipse(xintersect, yintersect, 20,20);
      }
    }
  }
}
function Linemaker() { 
  this.startX = random(0,width/2);
  this.startY = random(0,height);
  this.endX = random(width/2,width);//SEE NOTES
  this.endY = random(0,height);
  this.slope = (this.endY-this.startY)/(this.endX-this.startX);//m = delta y/ delta x
  this.b = this.startY-this.slope*this.startX;//b = y-mx
  this.draw = function(){
    stroke(245,170,175);
    strokeWeight(4);
    line(this.startX, this.startY, this.endX, this.endY);
  }
}
function mousePressed(){
  clear();
  println("clear has been done and array is "+thelines.length);
  thelines=[];//clears the array that holds all the object lines
  for(var i=0; i<numoflines; i++){
    thelines.push(new Linemaker());//puts new obj lines into the array
  }
}
/* NOTES:
endX always greater than width/2 ensures THE slope
isn't thrown off by having an end point of a line closer to the
origin than the starting point*/