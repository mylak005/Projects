class Symbol {
  
  float x;
  float y;
  String value;
  float switchInterval = round(random(5, 50));
  
   Symbol(float xpos, float ypos)  {
     x = xpos;
     y = ypos;
   }
   
   void genSymbol() {
     if (frameCount % switchInterval == 0) {
       if (random(1) < 0.5) {
         value = "0";
       } else {
         value = "1";
       }
     }  
   }
   
   void render(float z) {
     textAlign(LEFT, TOP);
     //fill(190, 220, 255);
     fill(100, 150, 255, z);
     textSize(symbolSize);
     text(value, x, y);
   }
}
