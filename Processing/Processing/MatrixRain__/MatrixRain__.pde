float symbolSize = 24;
Stream[] streams = new Stream[100];
int totalStream;

PFont font;

void setup() {
  fullScreen();
  background(0);
  
  totalStream = round(width / symbolSize);
  font = createFont("Consolas",symbolSize);
  
  float x = 0;
  for (int i = 0; i < totalStream; i++) {
    streams[i] = new Stream();
    streams[i].generateSymbols(x, random(-2000, 0));
    x += symbolSize;
  }
  textFont(font);
}

void draw() {
  background(0, 150);
  for (int i = 0; i < totalStream; i++) {
    streams[i].render();
  }
}
