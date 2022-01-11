float amplitude = 200; // pixel
float period = 100; // frame

void setup() {
  size(600, 200);
}

void draw() {

  noStroke();
  fill(255, 50);
  rect(0, 0, width, height);

  float x = amplitude * cos(TWO_PI * (frameCount/period));

  fill(0);
  ellipse(width/2 + x, height/2, 100, 100);
  
  stroke(0);
  line(width/2, height/2, width/2 + x, height/2); 
}
