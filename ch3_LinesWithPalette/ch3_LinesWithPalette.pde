color[] cols = new color[5];

void setup() {
  size(400, 400);

  //https://coolors.co/000000-14213d-fca311-e5e5e5-ffffff
  cols[0] = #000000;
  cols[1] = #14213d;
  cols[2] = #fca311;
  cols[3] = #e5e5e5;
  cols[4] = #ffffff;
  
  background(255);
}

void draw() {

  stroke(cols[int(random(cols.length - 1))]);
  line(random(width), random(height), random(width), random(height));
}
