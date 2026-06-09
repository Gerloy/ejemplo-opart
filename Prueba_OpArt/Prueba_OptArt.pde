final int CANT_CUADRADOS = 26;
final int ANCHO = 400;
final int ALTO = 400;
final float OFFSET = 500;

PImage obra;
color col1,col2,col_actual;

//Cosas para probar interacciones y cambios
float delta = 0;
float time;
float t_offset = 0;
void setup() {
  size(800, 400);
  obra = loadImage("data/Obra.png");
  col1 = color(127,0,127);
  col2 = color(0,127,127);
  col_actual = col1;
  rectMode(CENTER);
  noFill();
  strokeWeight(5);
  stroke(col_actual);
  time = millis();
}
void draw() {
  background(200);
  checkearTime();
  dibujarObra(); //<>//
  image(obra,0,0,400,400); //<>//
  updateDelta();
}

void checkearTime(){
  t_offset += delta;
  if(t_offset >= OFFSET){
    cambiarColores();
    t_offset = 0;
  }
}

void cambiarColores(){
  color pivot = col1;
  col1 = col2;
  col2 = pivot;
}

void updateDelta(){
  delta = millis() - time;
  time = millis();
}

void dibujarObra(){
pushMatrix();
  translate(width*.5,0);
  for (int y=0; y<4; y++) {
    //Hago dos grupos de cuadrados;
    if (y%2 == 0) {
      for (int x=0; x<4; x+=2) {
        for (int i=0; i<CANT_CUADRADOS; i++){
          if(i%2==0){col_actual = col1;}else{col_actual = col2;}
          stroke(col_actual);
          rect(ANCHO*0.25*(x+1),ALTO*.25*(y+1),map(i,0,CANT_CUADRADOS-1,5,ALTO*0.5),map(i,0,CANT_CUADRADOS-1,5,ALTO*0.5));
        }
      }
    }else{
    for (int x=0; x<5; x+=2) {
      for (int i=0; i<CANT_CUADRADOS; i++){
        if(i%2==0){col_actual = col1;}else{col_actual = col2;}
          stroke(col_actual);
          rect(ANCHO*0.25*(x),ALTO*.25*(y+1),map(i,0,CANT_CUADRADOS-1,5,ALTO*0.5),map(i,0,CANT_CUADRADOS-1,5,ALTO*0.5));
        }
      }
    }
  }
  popMatrix();
}
