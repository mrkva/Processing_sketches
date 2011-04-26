/*
Jonas Gruska, 2011 // http://mrkva.ovecka.be
 
 
 [q] - black border
 [a] - black fill
 [w] - white border
 [s] - white fill
 [e] - rainbow border
 [d] - rainbow fill
 [f] - no fill
 [g] - random color fill
 [z] - pyramids
 [x] - something else
 [c] - something more complicated
 [v] - spheres
 
 [n] -> [/] - amount of objects
 
 [1] - [8] - border weight
 
 [p] - auto rotation
 [o] - turn off auto rotation
 [up] - slow down
 [down] - speed up
 
 
 
 
 -- traces
 -- textures
 -- reality modif
 -- 2d
 */


import processing.opengl.*;
int strk, clr_count, clr_count_fill, sphere_detail, num, j, time;
float  alpha_value;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
boolean color_change_on, color_change_fill_on, fill_on, auto_operation;
color clr, clr_fill;
PFont fontA;

int[] xpos = new int[51];
int[] ypos = new int[51];
int[] zpos = new int[51];

void setup() {
  colorMode(HSB, 100);
  size(screen.width, screen.height, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);

  strk = 1;
  clr_count = 0;
  clr_count_fill = 0;
  color_change_on = false;
  color_change_fill_on = false;
  clr = color(0, 0, 0);
  clr_fill = color(0, 0, 100);
  sphere_detail = 3;
  num = 30;
  time = 2000;

  give();
  color_change();
  noCursor();
}

void give() {

  for (int i = 0; i<51; i++) {
    xpos[i] = int(random(width/10)) + width/2;
    ypos[i] = int(random(height/10)) + height/2;
    zpos[i] = int(random(100));
  }
}

void obj() {

  for (int i = 0; i<num; i++) {
    translate(xpos[i],ypos[i],zpos[i]);
    if (auto_operation == true) {
      if (j < time) { 
        rotateX(j * 0.6283);
        rotateY(j * 0.6283);
        j++;
        delay(1);
      } 
      else {
        j = 0;
      }
    } else {
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
    }

    if (fill_on == true) {
      fill(clr_fill);
    } 
    else {
      noFill();
    }
    stroke(clr);
    strokeWeight(strk);
    //  sphereDetail(mouseX / 160);
    sphereDetail(sphere_detail);
    smooth();
    sphere(mouseX);
  }
}




void color_change() {
  if (color_change_on == true) {
    if (clr_count < 100) {
      clr = color(clr_count, 100, 100);
      clr_count += 1;
    } 
    else {
      clr_count = 0;
    }
  }
}

void color_change_fill() {
  if (color_change_fill_on == true) {
    if (clr_count_fill < 100) {
      clr_fill = color(clr_count_fill, 100, 100);
      clr_count_fill += 1;
    } 
    else {
      clr_count_fill = 0;
    }
  }
}


void draw() {
  background(0, 0, 100);
  color_change();
  color_change_fill();
  obj();
}

void keyPressed() {
  if (key == 'p') {
    give();
  }
  if (key == '1') {
    strk = 1;
  }
  if (key == '2') {
    strk = 2;
  }
  if (key == '3') {
    strk = 4;
  }
  if (key == '4') {
    strk = 6;
  }
  if (key == '5') {
    strk = 9;
  }
  if (key == '6') {
    strk = 14;
  }
  if (key == '7') {
    strk = 18;
  }
  if (key == '8') {
    strk = 200;
  }

  // adjusting the stroke color

  if (key == 'q') {
    color_change_on = false;
    clr = color(0, 0, 0);
  }
  if (key == 'w') {
    color_change_on = false;
    clr = color(0, 0, 100);
  }
  if (key == 'e') {
    color_change_on = true;
  }

  // adjusting the fill color

  if (key == 'a') {
    fill_on = true;
    color_change_fill_on = false;
    clr_fill = color(0, 0, 0);
  }
  if (key == 's') {
    fill_on = true;
    color_change_fill_on = false;
    clr_fill = color(0, 0, 100);
  }
  if (key == 'f') {
    clr = color(0, 0, 0);
    fill_on = false;
  }
  if (key == 'g') {
    fill_on = true;
    color_change_on = false;
    color_change_fill_on = false;
    clr_fill = color(int(random(100)), 100, 100);
    clr = color(0, 0, 100);
  }

  if (key == 'd') {
    fill_on = true;
    color_change_fill_on = true;
  }

  // adjusting the objects

  if (key == 'z') {
    sphere_detail = 1;
  }
  if (key == 'x') {
    sphere_detail = 3;
  }
  if (key == 'c') {
    sphere_detail = 5;
  }
  if (key == 'v') {
    sphere_detail = 25;
  }

  // adjusting the count of objects

  if (key == '/') {
    num = 50;
  }
  if (key == '.') {
    num = 30;
  }
  if (key == ',') {
    num = 10;
  }
  if (key == 'm') {
    num = 5;
  }
  if (key == 'n') {
    num = 3;
  }

  if (key == 'p') {
    auto_operation = true;
  }
  if (key == 'o') {
    auto_operation = false;
  }
  if (keyCode == UP) {
    time += 500;
  }

  if (keyCode == DOWN) {
    if (time > 100) {
      time -= 100;
    }
  }
  if (keyCode == LEFT) {
  }
}

