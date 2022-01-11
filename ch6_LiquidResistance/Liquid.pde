class Liquid {

  float x, y, w, h;
  float c;  
  
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display() {
    for(int i = 0; i < 200; i++) {
      stroke(100, 100, 150, i * 1.5);
      line(x, y + i, x + w, y + i);
    } 
  }

}
