void setup() {
    size(600, 600);
    background(0);
}

void draw() {
  stroke(255);
  fill(255, 0, 100);
  translate(width / 2, height / 2);
  
  beginShape();
  for (float a = 0; a < TWO_PI * 12; a += 0.01) {
      float size = 50;
      float r = size * (4 + (5 * a));
      float x = r * cos(a);
      float y = r * sin(a);
      vertex(x, y);
  }
  endShape(CLOSE);
  
}
