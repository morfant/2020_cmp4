String str = "abc"; // char[]
String str2 = "hi";
String str3 = "black";
int bg = 0;
void setup() {
  size(500, 500);

  textSize(100);
  textAlign(CENTER);
}

void draw() {
  background(bg);
  text(str, width/2, height/2);
  
  if (str.equals(str2) == true) {
    bg = 255;
  } else if (str.equals(str3) == true) {
    bg = 0;
  }
}

void keyPressed() {
  str = str + key;
  
  if (keyCode == ENTER) {
    str = "";
  }
  
}
