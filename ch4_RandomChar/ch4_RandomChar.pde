float x = 33;
float y = 60;
char c = 'a';

void setup() {
  size(500, 500);
  textSize(50);
  noStroke();
}

void draw() {
  fill(204, 10);
  rect(0, 0, width, height);
  fill(0);

  x = random(width);
  y = random(height);
  
  c = (char)random(33, 126); 

  text(c, x, y);
  //filter(BLUR);
}

void keyPressed() {
  println((int)key);
}
