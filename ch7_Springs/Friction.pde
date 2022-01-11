class Friction {

  float mew = 0.01;
  PVector friction;

  Friction(float _mew) {
    mew = _mew;
    friction = new PVector(0, 0);
  }

  void connect(Mover m) {
    PVector v = m.velocity.get(); // make a copy of m.vel as v
    v.normalize();
    friction = v.mult(-1 * N * mew);
    
    m.applyForce(friction);
  }
}
