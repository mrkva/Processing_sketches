import processing.opengl.*;

int sw = screen.width;
int sh = screen.height;
int n = 6;
boolean tri = false;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
color bgclr, strk;

void setup() {
  size(sw, sh, OPENGL);
  colorMode(HSB, sw);
  bgclr = color(0, 0, sw);
  strk = color(0, 0, 0);
  //cursor(CROSS);
  noCursor();
} 

void draw() {
  background(bgclr);
  for (int x = 0; x < sw; x += int(sw / n)) {
    for (int y = 0; y < sh; y += int(sh / n)) {
      for (int z = 0; z < 1000; z += int(1000 / n)) {
        // translate(x, y, z);
        /* rotateY(map(mouseX, 0, width, 0, PI));
         rotateX(map(mouseY, 0, height, 0, PI));
         rotateZ(map(mouseY, 0, height, 0, PI)); */

        newXmag = mouseX/float(width) * TWO_PI;
        newYmag = mouseY/float(height) * TWO_PI;

        float diff = xmag-newXmag;
        if (abs(diff) >  0.01) { 
          xmag -= diff/4.0;
        }

        diff = ymag-newYmag;
        if (abs(diff) >  0.01) { 
          ymag -= diff/4.0;
        }

        rotateX(-ymag); 
        rotateY(-xmag);
      

      int msy = int(map(mouseY, 0, sh, 1, 100));
      stroke(strk);
      strokeCap(ROUND);
      beginShape();
      
      vertex(x, y, z); 
      vertex(x + (mouseX + n)/n * 10, y + (mouseX + n)/n * 10, z + (mouseX + n)/n * 10);
      endShape();
    }
  }
}
}

void mousePressed() {
}

void keyPressed() {
  if (key == '1') {
    n = 2;
  }
  if (key == '2') {
    n = 3;
  } 
  if (key == '3') {
    n = 4;
  } 
  if (key == '4') {
    n = 5;
  } 
  if (key == '5') {
    n = 6;
  } 
  if (key == '6') {
    n = 10;
  } 
  if (key == '7') {
    n = 28;
  }
  if (key == 'q') {
    bgclr = color(0, 0, 0);
    strk = color(0, 0, sw);
  }
  if (key == 'w') {
    bgclr = color(0, 0, sw);
    strk = color(0, 0, 0);
  }
  if (key == 'a') {
    tri = true;
  }
  if (key == 's') {
    tri = false;
  }
}

