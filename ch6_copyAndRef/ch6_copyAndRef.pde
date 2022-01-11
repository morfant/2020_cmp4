int a = 10;
int b = a;

PVector va = new PVector(10, 60);
PVector vb = va;

void setup() {
  size (500, 500);

  b = 20;
  vb.mult(10);
  
  fill(255, 0, 100);
  textSize(50);
  textAlign(CENTER);
  text(vb.x+"/"+vb.y, width/2, height/2);
  
  text(va.x+"/"+va.y, width/2, height/2 + 200);
  
}
