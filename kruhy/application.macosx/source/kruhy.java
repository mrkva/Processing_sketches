import processing.core.*; 
import processing.xml.*; 

import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class kruhy extends PApplet {




boolean blue_on, red_on;
float y;
int n = 10;
float[] val = new float[200];

public void setup() {
  size(screen.width, screen.height, OPENGL);

  blue_on = false;
  red_on = false;
  noCursor();
}

public void draw() {
  background(0,0,0);
  sine();
}

public void sine() {
  for (int x = 0; x <= width; x += width/n) {

    for (int ell = 0; ell <= n; ell++) {
      if (val[ell] <= 360) {
        val[ell] += 0.1f;
      } 
      else {
        val[ell] = 0;
      }

      noFill();
      stroke(255);
      ellipse(x, map(sin(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + 50, mouseX/5  + 50);
      if (blue_on == true) {
        stroke(0,0,255);
        ellipse(x, map(cos(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + 50, mouseX/5  + 50);
      }
      if (red_on == true) {
        stroke(5,255,236);
        ellipse(x, map(tan(radians(val[ell]+ell*mouseY/100)), -1, 1, 0, height), mouseX/5 + 50, mouseX/5  + 50);
      }
    }
  }
}

public void keyPressed() {
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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--hide-stop", "kruhy" });
  }
}
