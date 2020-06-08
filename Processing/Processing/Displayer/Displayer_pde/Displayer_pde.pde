char c;
String value;
PFont font;
float y = 0;
float z = 0;
float symbolSize = 60;
float hue = 0;

void setup() {
  fullScreen();
  background(0);
  colorMode(HSB);
  font = loadFont("Candara-48.vlw");
}

void draw() {
  textAlign(LEFT, TOP);
  c = (char)(0x0600 + hue);
  value = Character.toString(c);
  
  fill(hue, 255, 255);
  textSize(symbolSize);
  text(value, y, z);
  
  y += symbolSize;
  if (y > width) {
    y = 0;
    z += symbolSize;
    hue++;
  }
  if (z > height) {
    background(0);
    z = 0;
    hue++;
  }
  
  if (hue > 255) {hue = 0;}
  hue++;
}
