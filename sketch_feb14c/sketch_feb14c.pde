import processing.opengl.*;

int n = 10;
float[][] pnt = new float[n][5];

void setup() {
  size(500, 500, OPENGL);
  background(0);
}

void draw() {
  rotateX(map(mouseY, 0, height, 0, PI));
  rotateY(map(mouseX, 0, width, 0, PI));
  background(0);
  translate(width/2, height/2);
  tint(255, 0, 0, 10);
  for (int i = 0; i < n; i++) {
    pnt_move(20*i, random(20), i);
  } 

  /*  for (float i = 0; i < 1000; i+=0.1) {
   stroke(random(255));
   pnt_move(i, 1, 1); */
}

void pnt_move(float r, float speed, int n) {
  pushMatrix();
  translate(r * sin(radians(pnt[n][0])), r * cos(radians(pnt[n][0])));
  if (pnt[n][0] < 360) {
    pnt[n][0]+= speed;
  } 
  else {
    pnt[n][0] = 0;
  }
  
  stroke(255);
  sphere(10);
  popMatrix();
} 

