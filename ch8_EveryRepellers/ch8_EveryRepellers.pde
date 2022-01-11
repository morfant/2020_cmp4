import java.util.Iterator;
Repeller repeller;
ParticleSystem ps;
PVector gravity; 


void setup() {
  size(500, 500);
  ps = new ParticleSystem(new PVector(width/2, 50));
  repeller = new Repeller(50, new PVector(width/2 - 20, 140));
  gravity = new PVector(0, 0.08);
}

void draw() {
  background(255);

  ps.addParticle();
  ps.applyForce(gravity);
  ps.applyRepeller(repeller);
  //ps.update();
  ps.run();

  repeller.display();
}
