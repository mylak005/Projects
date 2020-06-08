class Matrix {
  int cols = 13;
  int rows = 12;
  int matrixSize = cols * rows;
  Symbol[][] symbols = new Symbol[cols][rows];
  float matrixX;
  float matrixY;
  float matrixZ;
  
  Matrix(float x, float y, float z) {
    matrixX = x;
    matrixY = y;
    matrixZ = z;
  }
  
  void genMatrix() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        symbols[i][j] = new Symbol(i * symbolSize + matrixX, j * symbolSize + matrixY);
        symbols[i][j].genSymbol();
      }
    }
  }
  
  void renderer() {
    stroke(100, 150, 255, matrixZ);
    noFill();
    rect(matrixX - 10, matrixY - 10, cols * symbolSize + 10, rows * symbolSize + 20, 10);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        symbols[i][j].genSymbol();
        symbols[i][j].render(matrixZ);
      }
    }
  }
}
