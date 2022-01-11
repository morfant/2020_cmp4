import java.util.Iterator;


ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.update();
    ps.run();
  }
}

void mousePressed() {

  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  println("Number of ParticleSystem: " + systems.size());
}
