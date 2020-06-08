class Stream {
  int totalSymbols = round(random(5, height / symbolSize));
  Symbol[] symbols = new Symbol[totalSymbols];
  float speed = random(5, 22);
  boolean first = round(random(0, 4)) == 1;
  
  Stream() { 
  }
  
  void generateSymbols(float x, float y) {
   for (int i = 0; i < totalSymbols; i++) {
     symbols[i] = new Symbol(x, y, speed, first);
     symbols[i].setToRandomSymbol();
     y -= symbolSize;
     first = false;
   }
  }
  
  void render() {
    for (int i = 0; i < totalSymbols; i++) {
      if (symbols[i].first) {
        fill(180, 255, 180);
      } else {
        fill(0, 255, 70);
      }
      text(symbols[i].value, symbols[i].x, symbols[i].y);
      symbols[i].rain();
      symbols[i].setToRandomSymbol();
    }
  }
}
