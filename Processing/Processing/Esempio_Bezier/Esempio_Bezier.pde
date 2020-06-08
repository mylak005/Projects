ArrayList<PVector> p = new ArrayList<PVector>();

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  if (p.size() == 4) {
    bezier(p.get(0).x, p.get(0).y, p.get(1).x, p.get(1).y, p.get(2).x, p.get(2).y, p.get(3).x,p.get(3).y);
  }
}

void mousePressed() {
  p.add(new PVector(mouseX, mouseY));
  stroke(255);
  point(mouseX, mouseY);
}
