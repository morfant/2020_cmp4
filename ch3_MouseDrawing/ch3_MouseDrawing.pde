int rectSize = 1;

void setup()
{
  size(400, 400);
  background(0);
}

void draw()
{
  stroke(255);
  rectMode(CENTER);
  rect(mouseX, mouseY, rectSize, rectSize);  
}

void mousePressed() {
  rectSize = 10;
}

void mouseReleased() {
  rectSize = 1;
}
