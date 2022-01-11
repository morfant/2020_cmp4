PVector location;
PVector velocity;
float r = 10;
float zRange = 200;
float bouncingMargin = 10;


void setup() {

  size(400, 400, P3D);

  velocity = new PVector(random(-10, 10), random(5, -5), random(5, -5));
  location = new PVector(width/2, height/2, 0);

  lights();
  translate(location.x, location.y, location.z);
  sphere(r);
  
}


void draw() {

  background(255, 40);
  //fill(255, 10);
  //rect(0, 0, width, height);
  
  // draw box
  pushMatrix();
  translate(width/2, height/2, 200);
  noFill();
  box(zRange);
  popMatrix();
  
  // ball
  location.add(velocity);
  //println(velocity.z);
  //println(location.z);
  translate(location.x, location.y, location.z);
  sphere(r);


  if (location.x + velocity.x + r/2 >= width || location.x + velocity.x - r/2 < 0) {
    velocity.x = velocity.x * -1;
  }

  if (location.y + velocity.y + r/2>= height || location.y + velocity.y - r/2 < 0) {
    velocity.y = velocity.y * -1;
  }

  if (location.z + velocity.z + r/2 >= bouncingMargin || location.z + velocity.z - r/2 < -1 * zRange) {
    velocity.z = velocity.z * -1;
  }
}
