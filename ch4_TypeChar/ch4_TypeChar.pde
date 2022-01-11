char c = ' ';

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  
  background(0);
  
  stroke(255);
  textSize(32);
  text(c, 100, 100);
}

void keyPressed() {

  c = key; 

}
