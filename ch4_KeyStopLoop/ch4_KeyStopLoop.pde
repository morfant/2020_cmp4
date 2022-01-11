boolean makeStop = false;

void setup() {
  
  size(500, 500);
  
}

void draw() {

  background(random(255), random(255), random(255));
  
}

void keyPressed() {

  if (key == 'a') {
    
  }
  
  if (key == '9') {
    
  }

  if (keyCode == ENTER) {
    if (makeStop == false) {
      makeStop = true;
      noLoop();
    } else {
      makeStop = false;
      loop();
    }
  }
  
}
