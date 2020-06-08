final float phi = (sqrt(5) + 1) / 2;
final float c = 4;

float angle;
float n = 0;
float r;
float x, y;
  
void setup() {
  fullScreen();
  background(255);
}

void draw() {
  translate(width / 2, height / 2);
  angle = n * radians(360 / phi);
  r = c * sqrt(n); 
  
  x = r * cos(angle);
  y = r * sin(angle);
  
  stroke(0, 0, 0);
  strokeWeight(3);  
  point(x, y);  
  
  n++;
  
  if (mousePressed) {
    save("PhyloTaxis.png");
  }
}
