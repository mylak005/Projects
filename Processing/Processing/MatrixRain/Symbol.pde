class Symbol {
  float switchInterval = round(random(2, 20));
  char c;
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
    int charType = round(random(0, 5));
    if (frameCount % switchInterval == 0) {
      if (charType > 1) {
        c = (char)(0x30A0 + round(random(0, 96)));
        value = Character.toString(c);
      } else if (charType > 0) {
        value = Character.toString((char)(round(random(42, 46))));
      } else {
        value = Integer.toString(floor(random(0,10)));
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
