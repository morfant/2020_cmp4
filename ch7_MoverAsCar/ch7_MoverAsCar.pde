Mover car;

void setup() {
  size(500, 500);

  car = new Mover(new PVector(random(100, width-100), random(100, height-100)), 1);
}

void draw() {
  background(255);

  car.update();
  car.checkEdge();
  car.display();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    PVector acc = new PVector(0.1, 0);
    car.applyForce(acc);
  } 

  if (keyCode == LEFT) {
    PVector acc = new PVector(-0.1, 0);
    car.applyForce(acc);
  }
  
  if (keyCode == UP) {
    PVector acc = new PVector(0, -0.1);
    car.applyForce(acc);
  }

  if (keyCode == DOWN) {
    PVector acc = new PVector(0, 0.1);
    car.applyForce(acc);
  }
  
}
