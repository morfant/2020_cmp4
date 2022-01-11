String str = "CMP4";
char[] chars = {'C', 'M', 'P', '4'};

void setup() {
  size(600, 400);
  background(0);
  fill(255);
  textSize(128);
  textAlign(CENTER);
  
  //text("CMP4", width/2, height/2);
  //text(str, width/2, height/2);
  
  for (int i = 0; i < chars.length; i++) {
    text(chars[i], width/2 + (80 * (i - 2)), height/2);
  }
  
  
}
