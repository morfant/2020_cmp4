int x, y;
void setup()
{
  size(400, 400);
  frameRate(4);
  x = 0;
  y = 0;
}

void draw()
{
  translate(x, y);
  background(0);
  
  strokeWeight(10);
  noStroke();

  //eyes
  ellipseMode(CENTER);
  fill(random(255), random(255));  
  ellipse(170, 150, 20, 20); 
  ellipse(230, 150, 20, 20);

  //head  
  stroke(255, 0, 0);
  noFill();
  ellipse(200, 150, 100, 100);

  //body  
  rectMode(CORNER);
  noStroke();
  fill(90);
  rect(180, 206, 40, 80);

  //arms
  stroke(90);
  strokeWeight(10);
  line(180, 230, 140, 260);
  line(220, 230, 260, 260);
  
  // change position
  x = (int)random(-width/2, width/2);
  y = (int)random(-height/2, height/2);
  
}
