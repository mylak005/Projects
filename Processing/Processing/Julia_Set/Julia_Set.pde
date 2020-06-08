void setup() {
  fullScreen();
  colorMode(HSB, 1);
}
void draw() {
  background(255);
  float creal = map(mouseX, 0 ,width, -2, 2);
  float cimg = map(mouseY, 0 ,height, -2, 2);
  float w = 4;
  float h = (w * height) / width;
  float xmin = -w/2;
  float ymin = -h/2; 
  loadPixels();
  int maxiterations = 100;
  float xmax = xmin + w;
  float ymax = ymin + h;
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  float y = ymin;
  for (int j = 0; j < height; j++)  {
     float x = xmin;
     for (int i = 0; i < width; i++) {
       float a = x;
       float b = y;
       int n = 0;
       while (n < maxiterations) {
         float aa = a * a;
         float bb = b * b;
         float twoab = 2.0 * a * b;
         a = aa - bb + creal;
         b = twoab + cimg;
         if (a * a + b * b > 16.0) {
           break; 
         }
         n++;
       }  
       
       if (n == maxiterations) {
         pixels[i + j * width] = color(0);
       } else {
         float hue = sqrt(float(n) / maxiterations);
         pixels[i + j * width] = color(hue, 255, 255);
        
       }
       x += dx;
     }
     y += dy;
  }
  updatePixels();
  if (mousePressed) {
    save("julia6.png");
  }
}
