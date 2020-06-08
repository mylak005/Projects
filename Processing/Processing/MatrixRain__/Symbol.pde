class Symbol {
  float switchInterval = round(random(2, 20));
  String value;
  float x;
  float y;
  float speed;
  boolean first;
  
  Symbol(float xpos, float ypos, float sp, boolean f) {
    x = xpos;
    y = ypos;
    speed = sp;
    first = f;
  }
  
  void setToRandomSymbol() {
    int charType = round(random(0, 1));
    if (frameCount % switchInterval == 0) {
      if (charType == 1) {
        value = Integer.toString(0);
      } else {
        value = Integer.toString(1);
      }
    }
  }
  
  void rain() {
    if (y >= height) {
      y = 0;
    } else {
      y += speed;
    } 
  }
  

}
