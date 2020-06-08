float x = 0;
float y = 0;
float w = 20;
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
  
  if (r < 0.25) {
     line(x, y, x + scl, y);
     line(x + scl, y, x + scl, y + scl);
  } else if (r < 0.5) {  
     line(x + scl, y, x + scl, y + scl);
     line(x + scl, y + scl, x, y + scl);
  } else if (r < 0.75) {
     line(x, y, x, y + scl);
     line(x, y + scl, x + scl, y + scl);
  } else {  
     line(x + scl, y, x + scl, y + scl);
     line(x + scl, y + scl, x, y + scl);
  }
  
  x += scl;
  
  if (x > width - scl) {
    x = 0;
    y += scl;
  }
  
  if (y > height - scl) {
    save("10PRINT7.jpg");
    background(50, 102, 255);
    x = 0;
    y = 0;
  }
  
}
