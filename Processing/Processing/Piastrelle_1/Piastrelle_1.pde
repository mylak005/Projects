int cols = 10;
int rows = 10;

void setup() {
   size(600, 600);
}

void draw() {
  ellipseMode(CENTER);
  background(160, 120, 13);
  
  stroke(202, 243, 230);
  noFill();
  
  float d = width / cols * sqrt(2);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
     float w = width / cols;
     float h = height / rows;
     float posx = i * w;
     float posy = j * h;
     
     strokeWeight(3);
     stroke(182, 203, 192);
     noFill();
     rect(posx, posy, w, h);
     
     stroke(60, 15, 15);
     strokeWeight(8);
     ellipse(posx + (w / 2), posy + (h / 2), d, d);
     
     strokeWeight(1);
     stroke(215, 183, 63);
     ellipse(posx + (w / 2), posy + (h / 2), d + 4, d + 4);
     ellipse(posx + (w / 2), posy + (h / 2), d + 8, d + 8);
     ellipse(posx + (w / 2), posy + (h / 2), d + 12, d + 12);
     ellipse(posx + (w / 2), posy + (h / 2), d + 16, d + 16);
     
    }
  }
}
