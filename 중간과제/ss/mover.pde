class Mover {
  float v, v1, mass, red, green, blue, grid_size;
  int x, y, alpha;
  PVector pos, force;
  PVector vel;
  PVector acc;


  Mover(int s) { 
    v = 1+random(4);
    v1 = 1+random(4);
    x = (int)random(800);
    y = (int)random(height/2, height-200);
    red = random(255);
    green = random(255);
    blue = random(255);
    grid_size = s;
    pos = new PVector(x, y);
    acc = new PVector(0, 0);
    vel = new PVector(v, v1);
    //force = new PVector(0, 0.1*mass);
  }

  void force() {
    for (int i=0; i<width; i+=grid_size) {
      for (int j=0; j<height/2; j+=100) {
        alpha = (int)map(i, 0, width, 255, 10); 
        float r = map(i, 0, width, red, 255);
        float g = map(j, 0, height, green, 255);
        float b = map(i, 0, width, 0, blue);
        if (pos.y<=j && pos.x>i) {
          force = new PVector(0, map(r+g+b, 0, 255*3, -0.001, 0.001));
          println(force);
          acc.add(force);
        } else {
          force = new PVector(0, 0);
          acc.add(force);
        }
      }
    }
  }

  void render(float m) {
    mass = m;
    fill(0);
    ellipse(pos.x, pos.y, m, m);
    vel.add(acc);
    pos.add(vel); 
    vel.limit(10);
  }

  void display_grid () {
    stroke(0);
    pushMatrix();
    for (int i=0; i<width; i+=grid_size) {
      for (int j=0; j<height/2; j+=100) {
        alpha = (int)map(i, 0, width, 255, 10); 
        float r = map(i, 0, width, red, 255);
        float g = map(j, 0, height, green, 255);
        float b = map(i, 0, width, 0, blue);
        //rectMode(CENTER);  
        fill(r,g,b,alpha);
        rect(i, j, grid_size, grid_size);
        if (pos.y< 400) {
          fill(pos.x, pos.y, b, alpha);
          rect(i, j, grid_size, grid_size);
        }
      }
    }
    popMatrix();
  }

  void checkEdge(int Bar_width, int Bar_Height) {
    if (pos.x < mass/2) {
      vel.x *= -1;
    } else if (pos.x > width - mass/2) {
      vel.x *= -random(1, 1.5);
    } 
    if (mass<Bar_width) {
      if (pos.x+mass/2 <= mouseX + Bar_width && 
        pos.y+mass/2>=height-50 &&
        pos.x-mass/2>= mouseX) {
        vel.y *= -random(1, 2);
      }
    } else if (mass>=Bar_width) {
      if (pos.x <= mouseX + Bar_width && 
        pos.y+mass/2>=height-50 ) {
        vel.y *= -random(1, 2);
      }
    }
    if (pos.y < mass/2) {
      vel.y *= -1;
    }
  }
}
