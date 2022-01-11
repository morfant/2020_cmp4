Mover[] movers = new Mover[4000];
Attractor a;

void setup() {
  size(2000, 2000);


  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(0.5);
  }
  a = new Attractor();
  
  background(255);
}

void draw() {

  //fill(255, 40);
  //rect(0, 0, width, height);
  //background(255);

  a.checkEdge();
  a.update();
  //a.display();

  for (int i = 0; i < movers.length; i++) {
    PVector f = a.attract(movers[i]);
 
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].checkEdge();
    movers[i].display();
  }
}
