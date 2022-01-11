PVector loc, vel, mouse;
int r = 20;

void setup() {
  size(500, 500);
  loc = new PVector(width/2, height/2);
  vel = new PVector(1.0, 1.0);
}

void draw() {
  
  mouse = new PVector(mouseX, mouseY);
  background(255);
  
  //loc = loc + vel 
  loc.add(vel);
  
  fill(0);
  noStroke();
  ellipse(loc.x, loc.y, r, r); 

  PVector diff = PVector.sub(loc, mouse);
  
  fill(200, 100, 100);
  rect(0, 0, diff.mag(), 10);
  
  if (loc.x > width) {
    loc.x = 0;
  } else if (loc.x < 0) {
    loc.x = width;
  } else if (loc.y > height) {
    loc.y = 0;
  } else if (loc.y < 0) {
    loc.y = height;
  }
  
  stroke(100, 200, 100);
  strokeWeight(10);
  line(mouse.x, mouse.y, loc.x, loc.y);
  
  
}
