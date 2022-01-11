class Particle {

  PVector location, velocity, acceleration;
  float lifespan;
  float mass = 1;
  int type = 0;

  Particle() {
    location = new PVector(random(width), random(height));
    float vx = (float)generator.nextGaussian() * 0.6;
    float vy = (float)generator.nextGaussian() * 0.6 - 1.0;
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);

    lifespan = 255;
  }

  Particle(PVector l, int ty) {
    location = l.get();
    float vx = (float)generator.nextGaussian() * 0.3;
    float vy = (float)generator.nextGaussian() * 0.3 - 1.0;
    //float vx = random(-0.3, 0.3);
    //float vy = random(-0.7, 0.7);
    velocity = new PVector(vx, vy);    
    acceleration = new PVector(0, 0);
    type = ty;

    lifespan = 255;
  }

  void applyForce(PVector f) {
    PVector a = f.div(mass);

    acceleration.add(a);
  }

  void update() {
    velocity.add(acceleration);
    //velocity.limit();
    location.add(velocity);

    acceleration.mult(0);

    lifespan -= 10;
  }

  void display() {
    imageMode(CENTER);
    tint(255, lifespan);
    //image(imgs[ceil(random(4))], location.x, location.y, 40, 40);
    image(imgs[type], location.x, location.y, 80, 80);    
    //stroke(0, lifespan);
    //fill(175, lifespan);
    //ellipse(location.x, location.y, 8, 8);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }


  void run() {
    update();
    display();
  }
}
