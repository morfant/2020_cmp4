float r=150;
float theta=-90;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
  //background(255);

  noStroke();
  fill(0);
  translate(width/2, height/2);
  
  float x = r*cos(radians(theta));
  float y = r*sin(radians(theta));
  
  stroke(0);
  line(0, 0, x, y);
  
  theta+=1;
}
