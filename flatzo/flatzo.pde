/*
-zmena na texturu (gradient textury)
 -zoom
 -1. generacia a potom prechod skrz 3d
 */

import processing.opengl.*;

float fov;
color clr, clr_o;
float strk;
PImage img,img2,img3;

void setup() {
  frameRate(15);
  size(700, 700, P3D);
  // 
  smooth();
  background(#E3E3E3);
  img = loadImage("p.jpg");
  img2 = loadImage("p2.jpg");
  img3 = loadImage("p3.jpg");
  clr_o = color(#3CA028);
  strk = 5;
  
}

void draw() {
  //lights();
  fov = 1;

  background(clr);


  for (int i = 0; i < 4; i = i+1) {
    smooth();
    stroke(255);
    strokeWeight(strk);
    strokeJoin(ROUND);
    beginShape();
    if (int(random(8)) == 1) {
      // fill(255,0,0);
      fill(clr_o);
    } 
    else
    {
      fill(int(random(255)));
    }

    //  texture(img);
    vertex(random(height),random(width),random(700));
    vertex(random(height),random(width),random(700));
    vertex(random(height),random(width),random(700));
    vertex(random(height),random(width),random(700));
    vertex(random(height),random(width),random(700));
    endShape();
  }

  perspective(fov, 1, 1, 100);

  //  translate(width/2+30, height/2, 0);
  //  rotateX(-PI/6);
  //  rotateY(PI/3 + mouseY/float(height) * PI);
};



void keyPressed() {
  if (key == 'q') {
    clr = 255;
    clr_o = color(#3CA028);
  } 
  if (key == 'a') {
    clr = 0;
    clr_o = color(#3CA028);
  }
  if (key == 'w') {
    clr = 255;
    clr_o = color(255,0,0);
  }
  if (key == 's') {
    clr = 0;
    clr_o = color(255,0,0);
  }
  if (key == 'e') {
    clr = 255;
    clr_o = color(0,0,255);
  }
  if (key == 'd') {
    clr = 0;
    clr_o = color(0,0,255);
  }
  if (key == '1') {
    strk = 0;
    noStroke();
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
    strk = 20;
  }
  if (key == ' ') {
    noLoop();
  }  
}

void keyReleased() {
  if (key == ' ') {
    loop();
  }
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
