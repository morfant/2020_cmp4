PVector a, b;

void setup() {

  size(400, 400);

  a = new PVector(100, 0);
  b = new PVector(100, 120);
}

void draw() {

  background(255);
  translate(width/2, height/2);
  line(0, 0, a.x, a.y);

  b.set(mouseX - width/2, mouseY - height/2);
  line(0, 0, b.x, b.y);

  float dot_rslt =
    (a.x/a.mag()) * (b.x/b.mag()) +
    (a.y/a.mag()) * (b.y/b.mag());

  //println(dot_rslt);

  float angle = acos(dot_rslt); // acos: inverse cos()
  println(degrees(angle));
}
