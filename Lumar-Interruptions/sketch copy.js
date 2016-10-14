var numInRow;
var lineLength = 14;
var lines = [];
var borderspace = 30;//space around the piece in the canvas
function setup() {
  createCanvas(700,700);
  background(255);
  numInRow = round((width-borderspace*2)/(lineLength*0.75));
  var rowspacing = (width-borderspace*2)/(numInRow-1);
  println("numInRow = "+numInRow);
  numInCol = round((height-borderspace*2)/(lineLength*0.75));
  var colspacing = (height-borderspace*2)/(numInCol-1);
  
  for(var i = 0; i<numInCol; i++){
    var newrow = [];
    for(var j = 0; j<numInRow; j++){
      var rowLine = new Line(10+j*rowspacing,10+i*colspacing);
      newrow.push(rowLine);
      newrow[j].draw();
    }
    lines.push(newrow);
  }
  for(var i = 0; i<lines.length; i++){
    var row = lines[i];
    for(var j = 0; j<row.length; j++){
      row[j].draw();
    }
  }
}

function draw() {
  
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