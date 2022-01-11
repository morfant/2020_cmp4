PImage canvas;
int xstep = 1;
int ystep = 3;
int max_height = 60;
 
void setup() {
  size(600, 400, P3D);
  background(0);
  fill(255);
  textSize(128);
  textAlign(CENTER);
  text("HELLO", width/2, height/2);
  filter(BLUR, 8);
  canvas = get();
}
 
void draw() {
  background(0);
  strokeWeight(2);
  stroke(255);
  float b, z, px, pz;
  translate(width/2, height/2,-20);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(mouseY,0,height,-PI,PI));
 
  translate(-width/2, -height/2);
  for (int y = 0; y < height; y+=ystep) {
    px = -1;
    pz = 0;
    for (int x = 0; x < width; x+=xstep) {
      b = brightness(canvas.get(x,y));
      z = map(b, 0, 200, 0, max_height);
      //stroke(color(b));
      strokeWeight(z/60*20);
      //stroke(255, z/60*255);
      line(px, y, pz, x, y, z);
      px = x;
      pz = z;
    }
  }
}
