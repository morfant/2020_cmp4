class Pendulum {

  float r;
  float angle;
  float aVel;
  float aAcc;
  PVector origin;
  PVector loc;
  float rad;
  float damping = 0.999999;
  float mass;


  Pendulum(float ox, float oy, float _r, float _m) {
    origin = new PVector(ox, oy);
    loc = new PVector(0, 0);
    angle = PI/2;
    r = _r;
    aVel = 0;
    aAcc = 0;
    mass = _m;
    rad = mass*2;
  }

  Pendulum(Pendulum p, float _r, float _m) {
    origin = new PVector(p.loc.x, p.loc.y);
    loc = new PVector(0, 0);
    angle = PI/4;
    r = _r;
    aVel = 0;
    aAcc = 0;
    mass = _m;
    rad = mass*2;
  }

  void setOrigin(float x, float y) {
    origin.set(x, y);
  }

  void update() {
    float gravity = 0.4;
    aAcc = (-1 * gravity * sin(angle)) / r / mass;
    aVel = aVel + aAcc;
    angle = angle + aVel;

    aVel *= damping;
  }


  void display() {

    loc.x = sin(angle) * r;
    loc.y = cos(angle) * r;

    pushMatrix();
    translate(origin.x, origin.y);
    fill(0);
    ellipse(loc.x, loc.y, rad, rad);
    stroke(0);
    line(0, 0, loc.x, loc.y);
    popMatrix();
  }
}
