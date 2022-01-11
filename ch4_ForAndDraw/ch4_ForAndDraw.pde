int cnt = 0;
float x, y;

void setup() {
  size (600, 600);
  background(255);
  x = random(width);
  y = random(height);
}

void draw() {

  //for (int i = 0; i < 50; i+=25) {
  ellipse(x, y, 50 - cnt, 50 - cnt);
  cnt = cnt + 3;

  if (cnt >= 49) {
    x = random(width);
    y = random(height);
    cnt = 0;
  }

  //}

  //ellipse(random(width), random(height), 80, 80);
}
