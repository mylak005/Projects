PFont font;

void setup() {
  size(600, 600);
  background(0);
  font = loadFont("Candara-48.vlw");
}

void draw() {
  fill(255);
  char telugu = '\u0C1C';
  text(telugu, width / 2, height / 2);
}
