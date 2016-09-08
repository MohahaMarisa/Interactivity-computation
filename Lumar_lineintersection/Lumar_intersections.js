var thelines = [];
var numoflines = 12;
function setup() {
  createCanvas(800,800);
  for(var i=0; i<numoflines; i++){
    thelines.push(new Linemaker());
  }
}
function draw() {
  background(200,140,180);
  for(var i=0; i<thelines.length;i++){//goes through each line in the array
    thelines[i].draw();
    for(var j = i+1; j<thelines.length; j++){//compares it to all the lines behind it
      var xintersect=(thelines[i].b -thelines[j].b)/(thelines[j].slope - thelines[i].slope);//SEE NOTES
      var yintersect = xintersect*thelines[i].slope+thelines[i].b;
      //if the xintersect is within the domain of both lines, the circle is drawn
      if(xintersect>thelines[i].startX-2 && xintersect<thelines[i].endX+2 &&
        xintersect>thelines[j].startX-2 && xintersect<thelines[j].endX+2){/*SEE NOTES FOR WHY THERE'S 
        '+2' AND '-2', BECAUSE IT ISN'T ACTUALLY NEEDED*/
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
  this.endX = random(this.startX,width);//SEE NOTES
  this.endY = random(0,height);
  this.slope = (this.endY-this.startY)/(this.endX-this.startX);//m = delta y/ delta x
  this.b = this.startY-this.slope*this.startX;//b = y-mx
  this.draw = function(){
    stroke('pink');
    strokeWeight(1);
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

"+2" or "-2" is just
to ensure that when lines come reeeeeeaaally close to intersecting and look like they intersect
but don't actually, there is still a circle there because otherwise ppl might mistake it for 
the code being unable to do what it claims it does

  endX always greater than startX ensures THE slope
isn't thrown off by having an end point of a line closer to the
origin than the starting point*/