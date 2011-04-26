import processing.opengl.*;


boolean blue_on, red_on;
float y;
int n = 10;
int offx, offy;
float[] val = new float[200];

void setup() {
  size(screen.width, screen.height, OPENGL);
  offx = 50;
  offy = 50;
  blue_on = false;
  red_on = false;
  noCursor();
}

void draw() {
  background(0,0,0);
  sine();
}

void sine() {
  for (int x = 0; x <= width; x += width/n) {

    for (int ell = 0; ell <= n; ell++) {
      if (val[ell] <= 360) {
        val[ell] += 0.1;
      } 
      else {
        val[ell] = 0;
      }

      noFill();
      stroke(255);
      ellipse(x, map(sin(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + offx, mouseX/5  + offy);
      if (blue_on == true) {
        stroke(0,0,255);
        ellipse(x, map(cos(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + offx, mouseX/5  + offy);
      }
      if (red_on == true) {
        stroke(255,0,255);
        ellipse(x, map(tan(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + offx, mouseX/5  + offy);
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    n = 5;
  }
  if (key == '2') {
    n = 10;
  }
  if (key == '3') {
    n = 15;
  }
  if (key == '4') {
    n = 15;
  }
  if (key == '4') {
    n = 25;
  }
  if (key == '5') {
    n = 40;
  }
  if (key == 'q') {
    if (red_on == true) {
      red_on = false;
    }  
    else red_on = true;
  }
  if (key == 'w') {
    if (blue_on == true) {
      blue_on = false;
    } 
    else blue_on = true;
  }
}

void mouseDragged() {
  n = int(mouseX/90);
  offx = mouseX/2;
  offy = mouseY/2;
  
}

void mouseReleased() {
  offx = 50;
  offy = 50;
}
