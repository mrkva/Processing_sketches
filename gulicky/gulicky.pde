import processing.opengl.*;

int n = 10;
int r = 1000;

void setup() {
  size(screen.width, screen.height, OPENGL);
  colorMode(HSB, 255);
}

void draw() {
  background(0);
  
  for (int i = 0; i < width; i+= width/n) {
    for (int j = 0; j < height; j+= height/n) {
      pushMatrix();
      translate(i,j);
      noStroke();
      ellipse(0, 0, width/n * 0.2, width/n * 0.2);
      strokeWeight(n/2);
      if (int(random(r)) == 1) {
        stroke(int(random(255)), 255, 255);
        line(0, 0, width/n, width/n);
      }
      if (int(random(r)) == 1) {
        stroke(int(random(255)), 255, 255);
        line(0, 0, width/n, -1 * width/n);
      }
      
      if (int(random(r)) == 1) {
        stroke(int(random(255)), 255, 255);
        line(0, 0, -1 * width/n, width/n);
      }
      if (int(random(r)) == 1) {
        stroke(int(random(255)), 255, 255);
        line(0, 0, -1 * width/n, -1 * width/n);
      }
      popMatrix();
    }
  }
  
}
