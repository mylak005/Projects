float x = 0;
float y = 0;
float w = 40;
float scl;

void setup() {
  size(800, 800);
  background(50, 102, 255);
  scl = width / w;
}

void draw() {
  stroke(255);
  strokeWeight(4);
  float r = random(1);
  
  if (r < 0.5) {
     line(x, y, x + scl, y + scl);
  } else  {
     line(x, y + scl, x + scl, y);
  }
  
  x += scl;
  
  if (x > width - scl) {
    x = 0;
    y += scl;
  }
  
  if (y > height - scl) {
    save("10PRINT2.jpg");
    background(50, 102, 255);
    x = 0;
    y = 0;
  }
  
}
