import processing.opengl.*;

boolean drawing = false;
boolean rotating = false;
boolean color_change_on = false;
int offx, offy, clr_count;
color clr = color(0, 0, 0);

void setup() {
  size(500, 500, OPENGL);
  offx = 20;
  offy = 20;
  colorMode(HSB, 100);
  
}

void draw() {
  if (drawing == false) {
    background(0, 0, 100);
  } 
  
  if (rotating == true) {
    rotateX(map(mouseY, 0, height, 0, PI));
    rotateY(map(mouseX, 0, width, 0, PI));
  }
  
  pushMatrix();
  stroke(0,0,0);
 // line(0, mouseY + offy, width, mouseY - offy);
//  line(mouseX + offx, 0, mouseX - offx, height);
  translate(mouseX, mouseY, mouseY);
  color_change();
  fill(clr);
  stroke(0,0,100);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
}

void color_change() {
  if (color_change_on == true) {
    if (clr_count < 100) {
      
      clr_count += 1;
      clr = color(clr_count, 100, 100);
    } 
    else {
      clr_count = 0;
    }
  } else { clr = color(100, 100, 100);
  }
}


void mousePressed() {
  if (drawing == true) {
    drawing = false;
  } else {
    drawing = true;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (color_change_on == true) {
      color_change_on = false;
    } else {
      color_change_on = true;
    }
  }
}
