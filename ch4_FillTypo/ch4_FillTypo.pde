String str = "HELLO";
PImage canvas;
void setup() {
  size(400, 400);
  background(0);
  textAlign(CENTER);
  textSize(100);
  text(str, width/2, height/2);
  canvas = get();
}
void draw() {
  float x, y;
  x = random(width);
  y = random(height);
  // color = background(255(red), 255(green), 255(blue), 255(alpha));
  if (red(canvas.get((int)x, (int)y)) != 0) {
    float r = random(20);
    fill(random(255), random(100), 80);
    noStroke();
    ellipse(x, y, r, r);
  }
  
  
  
  //background(random(255), random(255), random(255));
  //text(c, width/2, height/2);
}
