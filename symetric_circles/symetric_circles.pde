float dia = 400;
float angle;
float sW_max;

void setup () {
  //size(900, 900);
  fullScreen();
  //surface.setLocation(1600, 70);
  strokeCap(CORNER);
  stroke(255);
  angle = 0;
  
} 

void draw() {
  background(0, 40, 65);

  dia = lerp(dia, mouseX, 0.1);

  translate(width/2, height/2);
  rotate(angle);
  for (int a = 0; a < 360; a+=30) {
    pushMatrix();
    rotate(radians(a));

    for (int r = 0; r < 180; r+=8) {
      float sW = map(cos(radians(r)), -1, 1, sW_max, 1);
      strokeWeight(sW);
      line(sin(radians(r))*dia, cos(radians(r))*dia, sin(radians(-r))*dia, cos(radians(-r))*dia);
    }

    popMatrix();
  }

  angle += TWO_PI/720; // 360 degree rotation every 720 frames passed.

  float sW_angle = map(dia, 0, width, 0, 360);
  sW_angle = constrain(sW_angle, 180, 360);
  sW_max = map(cos(radians(sW_angle)), -1, 1, 1, 255);
  noFill();
  stroke(255);
  ellipse(0, 0, dia*2, dia*2);
}
