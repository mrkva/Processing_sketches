import processing.opengl.*;
int angle_mercury = 0;
int angle_venus = 0;
int angle_earth = 100;
int angle_moon = 0;
int angle_mars = 200;
float angle_jupiter = 100;
float angle_jupiter_moon_1 = 50;
float angle_jupiter_moon_2 = 0;
float angle_jupiter_moon_3 = 150;
float angle_jupiter_moon_4 = 250;
float angle_saturn = 20;

void setup() {
  size(800,800,OPENGL);
}

void draw() {
  rotateX(map(mouseY, 0, height, 0, PI));
  rotateY(map(mouseX, 0, width, 0, PI));
  background(0);
  
  //sun
  translate(width/2, height/2);
  noStroke();
  fill(225,226,0);
  sphere(height/20);
  fill(255);
  sphere(height/20);
  
//  planet(height/14, height/50, color(255,0,0), 0.5, 100);

  //mercury
  pushMatrix();
  translate(height/14 * sin(radians(angle_mercury)), height/14 * cos(radians(angle_mercury)));
  if (angle_mercury < 360) {
    angle_mercury++;
  } 
  else {
    angle_mercury = 0;
  }
  fill(190);
  sphere(height/100);
  popMatrix();
  
  // venus
  pushMatrix();
  translate((height/9) * sin(radians(int(angle_venus))), (height/9) * cos(radians(int(angle_venus))));
  if (angle_venus < 360) {
    angle_venus += 2;
  } 
  else {
    angle_venus = 0;
  }
  fill(198, 136, 54);
  sphere(height/38);
  popMatrix();
  
  // earth
  pushMatrix();
  translate(height/6 * sin(radians(int(angle_earth))), height/6 * cos(radians(int(angle_earth))));
  if (angle_earth < 360) {
    angle_earth += 1;
  } 
  else {
    angle_earth = 0;
  }
  fill(24, 146, 237);
  sphere(height/42);
  
  // moon
  
  pushMatrix();
  translate(height/25 * sin(radians(int(angle_moon))), height/25 * cos(radians(int(angle_moon))));
  if (angle_moon < 360) {
    angle_moon += 4;
  } 
  else {
    angle_moon = 0;
  }
  fill(193);
  sphere(height/112);
    
  
  popMatrix();
  popMatrix();
  
  //mars
  pushMatrix();
  translate(height/5 * sin(radians(angle_mars)), height/5 * cos(radians(angle_mars)));
  if (angle_mars < 360) {
    angle_mars++;
  } 
  else {
    angle_mars = 0;
  }
  fill(203, 174, 119);
  sphere(height/92);
  popMatrix();
  
   //jupiter
  pushMatrix();
  translate(height/4 * sin(radians(angle_jupiter)), height/4 * cos(radians(angle_jupiter)));
  if (angle_jupiter < 360) {
    angle_jupiter += 0.4;
  } 
  else {
    angle_jupiter = 0;
  }
  fill(203, 174, 119);
  sphere(height/28);
  
  // first moon
  pushMatrix();
  translate(height/25 * sin(radians(angle_jupiter_moon_1)), height/25 * cos(radians(angle_jupiter_moon_1)));
  if (angle_jupiter_moon_1 < 360) {
    angle_jupiter_moon_1 += 1.3;
  } 
  else {
    angle_jupiter_moon_1 = 0;
  }
  fill(193);
 sphere(height/112);
    
  
  popMatrix();
  
  // second moon
  pushMatrix();
  translate(height/20 * sin(radians(angle_jupiter_moon_2)), height/20 * cos(radians(angle_jupiter_moon_2)));
  if (angle_jupiter_moon_2 < 360) {
    angle_jupiter_moon_2 += 1.5;
  } 
  else {
    angle_jupiter_moon_2 = 0;
  }
  fill(134);
  sphere(height/112);
  
  popMatrix(); 
  
  // third moon
  pushMatrix();
  translate(height/13 * sin(radians(angle_jupiter_moon_3)), height/13 * cos(radians(angle_jupiter_moon_3)));
  if (angle_jupiter_moon_3 < 360) {
    angle_jupiter_moon_3 += 1.1;
  } 
  else {
    angle_jupiter_moon_3 = 0;
  }
  fill(104);
  sphere(height/100);
  
  popMatrix(); 
  
  // fourth moon
  pushMatrix();
  translate(height/10 * sin(radians(angle_jupiter_moon_4)), height/10 * cos(radians(angle_jupiter_moon_4)));
  if (angle_jupiter_moon_4 < 360) {
    angle_jupiter_moon_4 += 1.3;
  } 
  else {
    angle_jupiter_moon_4 = 0;
  }
  fill(104);
  sphere(height/120);
  
  popMatrix();
  
  popMatrix();
 
   //saturn
  pushMatrix();
  translate(height/3 * sin(radians(angle_saturn)), height/3 * cos(radians(angle_saturn)));
  if (angle_saturn < 360) {
    angle_saturn += 0.3;
  } 
  else {
    angle_saturn = 0;
  }
  fill(203, 174, 119);
  sphere(height/36);
  
  popMatrix();
}


void planet(int d, int r, int clr, float speed, int init) {
  float angle = init;
  pushMatrix();
  translate(d * sin(radians(angle)), d * cos(radians(angle)));
  if (angle < 360) {
    angle += speed;
  } 
  else {
    angle = 0;
  }
  fill(clr);
  ellipse(0, 0, r, r);
  popMatrix();   
}

