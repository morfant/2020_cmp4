float a, b, c, d;
float step = 15.0;

boolean prA, prB, prC, prD;

void setup() {
  size(500, 500);
  surface.setLocation(2000, 100);
}

void draw() {

  background(255);
  stroke(0);

  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  // check condition
  if (mouseX < width/2 && mouseY < height/2) {
    a = a + step;
    if (mousePressed) {
      prA = true;
    } else {
      prA = false;
    }
  } else {
    a = a - step;
  }

  if (mouseX > width/2 && mouseY < height/2) {
    b = b + step;
    if (mousePressed) {
      prB = true;
    } else {
      prB = false;
    }
  } else {
    b = b - step;
  }

  if (mouseX < width/2 && mouseY > height/2) {
    c = c + step;
    if (mousePressed) {
      prC = true;
    } else {
      prC = false;
    }
  } else {
    c = c - step;
  }

  if (mouseX > width/2 && mouseY > height/2) {
    d = d + step;
    if (mousePressed) {
      prD = true;
    } else {
      prD = false;
    }
  } else {
    d = d - step;
  }


  // set color & draw
  fill(a);
  if (prA) {
    fill(255, 0, 0);
    println("A");
  }
  rect(0, 0, width/2, height/2);

  fill(b);
  if (prB) {
    fill(255, 0, 0);
    println("B");
  }
  rect(width/2, 0, width/2, height/2);

  fill(c);
  if (prC) {
    fill(255, 0, 0);
    println("C");
  }
  rect(0, height/2, width/2, height/2);

  fill(d);
  if (prD) {
    fill(255, 0, 0);
    println("D");
  }
  rect(width/2, height/2, width/2, height/2);


  a = constrain(a, 0, 255);
  b = constrain(b, 0, 255);
  c = constrain(c, 0, 255);
  d = constrain(d, 0, 255);
}
