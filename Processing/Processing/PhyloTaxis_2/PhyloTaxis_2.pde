float var = 0.9999;
final float c = 4;

float angle;
float r;
float x, y;  
float hu = 0;
  
void setup() {
  size(600, 600);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  strokeWeight(3);
  
  for (int n = 0; n < 200; n++) {
    angle = n * radians(360 / var);
    r = c * sqrt(n); 
    x = r * cos(angle);
    y = r * sin(angle);
    stroke(floor(hu), 255, 255);  
    point(x, y);  
    hu += 0.4;
    if (hu > 255) {
      hu = 0;
    }
  }
  
  var += 0.0001;
  text(var, 100, 100);
}
