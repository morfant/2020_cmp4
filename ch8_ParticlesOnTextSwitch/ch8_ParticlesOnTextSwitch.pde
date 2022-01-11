import java.util.Iterator;
import java.util.Random;
import java.util.Collections;

Random generator;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<PVector> fontPos = new ArrayList<PVector>();
PGraphics pg;
PFont font;
float gap = 2;
String[] str = {"아이고", "미미야", "사랑해"};
boolean direction = true; // true : shape text, false : spread everywhere
int strIdx = 0;

void getTextPos(String s) {

  // clear positions on text
  if (fontPos.size() > 0) {
    for (int i = fontPos.size() - 1; i >= 0; i--) {
      fontPos.remove(i);
    }
  }

  // draw text on pg
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

  // get positions on text
  for (int x = 0; x < width; x += gap) {
    for (int y = 0; y < height; y += gap) {
      color target = color(255, 255, 255);
      if (pg.get(x, y) == target) {
        fontPos.add(new PVector(x, y));
      }
    }
  }


  if (particles.size() == 0) {
    // add particles as size of fontPos
    for (int i = 0; i < fontPos.size(); i++) {
      particles.add(new Particle(random(width), random(height)));
    }
  } else {
    // add or remove particles as size of fontPos
    int diff = fontPos.size() - particles.size();
    
    if (diff > 0) { // font > particles
      for (int i = 0; i < diff; i++) {
        particles.add(new Particle(
        (float)generator.nextGaussian() * 100 + width/2, 
        (float)generator.nextGaussian() * 30 + height/2));
      }
    } else { // font < particles
      for (int i = particles.size() - 1; i >= fontPos.size(); i--) {
        particles.remove(i);
      }
    }
  }

  // shuffle order of fontPos
  Collections.shuffle(fontPos);

  //println("fontPos.size():"+fontPos.size());
  //println("particles.size():"+particles.size());
}

void setup() {
  size(800, 800);
  generator = new Random();
  font = createFont("PassionItself", 300);

  getTextPos(str[strIdx]);
}

void draw() {
  background(255, 100, 100);

  for (int i = particles.size() - 1; i >= 0; i--) {

    Particle p = particles.get(i);
    if (!direction) {
      p.goToPlace(i);
    } 
    p.update(direction);
    p.display();

    if (p.isDead() == true) {
      particles.remove(i);
    }
  }

  // if you need automation
  //if (frameCount % 10 == 0) {
  //  if (random(1) > 0.5) {
  //    direction = !direction;
  //  }
  //}
}

void mousePressed() {
  if (direction) {
    strIdx ++;
    strIdx = strIdx % str.length;
  } else {
    getTextPos(str[strIdx]);
  }

  direction = !direction;
}


void keyPressed() {
  if (key == '1' || key == '2' || key == '3') {
    getTextPos(str[(int)key - 48 - 1]);
  }

  if (keyCode == ENTER) {
    direction = !direction;
  }
}
