class Friction {
  
  float mew = 0.1;
  PVector friction = new PVector(0, 0);
  
  
  Friction(float m) {
    mew = m;
  }
  
  void cover(Mover m) {
    PVector v = m.velocity.get();
    v.normalize();
    friction = v.mult(-1 * N * mew);
    m.applyForce(friction);
    friction.mult(0);
  }
  
  
}
