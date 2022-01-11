Mover[] movers = new Mover[300];
Attractor[] attrs = new Attractor[3];
float attrsMass = 30;

void setup() {
  size(1000, 1000);
  background(255);


  PVector aLoc = new PVector(random(width), random(height));
  attrs[0] = new Attractor(aLoc, attrsMass);
  attrs[1] = new Attractor(new PVector(100, 100), attrsMass);
  attrs[2] = new Attractor(new PVector(600, 800), attrsMass);


  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(4));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < attrs.length; j++) {
      PVector f = attrs[j].attract(movers[i]);
      movers[i].applyForce(f);
    }
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }

  attrs[0].location = new PVector(mouseX, mouseY);

  for (int j = 0; j < attrs.length; j++) {
    attrs[j].display();
  }
  
  fill(100, 200, 200);
  text(attrs[0].mass, attrs[0].location.x, attrs[0].location.y);
  textAlign(CENTER);
  textSize(30);
}

void keyPressed() {
  if (keyCode == UP) {
    attrs[0].mass += 1;
  }
  
  if (keyCode == DOWN) {
    if (attrs[0].mass > 1) {
      attrs[0].mass -= 1;
    }
  }
}
