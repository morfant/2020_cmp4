class ParticleTexture extends Particle {

  ParticleTexture(float m, float x, float y) {
    super(m, x, y);
  }

  void display () {
    imageMode(CENTER);
    tint(255, 255);
    image(img, location.x, location.y, 100, 100);
  }
}
