import peasy.*;
PeasyCam cam;

float symbolSize = 16;

Matrix[] matrices = new Matrix[20];
Matrix[][] grid = new Matrix[25][25];

float msizex = 13 * symbolSize + 50;
float msizey = 12 * symbolSize + 50;

void setup() {
  fullScreen(P3D);
  
  cam = new PeasyCam(this, 500);
  cam.lookAt(width / 2, height / 2, 0);
  
  for (int n = 0; n < width / msizex - 1; n++) {
    for (int m = 0; m < height / msizey - 1; m++) {
      grid[n][m] = new Matrix(n * msizex + 50, m * msizey + 50,255); 
      grid[n][m].genMatrix();
    }
  }
  for (int i = 0; i < matrices.length; i++) {
    matrices[i] = new Matrix(random(width),random(height), random(100));
    matrices[i].genMatrix();
  }
}

void draw() {
  background(0, 20, 50);
  for (int i = 0; i < matrices.length; i++) {
    matrices[i].renderer();
  }
  
  for (int n = 0; n < width / msizex - 1; n++) {
    for (int m = 0; m < height / msizey - 1; m++) {
      grid[n][m].renderer();
    }
  }
}
