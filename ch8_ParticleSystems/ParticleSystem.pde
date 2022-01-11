class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity, acceleration;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();

    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.0);
  }

  void update() {    
    velocity.add(acceleration);
    origin.add(velocity);
    
    edge();
  }

  void edge() {

    if (origin.x < 0) {
      origin.x = width;
    } else if (origin.x > width) {
      origin.x = 0;
    }
    if (origin.y < 0) {
      origin.y = height;
    } else if (origin.y > height) {
      origin.y = 0;
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();
      p.run();

      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
