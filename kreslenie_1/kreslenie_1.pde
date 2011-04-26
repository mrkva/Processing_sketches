import processing.opengl.*;

int arrx[] = new int[2000];
int arry[] = new int[2000];
int mousex, mousey;
int cachex, cachey;
int count, time;

void setup() {
  size(500, 500, OPENGL);
  time = int(random(30));
}

void draw() {
  if (count <= 100) {
    count++;
  } 
  else {
    count = 0;
  }

  if (count == time) {
    mousex = mouseX;
    mousey = mouseY;
    cachex = mousex;
    cachey = mousey;
  }
}


void mousemove() {


  line(cachex, cachey, mouseX, mouseY);
}


void mouseMoved() {
  mousemove();
}

void keyPressed() {
  if (key == ' ') {
    mousex = mouseX;
    mousey = mouseY;
    cachex = mousex;
    cachey = mousey;
  }
}

