ArrayList<ParticleSystem> pss = new ArrayList<ParticleSystem>();
PImage img;
boolean direction = true;

void setup() {
  size(800, 800);
  img = loadImage("particle.png");
  blendMode(ADD);

  float rx = random(width/2 - 100, width/2 + 100);
  float ry = random(height/2 - 100, height/2 + 100);
  pss.add(new ParticleSystem(rx, ry));
}

void draw() {
  background(0);

  for (ParticleSystem ps : pss) {
    if (direction == false) {
      ps.runBack();
    } else {
      ps.run();
    }
  }
}

void mousePressed() {

  direction = !direction;
}
