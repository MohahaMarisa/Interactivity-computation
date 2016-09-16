var zero = [279,735,179,700,112,595,79,420,79,315,112,140,179,35,279,0,346,0,446,35,512,140,546,315,546,420,512,595,446,700,346,735,279,735]
var one = [179,595,246,630,346,735,346,0]
var two = [112,560,112,595,146,665,179,700,246,735,379,735,446,700,479,665,512,595,512,525,479,455,412,350,79,0,546,0]
var three = [146,735,512,735,312,455,412,455,479,420,512,385,546,280,546,210,512,105,446,35,346,0,246,0,146,35,112,70,79,140]
var four = [412,735, 79,245, 579,245, 54,35,412,735,412,0]
var five = [479,735,146,735,112,420,146,455,246,490,346,490,446,455,512,385,546,280,546,210,512,105,446,35,346,0,246,0,146,35,112,70,79,140]
var six = [512,630,479,700,379,735,312,735,212,700,146,595,112,420,112,245,146,105,212,35,312,0,346,0,446,35,512,105,546,210,546,245,512,350,446,420,346,455,312,455,212,420,146,350,112,245]
var seven = [546,735,212,0,54,35,79,735,546,735]
var eight = [246,735,146,700,112,630,112,560,146,490,212,455,346,420,446,385,512,315,546,245,546,140,512,70,479,35,379,0,246,0,146,35,112,70,79,140,79,245,112,315,179,385,279,420,412,455,479,490,512,560,512,630,479,700,379,735,246,735]
var nine = [512,490,479,385,412,315,312,280,279,280,179,315,112,385,79,490,79,525,112,630,179,700,279,735,312,735,412,700,479,630,512,490,512,315,479,140,412,35,312,0,246,0,146,35,112,105]
var radius = 90;
var diameter = radius*2; 
//var strokew = round(diameter/180);
// var startr = 245;
// var startg = 230;
// var startb = 170;
var r = 235;
var g = 100;
var b = 120;
var t=0;
var light = [255,255,255,255,255,255,255,255,255,255,255,255
              150,150,150,150,150,150,150,150,150,150];
var shadow = [100,100,100,100,100,100,100,100,100,100,100,100];
function setup() {
  createCanvas(700,700);
  background(230,230,250);
}

function draw() {
  // Fetch the current time
  var H = hour();
  var M = minute();

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
      
      push();
        translate(mouseX,mouseY);
        rotate(t*10);
         stroke(startr+incrementr*i, startg+incrementg*i,startb+incrementb*i);
         line(-radius+i,-lengthOfLine,-radius+i,lengthOfLine);
        
      pop();
    }
  }
  t+=1/1000;
}
function HourCircle(){
  this.lightr = 245;
  this.lightg = 230;
  this.lightb = 170;
  this.shadowr = 235;
  this.shadowg = 100;
  this.shadowb = 120;
  this.x = 0.1 * width;
  this.y = 10 * height;
  this.changeColor = function(){

  }
}
function MinuteCircle(){
  this.changeColor = function(){
    
  }
}
function changing(){

}
