float angle = 0;
float angleVel = 0.6;
float amplitude = 100;

void setup() {
  size(500, 500);

  background(255);
  
  for (int x = 0; x < width; x += 24) {
    float y = amplitude * sin(angle);
    
    fill(0, 100);
    ellipse(x, height/2 + y, 100, 100);
    
    angle += angleVel;
  }
  
}
