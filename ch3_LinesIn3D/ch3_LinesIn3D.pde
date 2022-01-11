color[] cols = new color[5];
String url = "https://coolors.co/03045e-0077b6-00b4d8-90e0ef-caf0f8";
String[] colors;

float xoff = random(10);
float yoff = random(10);
float zoff = random(10);
float xeoff = random(10);
float yeoff = random(10);
float zeoff = random(10);



float step = 0.01;

void setup() {
  size(600, 600, P3D);

  //https://coolors.co/000000-14213d-fca311-e5e5e5-ffffff
  cols[0] = #000000;
  cols[1] = #14213d;
  cols[2] = #fca311;
  cols[3] = #e5e5e5;
  cols[4] = #ffffff;

  colors = createPalette(url);
  //for(int i = 0; i < colors.length; i++) {
  //  println(colors[i]);
  //}

  background(255);
}

void draw() {


  float nx = noise(xoff);
  float ny = noise(yoff);
  float nz = noise(zoff);
  float rx = map(nx, 0, 1, 0, width);
  float ry = map(ny, 0, 1, 0, height);
  float rz = map(ny, 0, 1, 0, height);

  nx = noise(xeoff);
  ny = noise(yeoff);
  nz = noise(zeoff);
  float rex = map(nx, 0, 1, 0, width);
  float rey = map(ny, 0, 1, 0, height);
  float rez = map(nz, 0, 1, -10, 10);

  line(rx, ry, rz, rex, rey, rez);

  float d = dist(rx, ry, rz, rex, rey, rez);
  float dmax = dist(0, 0, -10, width, height, 10);
  int col = (int)constrain(map(d, 0, width/2, 0, 4), 0, 4); 
  println(col);

  String colStr = colors[col];
  stroke(int(unhex(colStr)));


  xoff = xoff + random(step);
  yoff = yoff + random(step);
  xeoff = xeoff + random(step);
  yeoff = yeoff + random(step);
}


String[] createPalette(String _url) {
  int slash_index = _url.lastIndexOf('/');
  String pallate_str = _url.substring(slash_index + 1);
  String[] arr = pallate_str.split("-");
  for (int i = 0; i < arr.length; i++) {
    arr[i] = "ff" + arr[i]; // when using hex string to color, alpha value should be at first.
  }
  return arr;
}
