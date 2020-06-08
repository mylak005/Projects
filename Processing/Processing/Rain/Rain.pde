Raindrop[] drops = new Raindrop[500];

void setup() {
   fullScreen();
   for (int i = 0; i < drops.length; i++) {
     drops[i] = new Raindrop();
   }
}

void draw() {
   background(230, 230, 250); 
   for (int i = 0; i < drops.length; i++) {
     drops[i].fall();
     drops[i].show();
   }
   if (mousePressed) {
     save("rain.png");
   }
}

class Raindrop {
  
  float x;
  float y;
  float z;
  float len;
  float yspeed;
  
  Raindrop() {
    x = random(width);
    y = random(-500, -50);
    z = random(0, 20);
    len = map(z, 0, 20, 10, 20);
    yspeed = map(z, 0, 20, 1, 20);
  }
  
  void fall() {
    y += yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed += grav;
    
    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }
  
  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(100, 187, 255);
    line(x, y, x, y + len);
  }

}
