String letters = "";
int back = 102;

void setup() {
  size(100, 100);
  textSize(16);
  textAlign(CENTER);
}

void draw() {
  background(back);
  text(letters, 50, 50);
}

void keyPressed() {
  if ((key == ENTER) || (key == RETURN)) {
    letters = letters.toLowerCase();
    println(letters); // Print to console to see input
    if (letters.equals("black")) {
      back = 0;
    } else if (letters.equals("gray")) {
      back = 204;
    }
    letters = ""; // Clear the variable
  } else if ((key != CODED)) {
    // If the key is alphanumeric, add it to the String
    letters = letters + key;
  }
}
