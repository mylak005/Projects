float x = 0;
float y = 0;
float w = 20;
float scl;

void setup() {
  size(800, 800);
  background(255);
  scl = width / w;
}

void draw() {
  stroke(0);
  noFill();
  float r = random(1);
  
  if (r < 0.5) {
     bezier(x, y + scl/2, x + scl/4, y + scl/2, x + scl/2, y + scl/1.5, x + scl/2, y + scl);
     bezier(x+scl/2, y, x + scl/2, y + scl/4, x + scl/1.5, y + scl/2, x + scl, y + scl/2);
  } else  {
     bezier(x + scl/2, y + scl, x + scl/2, y + scl/1.5, x + scl/1.5, y + scl/2, x + scl, y + scl/2);
     bezier(x+scl/2, y, x + scl/2, y + scl/4, x + scl/4, y + scl/2, x, y + scl/2);
  }
  
  x += scl;
  
  if (x > width - scl) {
    x = 0;
    y += scl;
  }
  
  if (y > height - scl) {
    save("10PRINTBEZIER_1.png");
    background(255);
    x = 0;
    y = 0;
  }
  
}
