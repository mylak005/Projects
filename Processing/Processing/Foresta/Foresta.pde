import peasy.*;

Terreno terreno;
PeasyCam cam;
Albero[] alberi = new Albero[300];

void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this, 500);
  terreno  = new Terreno();
  for (int i = 0; i < alberi.length; i++) { 
    alberi[i] = new Albero();
  }
}

void draw() {
  background(180, 210, 230);
  translate(width/2, height/2+50);
  rotateX(PI/2.3);
  terreno.show();
  for (int i = 0; i < alberi.length - 1; i++) {
    alberi[i].show();
  }
}
