float xoff = 0;
float step = 0.01;
void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  strokeWeight(4);
  
  // noise
  stroke(255, 0, 0);
  float n = noise(xoff); // 0.0 ~ 1.0
  float nx = n * width;
  line(nx, 0, nx, height);
  
  // random
  stroke(0, 0, 255);
  float rx = random(width);
  line(rx, 0, rx, height);
  
  xoff = xoff + step;  
}
