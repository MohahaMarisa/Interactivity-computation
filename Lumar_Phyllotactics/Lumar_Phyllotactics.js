var howManyHex=7200;
var step=1;//how big the sides of the hexagon will be
var angle=137.507764//golden angle
var increment=1;
var turtle;
var i=1;
function setup() {
    createCanvas(700, 700);
    background(80,80,150);
    turtle =new Turtle(width/2,height/2);

   /* for(var i=1; i<howManyHex; i++){

      turtle.setColor(color(255-i/4,i/15,i));
      hexagon(turtle, step);
      turtle.forward(increment);//each successive hex is farther away from the last
      turtle.right(angle);
      increment+=.1;
    }*/
}
function draw(){
  if(i<howManyHex){
    var min = i%60;
    if(min > 0 && min <10){
      turtle.setColor(color(255-i/4,i/15,i));
    }
    else{
      //turtle.setColor(color(i/4,i/15,255-i));
      turtle.setColor(color(255,255,255),20);
    }
    hexagon(turtle, step);
    turtle.forward(increment);//each successive hex is farther away from the last
    turtle.right(angle);
    increment+=.1;
    i++;
  }
}
function hexagon(turtle, step){//this draws a hexagon..self explanatory?
      
      var hexAngle=60;//angle of the outside (180-hexagon inner angle)

      turtle.forward(step/2);
      turtle.right(hexAngle*2);
      turtle.penDown();
      turtle.forward(step);
      turtle.right(hexAngle);
      turtle.forward(step);
      turtle.right(hexAngle);
      turtle.forward(step);
      turtle.right(hexAngle);
      turtle.forward(step);
      turtle.right(hexAngle);
      turtle.forward(step);
      turtle.right(hexAngle);
      turtle.forward(step);
      turtle.right(hexAngle*2);
      turtle.penUp();
      turtle.forward(step)/2;
      turtle.right(180); 
}

function Turtle(x, y) {
  this.x = x;
  this.y = y;
  this.angle = 0.0;
  this.penIsDown = true;
  this.color = color(255, 100,180);
  this.weight = 1;
 
  this.left = function(d) {
    this.angle -= d;
  };
  this.right = function(d) {
    this.angle += d;
  };
  this.forward = function(p) {
    var rad = radians(this.angle);
    var newx = this.x + cos(rad) * p;
    var newy = this.y + sin(rad) * p;
    this.goto(newx, newy);
  };
  this.back = function(p) {
    this.forward(-p);
  };
  this.penDown = function() {
    this.penIsDown = true;
  };
  this.penUp = function() {
    this.penIsDown = false;
  };
  this.goto = function(x, y) {
    if (this.penIsDown) {
      stroke(this.color);
      strokeWeight(this.weight);
      line(this.x, this.y, x, y);
    }
    this.x = x;
    this.y = y;
  };
  this.distanceTo = function(x, y) {
    return sqrt(sq(this.x - x) + sq(this.y - y));
  };
  this.angleTo = function(x, y) {
    var absAngle = degrees(atan2(y - this.y, x - this.x));
    var angle = ((absAngle - this.angle) + 360) % 360.0;
    return angle;
  };
  this.turnToward = function(x, y, d) {
    var angle = this.angleTo(x, y);
    if (angle < 180) {
      this.angle += d;
    } else {
      this.angle -= d;
    }
  };
  this.setColor = function(c) {
    this.color = c;
  };
  this.setWeight = function(w) {
    this.weight = w;
  };
  this.face = function(angle) {
    this.angle = angle;
  }
}