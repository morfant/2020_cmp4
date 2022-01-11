import java.util.Iterator;

ArrayList<Particle> particles = new ArrayList<Particle>();


void setup() {
    size (600, 600);
    
    textSize(40);
}

void draw() {
    background(255);
    
    particles.add(new Particle(10));
    fill(0);
    text(particles.size(), 100, 100);
    
    noFill();
    
    //for (int i = 0; i < particles.size(); i++) {
    for (int i = particles.size() - 1; i > 0; i--) { // 1)      
      Particle p = particles.get(i);
      p.run();
      
      if (p.isDead() == true) {
        particles.remove(i);
      }
    }
    
    
    /*
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext() == true) {
      
      Particle p = it.next();
      p.run();
      
      if (p.isDead() == true) {
        it.remove();
      }
      
    }
    */
    
    
    
    
    
    
}
