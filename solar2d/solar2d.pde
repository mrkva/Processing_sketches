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
float angle_uran = 50;
float angle_neptune = 160;
int star_count = 100;
int[][] star = new int[star_count][3];

void setup() {
  size(screen.width, screen.height, OPENGL);
  for (int i = 0; i < star_count; i++) {
    star[i][0] = int(random(width));
    star[i][1] = int(random(height));
    star[i][2] = int(random(300) - 150);
  }
  noCursor();
}

void draw() {
  background(0);
  
  for (int i = 0; i < star_count; i++) {
    stroke(255);
    point(star[i][0] + mouseX/20, star[i][1] + mouseY/20, star[i][2]);
  }
  
  
  //sun
  translate(mouseX, mouseY);
  noStroke();
  fill(225,226,0);
  ellipse(0, 0, height/10, height/10);
  fill(255);
  ellipse(0, 0, height/10 - 10, height/10 - 10); 
  
 /* PImage b;
  b = loadImage("p.png");
  pushMatrix();
  translate(-50, -50);
  image(b, 0, 0);
  popMatrix();
  noStroke(); */
  
//  planet(height/14, height/50, color(255,0,0), 0.5, 100);

  //mercury
  pushMatrix();
  translate(height/14 * sin(radians(angle_mercury)), height/17 * cos(radians(angle_mercury)));
  if (angle_mercury < 360) {
    angle_mercury++;
  } 
  else {
    angle_mercury = 0;
  }
  fill(190);
  ellipse(0, 0, height/50, height/50);
  
  popMatrix();
  
  // venus
  pushMatrix();
  translate((height/9) * sin(radians(int(angle_venus))), (height/7) * cos(radians(int(angle_venus))));
  if (angle_venus < 360) {
    angle_venus += 2;
  } 
  else {
    angle_venus = 0;
  }
  fill(198, 136, 54);
  ellipse(0, 0, height/19, height/19);
  popMatrix();
  
  // earth
  pushMatrix();
  translate(height/6 * sin(radians(int(angle_earth))), height/5 * cos(radians(int(angle_earth))));
  if (angle_earth < 360) {
    angle_earth += 1;
  } 
  else {
    angle_earth = 0;
  }
  fill(24, 146, 237);
  ellipse(0, 0, height/21, height/21);
  
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
  ellipse(0, 0, height/58, height/58);
    
  
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
  ellipse(0, 0, height/46, height/46);
  popMatrix();
  
   //jupiter
  pushMatrix();
  translate(height/4 * sin(radians(angle_jupiter)), height/5 * cos(radians(angle_jupiter)));
  if (angle_jupiter < 360) {
    angle_jupiter += 0.4;
  } 
  else {
    angle_jupiter = 0;
  }
  fill(203, 174, 119);
  ellipse(0, 0, height/14, height/14);
  
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
  ellipse(0, 0, height/58, height/58);
    
  
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
  ellipse(0, 0, height/58, height/58);
  
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
  ellipse(0, 0, height/50, height/50);
  
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
  ellipse(0, 0, height/60, height/60);
  
  popMatrix();
  
  popMatrix();
 
   //saturn
  pushMatrix();
  translate(height/3 * sin(radians(angle_saturn)), height/3.4 * cos(radians(angle_saturn)));
  if (angle_saturn < 360) {
    angle_saturn += 0.3;
  } 
  else {
    angle_saturn = 0;
  }
  fill(232, 112, 112);
  ellipse(0, 0, height/18, height/18);
  
  popMatrix();
  
     //uran
  pushMatrix();
  translate(height/2.5 * sin(radians(angle_uran)), height/2.8 * cos(radians(angle_uran)));
  if (angle_uran < 360) {
    angle_uran += 0.5;
  } 
  else {
    angle_uran = 0;
  }
  fill(168, 173, 58);
  ellipse(0, 0, height/16, height/16);
  
  popMatrix();
  
     //neptune
  pushMatrix();
  translate(height/2.1 * sin(radians(angle_neptune)), height/2.3 * cos(radians(angle_neptune)));
  if (angle_neptune < 360) {
    angle_neptune += 0.8;
  } 
  else {
    angle_neptune = 0;
  }
  fill(108, 123, 88);
  ellipse(0, 0, height/14, height/14);
  
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

