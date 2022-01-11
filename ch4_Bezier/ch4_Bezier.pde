float mouseX_, mouseY_;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  noFill();
  stroke(255, 102, 0);
  line(30, 20, mouseX, mouseY);
  line(mouseX_, mouseY_, 30, 75);
  stroke(0, 0, 0);

  bezier(30, 20, mouseX, mouseY, mouseX_, mouseY_, 30, 75);
}

void mouseDragged() {

  mouseX_ = mouseX;
  mouseY_ = mouseY;
}
