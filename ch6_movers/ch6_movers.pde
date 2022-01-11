Mover[] movers = new Mover[7];


void setup() {
  size(500, 500);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(new PVector(random(100, width-100), random(100, height-100)), random(2));
  }
  
}

void draw() {
  background(255);

  for (int j = 0; j < movers.length; j++) {
    if (movers[j] != null) {
      movers[j].update();
      movers[j].checkEdge();
      movers[j].display();
    }
  }
}
