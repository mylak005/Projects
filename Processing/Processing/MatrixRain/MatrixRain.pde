float symbolSize = 24;
Stream[] streams = new Stream[57];
int totalStream;

PFont font;

void setup() {
  fullScreen();
  background(0);
  
  totalStream = round(width / symbolSize);
  font = createFont("https://drive.google.com/uc?export=download&id=0BwTQLXGKzDbZUmFkdEl0RW9IX2c",symbolSize);
  
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
  for (int i = 0; i < streams.length; i++) {
    streams[i].render();
  }
}
