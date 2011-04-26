import promidi.*;

import processing.opengl.*;

MidiIO midiIO;
int count;
int t = 3;
int a = 255;
int[] angle = new int[2];
int clr;
boolean color_switch, on;

void setup() {
  size(screen.width, screen.height, OPENGL);
  colorMode(HSB, 255);
  on = true;
  
   midiIO = MidiIO.getInstance(this);
 
  midiIO.plug(this,"controllerIn",1,0);
}

void draw() {
  if (on == true) {
  background(255);
  noStroke();
  
  
  if (count < t) {
    if (color_switch == true) {
      fill(map(clr, 0, 255, 0, 255), 255, 255);
    } 
    else {
      fill(0, 255, 255);
    }
    rect(0, 0, (width/3)*2, height);
  } 
  else {
    if (color_switch == true) {
      fill(map(clr, 0, 255, 255, 0), 255, 255);
    } 
    else {
      fill(150, 255, 255);
    }
   rect(width/3, 0, (width/3)*2, height);
  }

  count++;
  clr++;
  
  if (count >= 2*t) count = 0;
  if (clr == 255) clr =0;
  } else {
   background(0); 
  }
}

void keyPressed() {
  if (key == 'q') {
    if (color_switch == false) {
    color_switch = true;
    } else {
    color_switch = false;
    }
  }
  if (key == 'a') {
    if (on == true) {
    on = false;
    } else {
    on = true;
    }
  }
}

void controllerIn(Controller controller){
  t = int(map(controller.getValue(), 0, 127, 1, 7));
  println(t);
}
