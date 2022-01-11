import java.util.Iterator;
ParticleSystem ps;
PVector gravity; 


void setup() {
  size(500, 500);
  ps = new ParticleSystem(new PVector(width/2, 50));
  gravity = new PVector(0, 0.02);
}

void draw() {
  background(255);

  ps.addParticle();
  //ps.applyForce(gravity);
  ps.attractEachother();
  //ps.update();
  ps.run();
}

void mousePressed() {
  ps.origin = new PVector(mouseX, mouseY);
}
