import processing.opengl.*;

int[] posx = new int[10000];
int[] posy = new int[10000];
int[] posz = new int[10000];
int beginposx, beginposy;
int n = 30;
int count;

void setup() {
  size(screen.width, screen.height, OPENGL);
//  frameRate(10);
  
}

void draw() {
  kresli();
}



void kresli() {
  if (count == 5) {
  for (int i = 0; i < n*10; i++) {
    posx[i] = int(random(width/5)) * (round(random(2)) - 1)^1;
    posy[i] = int(random(height/5)) * (round(random(2)) - 1)^1;
    posz[i] = int(random(height/5)) * (round(random(2)) - 1)^1;
    count = 0;
  }
  } else { count++; }
  beginposx = mouseX;
  beginposy = mouseY;
  background(0);
  ellipse(mouseX,mouseY,20,20);
  translate(beginposx,beginposy);  
  pushMatrix();
  for (int i = 0; i < n; i++) {
    //strokeWeight(i);
    colorMode(HSB,100);
    stroke(int(random(100)),100,100);
    colorMode(RGB,255);
    noFill();
    ellipse(posx[i],posy[i],20,20);
    stroke(255);
    line(0,0,posx[i]+10,posy[i]+10);
    int ax = int(random(20));
    int ay = int(random(20));
    int bx = int(random(85));
    int by = int(random(85));
    line(0,0,posx[i]+ax,posy[i]+ay);
    ellipse(posx[i]+ax,posy[i]+ay,20,20);
    
    line(0,0,posx[i]+bx,posy[i]+by);
    ellipse(posx[i]+bx,posy[i]+by,20,20);
    translate(posx[i]+10,posy[i]+10);
    n = int(map(mouseX, 0, width, 3, 20));
  }
  popMatrix();
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

