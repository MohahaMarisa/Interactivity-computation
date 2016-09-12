// Daniel Shiffman
// http://codingrainbow.com
// http://patreon.com/codingrainbow
// Code for this video: https://youtu.be/Cl_Gjj80gPE

var tree = [];
var walkers = [];
//var r = 4;
var maxWalkers = 50;
var iterations = 1000;
var radius = 8;
var hu = 0;
var shrink = 0.995;

function setup() {
  createCanvas(400, 400);
  colorMode(HSB);
  // for (var x = 0; x < width; x += r * 2) {
  //   tree.push(new Walker(x, height));
  // }

  tree[0] = new Walker(width / 2, height / 2);
  radius *= shrink;
  for (var i = 0; i < maxWalkers; i++) {
    walkers[i] = new Walker();
    radius *= shrink;
  }
}

function draw() {
  background(0);

  for (var i = 0; i < tree.length; i++) {
    tree[i].show();
  }

  for (var i = 0; i < walkers.length; i++) {
    walkers[i].show();
  }

  for (var n = 0; n < iterations; n++) {
    for (var i = walkers.length - 1; i >= 0; i--) {
      walkers[i].walk();
      if (walkers[i].checkStuck(tree)) {
        walkers[i].setHue(hu % 360);
        hu += 2;
        tree.push(walkers[i]);
        walkers.splice(i, 1);
      }
    }
  }

  var r = walkers[walkers.length - 1].r;
  while (walkers.length < maxWalkers && radius > 1) {
    radius *= shrink;
    walkers.push(new Walker());
  }

}
// var prevSec;
// var millisRolloverTime;

// //--------------------------
// function setup() {
//   createCanvas(300, 300);
//   millisRolloverTime = 0;
// }

// //--------------------------
// function draw() {
//   background(255,200,200); // My favorite pink

//   // Fetch the current time
//   var H = hour();
//   var M = minute();
//   var S = second();

//   // Reckon the current millisecond, 
//   // particularly if the second has rolled over.
//   // Note that this is more correct than using millis()%1000;
//   if (prevSec != S) {
//     millisRolloverTime = millis();
//   }
//   prevSec = S;
//   var mils = floor(millis() - millisRolloverTime);

//   fill(128,100,100);
//   text("Hour: "   + H, 10, 22);
//   text("Minute: " + M, 10, 42);
//   text("Second: " + S, 10, 62);
//   text("Millis: " + mils, 10, 82);

//   var hourBarWidth   = map(H, 0, 23, 0, width);
//   var minuteBarWidth = map(M, 0, 59, 0, width);
//   var secondBarWidth = map(S, 0, 59, 0, width);

//   // Make a bar which *smoothly* interpolates across 1 minute.
//   // We calculate a version that goes from 0...60, 
//   // but with a fractional remainder:
//   var secondsWithFraction   = S + (mils / 1000.0);
//   var secondsWithNoFraction = S;
//   var secondBarWidthChunky  = map(secondsWithNoFraction, 0, 60, 0, width);
//   var secondBarWidthSmooth  = map(secondsWithFraction,   0, 60, 0, width);

//   noStroke();
//   fill(40);
//   rect(0, 100, hourBarWidth, 50);
//   fill(80);
//   rect(0, 150, minuteBarWidth, 50);
//   fill(120)
//   rect(0, 200, secondBarWidthChunky, 50);
//   fill(160)
//   rect(0, 250, secondBarWidthSmooth, 50);
// }
