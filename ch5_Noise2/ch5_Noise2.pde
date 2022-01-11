float a, b;
float xoff, yoff;

void setup() {
  xoff = 0;
  yoff = 20;
}

void draw() {
  a = noise(xoff);
  b = noise(yoff);

  xoff += 0.01;
  yoff += 0.01;
  
  println(a + " - " + b);
  
}
