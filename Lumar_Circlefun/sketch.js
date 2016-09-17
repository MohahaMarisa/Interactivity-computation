var radius = 90;
var diameter = radius*2;
//var strokew = round(diameter/180);
var startr = 245;
var startg = 230;
var startb = 170;
var r = 235;
var g = 100;
var b = 120;
//var length of the circle line = radius(sin(i))
//var length of circle line = radius(sin(arccos(adjacent/hypotenuse))
function setup() {
  createCanvas(700,700);
  //angleMode(DEGREES);
  background(230);
}

function draw() {
  //half circle
  for (var i = 1; i <= 180; i++){
    var incrementr = (r-startr)/180;
    var incrementg = (g-startg)/180;
    var incrementb = (b-startb)/180;
    var angle = (i/180)*Math.PI;
    //fullcircle
    var lengthOfLine = Math.abs(radius*(Math.sin(Math.acos((90-i)/radius))));
    //halfcircle
    //var lengthOfLine = Math.abs(radius*(Math.sin(Math.acos(i/radius))));
    //diamond
    //var lengthOfLine = Math.abs(radius*(Math.sin(angle)));
    stroke(startr+incrementr*i, startg+incrementg*i,startb+incrementb*i);
    line(mouseX-radius+i,mouseY-lengthOfLine,mouseX-radius+i,mouseY+lengthOfLine);
  }
  /*if(mouseIsPressed){
    fill(255,200,200);
  }
  else{
    fill(255);
  }
  stroke(220,170,170,30);
  ellipse(mouseX,mouseY,80,80);*/
}