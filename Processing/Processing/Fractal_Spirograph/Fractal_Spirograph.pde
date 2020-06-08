ArrayList<PVector> path;

float angle = 0;
int res = 1;

Orbit sun;
Orbit end;

void setup() {
  size(600, 600);
  
  path = new ArrayList<PVector>();
  sun = new Orbit(300, 300, 150, 0);
  
  Orbit next = sun;
  for (int i = 0; i < 10; i++) {
    next = next.addChild();
  }
  end = next;
}

void draw() {
  background(51);
  
  Orbit next = sun;
  
  while (next != null) {
    next.update();
    next.show();
    next = next.child;
  }
  
  path.add(new PVector(end.x, end.y));
  
  beginShape();
  stroke(255, 0, 255);
  strokeWeight(2);
  
  for (PVector pos : path) {
     vertex(pos.x, pos.y);
  }
  endShape();
  if (mousePressed) {
    save("fractal_spirograph.png");
  }
}
