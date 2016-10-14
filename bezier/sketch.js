function setup() {
  createCanvas(400, 400);
}

function draw() {
  background("lightgray");



  for (var i = 0; i < 20; i++) {
    push();
    scale(1 + i / 30, 1 + i / 30.0);
    var R = map(i, 0, 19, 0, 255);
    fill(R, 0, 0);

    var x1 = 130;
    var y1 = 120;
    var x2 = 200;
    var y2 = 120 + (20 + i * 3) * sin(millis() / 100.0);
    var x3 = 180;
    var y3 = 165;
    var x4 = 130;
    var y4 = 175;
    var x5 = x4 + i / 5 * (x4 - x3);
    var y5 = y4 + i / 5 * (y4 - y3);


    noStroke();
    beginShape();
    vertex(x1, y1);
    bezierVertex(x2, y2, x3, y3, x4, y4);
    bezierVertex(x5, y5, 20, 25, 30, 20);
    endShape();

    pop();
  }
  /*
    fill("red");
    ellipse(x1, y1, 8, 8);
    fill("green");
    ellipse(x2, y2, 8, 8);
    fill("blue");
    ellipse(x3, y3, 8, 8);
    fill("gold");
    ellipse(x4, y4, 8, 8);
    fill("magenta");
    ellipse(x5, y5, 8, 8);

    line(x1, y1, x2, y2);
    line(x3, y3, x4, y4);
    */

}