int x = 0;
int y = 0;

void setup() {

  size(400, 400);
  rectMode(CENTER);
}


void draw() {

  x = mouseX;
  y = mouseY;
  noFill();
  background(255);
  //rect(x, y, width/2, height/2);
  PVector origin = new PVector(width/2, height/2);
  PVector mousePos = new PVector(mouseX, mouseY);

  float arcStart = 0;
  float dist = PVector.dist(origin, mousePos);
  float maxDist = sqrt(width/2*width/2 + height/2*height/2);
  float arcEnd = arcStart + dist/maxDist*TWO_PI;
  
  arc(x, y, width/4, height/4, arcStart, arcEnd);  
  
}
