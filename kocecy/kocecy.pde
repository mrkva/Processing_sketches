int n = 15;
int siz;
float[][] points = new float[n^2][5];

void setup() {
  size(700, 700);
  
}

void draw() {
  background(255);
  for (int i = 0; i < width; i+= width/n) {
    for (int j = 0; j < height; j+= height/n) {
      if (dist(mouseX, mouseY, i, j) < 20)
       { stroke(255,0,0); siz = 20; } else { stroke(0,0,0); siz = 5; }
      
      rect(i, j, siz, siz);
    }
  }
}
