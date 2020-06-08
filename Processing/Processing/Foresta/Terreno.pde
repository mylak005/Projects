class Terreno {
  int cols, rows;
  int scl = 20;
  int w = 3200;
  int h = 1600;
  float[][] terrain;
  
  Terreno() {
    cols = w / scl;
    rows = h/ scl;
    terrain = new float[cols][rows];
  }
  
  void show() {
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -40, 40);
        xoff += 0.2;
      }
      yoff += 0.2;
    }
    
    noStroke();
    lights();
    fill(169, 101, 0, 200);
    translate(-w/2, -h/2);
  
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }
  }
}
