var radius = 90;
var diameter = radius*2;
//var strokew = round(diameter/180);
var startr = 245;
var startg = 230;
var startb = 170;
var r = 235;
var g = 100;
var b = 120;
var t=0;
function setup() {
  createCanvas(700,700);
  background(230,230,250);
}

function draw() {
  startr = 55*noise(t+6)+200;
  startg = 55*noise(t+20)+200;
  startb = 55*noise(t+1)+200;
  r = 210-210*noise(t);
  g = 210-210*noise(t+9);
  b = 210-210*noise(t+4);
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
      push();
        translate(mouseX,mouseY);
        rotate(t*10);
        line(-radius+i,-lengthOfLine,-radius+i,lengthOfLine);
      pop();
    }
  }
  t+=1/1000;
}