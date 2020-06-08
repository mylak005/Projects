float angle1;
float angle2;
float branch_ratio = 0.67;
void setup() {
   size(600, 600);
   colorMode(HSB);
}

void draw() {
  background(51);
  stroke(255);
  
  translate(width / 2, height);
  branch(150);
  
  if (mousePressed) {
  //save("Albero_frattale_3.jpg");
  }
}

void branch(float len) {
  angle1 = map(mouseX, 0, width, 0, PI / 2);
  angle2 = map(mouseY, 0, height, 0, PI / 2);
  
  line(0, 0, 0, -len);
  translate(0, -len);
  
  if (len > 4) {
    pushMatrix();
    
    rotate(angle1);
    stroke(255);
    branch(len * branch_ratio);
    
    popMatrix();
    
    pushMatrix();
    
    rotate(-angle2);
    stroke(255);
    branch(len * branch_ratio);
    
    popMatrix();  
 }
}
