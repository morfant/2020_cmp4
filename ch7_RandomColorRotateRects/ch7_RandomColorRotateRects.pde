float angle = 0;

void setup() {
  size(500, 500);
  noStroke();
  background(255);
  fill(random(255), random(255), random(255));
}

void draw() {

  translate(width/2, height/2);


  rotate(radians(angle));
  rect(0, 0, 100, 20);

  if (frameCount % 30 == 0) {
    angle += 20;
    fill(random(255), random(255), random(255));
  }
}
