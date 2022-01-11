float mouseX_, mouseY_;

void setup() {
  size(400, 400);

}

void draw() {
  background(255);
  stroke(0);
  curve(mouseX, mouseY, 100, 100, 300, 300, mouseX_, mouseY_);
  noStroke();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 3, 3);
  ellipse(mouseX_, mouseY_, 3, 3);
    
}


void mouseDragged() {

  mouseX_ = mouseX;
  mouseY_ = mouseY;
}
