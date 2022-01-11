int[] cols = {#2d3142, #4f5d75, #bfc0c0, #ffffff, #ef8354};
float bxoff, byoff, exoff, eyoff;
float step = 0.01;
void setup() {
  size(500, 500);
  background(255);
  bxoff = 10;
  byoff = 20;
  exoff = 100;
  eyoff = 76;
}

void draw() {
  //background(255);
  //strokeWeight(4);
  int r = (int)random(5); // 0, 1, 2, 3, 4
  stroke(cols[r]);
  
  float bx = noise(bxoff); // 0.0 ~ 1.0
  float by = noise(byoff);
  float ex = noise(exoff);
  float ey = noise(eyoff);
  
  line(bx * width, by * height, ex * width, ey * height);
  
  bxoff = bxoff + random(step);
  byoff = byoff + random(step);
  exoff = exoff + random(step);
  eyoff = eyoff + random(step);
  
}
