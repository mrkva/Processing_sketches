import processing.opengl.*;

int l;
int n = 20;
float[][] vert = new float[n][5];
PImage a;

void setup() {
  size(600, 600, OPENGL);
  l = height / 5;
  
  for (int i = 0; i < n; i++) {
    vert[i][0] = random(width);
    vert[i][1] = random(height);
  }
  
}

void draw() {
  background(0);
  a = loadImage("andras.jpg");

  beginShape();
  texture(a);
  for (int i = 0; i < n; i++) {
    vertex(vert[i][0], vert[i][1]);
  }
  endShape(CLOSE);

}

