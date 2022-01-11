float r1 = 160;
float r2 = 270;
float m1 = 40;
float m2 = 10;
float a1 = PI/2;
float a2 = PI/2;
float a1_v = 0;
float a2_v = 0;
float a1_a = 0.01;
float a2_a = -0.001;
float g = 1;
float px2 = -1;
float py2 = -1;
float cx, cy;

PGraphics canvas;


void setup () {
  size (1000, 1000);
  cx = width/2;
  cy = 300;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1 - 2 * a2);
  float num3 = -2 * sin(a1 - a2) * m2;
  float num4 = a2_v * a2_v * r2 + a1_v * a1_v * r1 * cos(a1 - a2);
  float den = r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));

  a1_a = (num1 + num2 + num3 * num4) / den; 


  num1 = 2 * sin(a1 - a2);
  num2 = (a1_v * a1_v * r1 * (m1 + m2) + g * (m1 + m2) * cos(a1) + a2_v * a2_v * r2 * m2 * cos(a1 - a2)); 
  a2_a = num1 * num2 / den;

  //background(255);
  image(canvas, 0, 0);
  stroke(0);
  strokeWeight(2);

  translate(cx, cy);
  float x1 = sin(a1) * r1;
  float y1 = cos(a1) * r1;

  float x2 = sin(a2) * r2 + x1;
  float y2 = cos(a2) * r2 + y1;


  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);


  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);


  a1_v += a1_a;
  a2_v += a2_a;

  a1 += a1_v;
  a2 += a2_v;

  // damping
  //a1_v *= 0.999;
  //a2_v *= 0.999;

  canvas.beginDraw();
  canvas.translate(cx, cy);
  canvas.strokeWeight(1);
  canvas.stroke(0);

  if (frameCount > 1) {
    canvas.line(px2, py2, x2, y2);
  }

  canvas.point(x2, y2);
  canvas.endDraw();

  px2 = x2;
  py2 = y2;
}
