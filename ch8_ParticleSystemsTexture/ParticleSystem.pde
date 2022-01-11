class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity, acceleration;
  float mass = 1;
  int type = 0;

  ParticleSystem(PVector location, int ty) {
    origin = location.get();
    particles = new ArrayList<Particle>();

    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.0);
    type = ty;
  }

  void update() {    
    velocity.add(acceleration);
    velocity.limit(6);
    origin.add(velocity);

    acceleration.mult(0);
    
    if (random(1) > 0.5) {
     // acceleration = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    }

    edge();
  }

  void applyForce(PVector f) {

    PVector a = f.div(mass);
    acceleration.add(a);    

    Iterator<Particle> it = particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();
      p.applyForce(f);
    }
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
    particles.add(new Particle(origin, type));
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
