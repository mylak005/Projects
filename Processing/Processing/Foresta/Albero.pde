class Albero {
  float h;
  float x;
  float y;
  float r;
  
  Albero() {
    h = random(500, 1000);
    x = random(3200);
    y = random(1600);
    r = random(50, 100);
  }
  
  void show() {
    stroke(101, 67, 33);
    strokeWeight(6);
    line(x, y, 0, x, y, h);
  }
}
