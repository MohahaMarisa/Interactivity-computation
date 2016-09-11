var radius = 90;
var diameter = radius*2;
//var strokew = round(diameter/180);
var startr = 245;
var startg = 230;
var startb = 170;
var r = 235;
var g = 100;
var b = 120;
function setup() {
  createCanvas(700,700);
  background(230,230,250);
}

function draw() {
  fill(230,230,250,1.4);
  rect(0,0,width,height);
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
    if(mouseIsPressed){
    }
    else{
      stroke(startr+incrementr*i, startg+incrementg*i,startb+incrementb*i);
      line(mouseX-radius+i,mouseY-lengthOfLine,mouseX-radius+i,mouseY+lengthOfLine);
    }
  }



}