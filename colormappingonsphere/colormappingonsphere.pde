import processing.opengl.*;

int angle_1;

void setup() {
  size(screen.width, screen.height, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
}

void draw() {
  background(255);
  if (angle_1 < 720) 
  {
    angle_1++;
  } 
  else {
    angle_1 = 0;
  }
  pushMatrix();

  translate(100 * sin(radians(angle_1)), 100 * cos(radians(angle_1)));
  // pointLight(51, 102, 126, random(width), random(height), random(height));
  pointLight(250, 0, 205, noise(mouseX*0.002)*700, noise(mouseY*0.005)*300, noise(mouseX*0.002)*700);
  pointLight(0, 193, 250, noise(mouseX*0.002)*700 + 600, noise(mouseY*0.005)*300  + 600, noise(mouseX*0.002)*700);
  pointLight(241, 250, 0, noise(mouseX*0.002)*700 + 300, noise(mouseY*0.005)*300  + 300, noise(mouseX*0.002)*700);
  pointLight(241, 250, 255, noise(mouseX*0.002)*700 + 700, noise(mouseY*0.005)*300  + 300, noise(mouseX*-0.002)*700);
  popMatrix();
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  color(255);
  sphere(190);
  popMatrix();
}

