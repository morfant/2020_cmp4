import java.util.Iterator;
import java.util.Random;

ArrayList<Particle> particles = new ArrayList<Particle>();
PGraphics pg;
PFont font;
float gap = 5;
boolean direction = true;
Random generator;
String[] str = {"아이고", "미미야", "사랑해"};
int strIdx = 0;

void setTextParticle(String s) {

  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0);
  pg.textFont(font);
  pg.textSize(300);
  pg.fill(255);
  pg.textAlign(CENTER, CENTER);
  pg.text(s, width/2, height/2);
  pg.blendMode(DIFFERENCE);
  pg.endDraw();

  for (int x = 0; x < width; x += gap) {
    for (int y = 0; y < height; y += gap) {
      //boolean isText = pg.get(x, y).colo
      color target = color(255, 255, 255);
      if (pg.get(x, y) == target) {
        particles.add(new Particle(x, y));
      }
    }
  }
}

void setup() {
  size(800, 800);
  generator = new Random();
  font = createFont("PassionItself", 300);

  setTextParticle(str[0]);
}

void draw() {
  background(255, 100, 100);

  Iterator<Particle> it = particles.iterator();
  while (it.hasNext() == true) {

    Particle p = it.next();
    p.run(direction);

    if (p.isDead() == true) {
      it.remove();
    }
  }
}

void mousePressed() {
  direction = !direction;
  strIdx ++;
}
