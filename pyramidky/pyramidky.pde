import processing.opengl.*;

int clicx, clicy;
boolean x_fill, rand_fill;
int n;
color bgcolor, strk;

void setup() {
  size(screen.width, screen.height, OPENGL);
  background(0);
  colorMode(HSB, screen.width);
  rand_fill = true;
  x_fill = false;
  frameRate(30);
  n = 10;
  bgcolor = color(0, 0, 0);
  strk = color(0, 0, screen.width);
  noCursor();
}

void matrix() {
  for (int x = 0; x <= width; x += width/n) {
    for (int y = 0; y <= height; y += height/n) {
      pushMatrix();

      if (x_fill == true) {
        fill(mouseX, screen.width, screen.width);
      }


      if (rand_fill == true) {
        if (int(random(mouseY * 10)) == 1) {
          int r = int(random(screen.width));
          fill(r,screen.width,screen.width);
        } 
        else {
          fill(bgcolor);
          stroke(strk);
          strokeWeight(1);
        }
      }


      translate(x, y);
      rotateY(map(mouseX, 0, width, 0, PI));
      rotateX(map(mouseY, 0, height, 0, PI));
      sphereDetail(1);
      sphere(mouseY/4 + 70);
      popMatrix();
    }
  }
}

void mousePressed() {
  clicx = mouseX;
  clicy = mouseY;
}

void draw() {
  background(bgcolor);
  matrix();
}

void keyPressed() {
  if (key == 'q') {
    x_fill = true;
    rand_fill = false;
  }
  if (key == 'w') {
    x_fill = false;
    rand_fill = true;
    bgcolor = color(0, 0, 0);
    strk = color(0, 0, screen.width);
  }

  if (key == 'e') {
    bgcolor = color(0, 0, screen.width);
    strk = color(0, 0, 0);
  }

  if (key == '1') {
    n = 2;
  }
  if (key == '2') {
    n = 3;
  }
  if (key == '3') {
    n = 5;
  }
  if (key == '4') {
    n = 10;
  }
  if (key == '5') {
    n = 20;
  }
}

