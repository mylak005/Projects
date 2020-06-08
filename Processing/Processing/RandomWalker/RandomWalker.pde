int x;
int y ;

void setup() {
  size(600, 600);
  background(51);
  x = 300;
  y = 300;
}

void draw() {
  stroke(255);
  strokeWeight(2);
  point(x, y);
  
  int r = floor(random(0, 4));
  
  switch(r) {
    case 0:
      x++;
      break;
    case 1:
      x--;
      break;
    case 2:
      y++;
      break;
    case 3:
      y--;
      break;
  }
}
