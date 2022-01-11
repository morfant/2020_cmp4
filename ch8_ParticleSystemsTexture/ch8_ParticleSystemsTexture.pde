import java.util.Iterator;
import java.util.Random;
PImage[] imgs = new PImage[5];
Random generator;

ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

void setup() {
  size(500, 500);

  for (int i = 0; i < 5; i++) {
    imgs[i] = loadImage("particle"+(i+1)+".png");
  }
  generator = new Random();

  systems.add(new ParticleSystem(new PVector(width/2, height/2), 0));
}

void draw() {

  blendMode(ADD);
  background(0);

  float val = 0.8;
  float dx = map(mouseX, 0, width, -val, val);
  float dy = map(mouseY, 0, height, -val, val);
  PVector wind = new PVector(dx, dy);


  for (ParticleSystem ps : systems) {

    ps.addParticle();

    //ps.applyForce(wind);
    ps.update();
    ps.run();
  }
}

void mousePressed() {


  systems.add(new ParticleSystem(new PVector(mouseX, mouseY), ceil(random(4))));
  println("Number of ParticleSystem: " + systems.size());
}
