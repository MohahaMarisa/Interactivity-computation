var numInRow;
var numInCol;
var lineLength = 14;
var lines = [];
var borderspace = 2.2*lineLength;//space around the piece in the canvas
var clicked=0;
function setup() {
  createCanvas(700,700);
  background(255);
  numInRow = round((width-borderspace*2)/(lineLength*0.75));
  var rowspacing = (width-borderspace*2)/(numInRow-1);
  numInCol = round((height-borderspace*2)/(lineLength*0.75));
  var colspacing = (height-borderspace*2)/(numInCol-1);
  
  for(var i = 0; i<numInCol; i++){
    var newrow = [];
    for(var j = 0; j<numInRow; j++){
      var rowLine = new Line(10+j*rowspacing,10+i*colspacing);
      newrow.push(rowLine);
    }
    lines.push(newrow);
  }
}
function draw() {
  var noiseIncrement = map(mouseX, 0,width, 0.001,0.01);
  for(var i = 0; i<numInCol; i++){
    for(var j = 0; j<numInRow; j++){
      // why doesn't this work to make moving interruptions: var noisy = noise(0.002*lines[i][j].centerx,0.002*lines[i][j].centery, 0.2*frameCount);
      var noisy = noise(0.0095*lines[i][j].centerx+0.001*frameCount,0.0095*lines[i][j].centery+0.001*frameCount);
      if(noisy>0.38){
        lines[i][j].draw();
      }  
    }   
  }
}
function Line(x,y) {
  this.rotation = randomGaussian(PI/2, PI/4);
  this.centerx = x;
  this.centery = y;
  this.draw = function(){
    this.xx = -lineLength/2;
    push();
      translate(this.centerx, this.centery);
      rotate(this.rotation);
      line(this.xx, 0, -this.xx,0);
    pop();
  }
}
function mouseClicked(){
  clicked++;
  var display = clicked%3;
  textSize(24);
  switch(display) {
    case (1):
        text("Interruptions are nice...", width*0.1, height*0.1, 0.8*width, 40);
        break;
    case (2):
        text("...but silence is golden", width*0.2, height*0.4, 0.8*width, 40);
        break;
    default:
        text("Hush, the movie has started", width*0.3, height*0.7, 0.8*width, 40);
  }
}
