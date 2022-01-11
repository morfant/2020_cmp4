color bg_col;
String url = "https://coolors.co/baa7b0-b2abbf-b1b5c8-bfd5e2-c7ebf0";
String[] colors;

void setup() {
  //bg_col = color(100, 200, 100);
  bg_col = #FFCC11;
  colors = createPalette(url);
}

void draw() {
  //println(red(bg_col));
  background(bg_col);
  //println(colors.length);
  
  String s = colors[1];
  background(unhex(s));
  
  
}

//B1B5C8
//https://coolors.co/baa7b0-b2abbf-b1b5c8-bfd5e2-c7ebf0


String[] createPalette(String _url) {
  int slash_index = _url.lastIndexOf('/');
  String pallate_str = _url.substring(slash_index + 1);
  String[] arr = pallate_str.split("-");
  for (int i = 0; i < arr.length; i++) {
    arr[i] = "ff" + arr[i];
  }
  return arr;
}
