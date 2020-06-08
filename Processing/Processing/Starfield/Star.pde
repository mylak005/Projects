class Star {
  float x;
  float y;
  float z;
  
  float pz;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
  }
  
  void update() {
    z-= speed;
    if (z < 1) {
       z = width;
       x = random(-width, width);
       y = random(-height, height);
       pz = z;
    }
  }
  
  void show() {
     float sx = map(x / z, 0, 1, 0, width);
     float sy = map(y / z, 0, 1, 0, height);
 
     float px =  map(x / pz, 0, 1, 0, width);
     float py =  map(y / pz, 0, 1, 0, height);
     
     pz = z;
     stroke(255, 180);
     line(px, py, sx, sy);

  }
}
