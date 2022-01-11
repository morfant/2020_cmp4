class ParticleSystem {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector location;
  int numParticle = 100;

  ParticleSystem(float x, float y) {
    location = new PVector(x, y);

    for (int i = 0; i < numParticle; i++) {
      //Particle p = new Particle(random(3), x, y);
      ParticleTexture p = new ParticleTexture(random(3), x, y);
      particles.add(p);
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  void goback() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.goback();
    }
  }


  void run() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
    }
  }

  void runBack() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.runBack();
    }
  }
}
