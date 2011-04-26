import oscP5.*;
import netP5.*;

import processing.opengl.*;


boolean blue_on, red_on;
float y;
int counter;
int n = 10;
int offx, offy, type;
float[] val = new float[200];
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",57120);
  size(screen.width, screen.height, OPENGL);
  offx = 50;
  offy = 50;
  blue_on = false;
  red_on = false;
  type = 2;
  noCursor();
}

void draw() {
  background(0,0,0);
  
  counter = (counter+1)%6;
  
  if (counter ==0) {
 
   //in the following different ways of creating osc messages are shown by example 
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(n); // add a float to the osc message 

  // send the message 
  oscP5.send(myMessage, myRemoteLocation); 
  }
  
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


void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(" arguments: 0 "+theOscMessage.get(0).intValue()+" 1 "+theOscMessage.get(1).stringValue()+" 2 "+theOscMessage.get(2).floatValue());
  
 // n = theOscMessage.get(1).intValue();
 // println(n);
}
