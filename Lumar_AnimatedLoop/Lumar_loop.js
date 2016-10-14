// This is a template for creating a looping animation in p5.js. 
// When you press a key, this program will export a series of images
// into an "output" directory located in its sketch folder. 
// These can then later be combined into an animated gif. 
// Known to work with p5.js version 0.5.3
// Prof. Golan Levin, September 2016

//===================================================
// Global variables. 
var nFramesInLoop = 120;
var nElapsedFrames;
var bRecording;
var bIAmRunningThisOnMyLaptop = false;

//===================================================
function setup() {
  createCanvas(200, 200);
  bRecording = false;
  nElapsedFrames = 0;
}

//===================================================
function keyPressed() {
  if (bIAmRunningThisOnMyLaptop) {
    bRecording = true;
    nElapsedFrames = 0;
  }
}

//===================================================
function draw() {
  bIAmRunningThisOnMyLaptop = true;
  // Compute a percentage (0...1) representing where we are in the loop.
  var percentCompleteFraction = 0;
  if (bRecording) {
    percentCompleteFraction = float(nElapsedFrames) / float(nFramesInLoop);
  } else {
    percentCompleteFraction = float(frameCount % nFramesInLoop) / float(nFramesInLoop);
  }

  // Render the design, based on that percentage. 
  renderMyDesign(percentCompleteFraction);

  // If we're recording the output, save the frame to a file. 
  // Note that the output images may be 2x large if you have a Retina mac. 
  // You can compile these frames into an animated GIF using a tool like: 
  if (bRecording & bIAmRunningThisOnMyLaptop) {
    var frameOutputFilename = "mynickname-loop-" + nf(nElapsedFrames, 4) + ".png";
    println("Saving output image: " + frameOutputFilename);
    saveCanvas(frameOutputFilename);
    nElapsedFrames++;
    if (nElapsedFrames >= nFramesInLoop) {
      bRecording = false;
    }
  }
}

//===================================================
function renderMyDesign(percent) {
  background("pink");
  noStroke();
  for (var sy = 0.2*height; sy <= height*0.75; sy += 1) {
    var offsetSinIncrement = map(sy, 0, height*0.75, 0, 4*PI);
    var ellipsePulse = sin(percent * TWO_PI+offsetSinIncrement);
    var cPulse = sin(percent * PI);
    var elliSize = map(ellipsePulse, -1, 1, 20, 50);
    var t = map(sy, 0, height, 0.0, 0.25);
    var ellipseColor = map(cPulse, -1, 1, 128, 255);
    var sx = width/2+25.0 * sin((20*t + percent) * TWO_PI);
    fill(255-sy, 0.2*ellipseColor+255-sy, 0.2*ellipseColor+255-sy);
    ellipse(sx, sy, 0.7*elliSize+25, 0.7*elliSize+25);

  }
    var tt = 5/16;
    var sxx = width/1.8-33.0 * sin((20*tt + percent) * TWO_PI)-4;
    // var sxx = map(sxxx, width/1.8-33.0 * sin((20*tt) * TWO_PI),
    // width/1.8-33.0 * sin((20*tt + 1) * TWO_PI), 
    // (width/1.8-33.0 * sin((20*tt) * TWO_PI)-4),
    // (width/1.8-33.0 * sin((20*tt + 1) * TWO_PI)-7));

    var syy = height*0.74;
    fill(60,110,110);
    var mouthsize = map(elliSize, 20,50, 0,25);
    ellipse(sxx, syy, mouthsize, 0.9*mouthsize);

  for (var sy = height; sy >=height*0.75; sy--) {
    var offsetSinIncrement = map(sy, 0, height*0.75, 0, 4*PI);
    var ellipsePulse = sin(percent * TWO_PI+offsetSinIncrement);
    var cPulse = sin(percent * PI);
    var elliSize = map(ellipsePulse, -1, 1, 20, 50);
    var ellipseColor = map(sy, height, height*0.75, 0, 55);
    if(elliSize <42){
      noFill();
    }
    else{
      fill(200+ellipseColor, 120, 120);
    }
    var t = map(sy, 0, height, 0.0, 0.25);
    var sx = width/1.8+33.0 * sin((20*t + percent) * TWO_PI);
    ellipse(sx, sy, 20,20);
  }
}