void setup() {
  size (500, 500);
}

void draw() {
  
  background(
  (float)mouseX/width * 255,
  (float)mouseY/height * 255,
  0
  );
  
   
  //Switch these line with above lines and see the result.
  /*
  background(
  mouseX/width * 255,
  mouseY/height * 255,
  0
  );
  */
}
