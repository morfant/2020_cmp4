Attractor[] attractors = new Attractor[1000];

void setup() {
  size(1000, 1000);

  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(4));
  }

  background(255);
}

void draw() {

  fill(255, 120);
  rect(0, 0, width, height);
  //background(255);

  for (int i = 0; i < attractors.length; i++) {
    for (int j = 0; j < attractors.length; j++) {
      if (i != j) {
        PVector f = attractors[j].attract(attractors[i]);  
        attractors[i].applyForce(f);
      }
    }
    attractors[i].update();
    attractors[i].checkEdge();
    attractors[i].display();
    
  }
}
