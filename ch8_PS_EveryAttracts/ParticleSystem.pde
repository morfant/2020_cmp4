class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity, acceleration;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();

    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  }

  void attractEachother() {
    for (int i = 0; i < particles.size(); i++) {
      Particle pi = particles.get(i);
      for (int j = 0; j < particles.size(); j++) {
        if (i != j) {
          Particle pj = particles.get(j);
          PVector f = pj.attract(pi);
          pi.applyForce(f);
        }
      }
    }
  }
  
  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
    }
  }
  
  void applyRepeller(Repeller r) {
    for (Particle p : particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  
  void update() {    
    velocity.add(acceleration);
    velocity.limit(20);
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
