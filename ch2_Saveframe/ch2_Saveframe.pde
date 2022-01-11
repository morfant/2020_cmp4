void setup() {
  size(400, 400);
  frameRate(4);

}

void draw() {
  float r = random(255);
  background(r);

  //println(frameCount);
  
  saveFrame("test.png");
}
