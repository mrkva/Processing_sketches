import processing.core.*; 
import processing.xml.*; 

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

public class basen_odhalovanie extends PApplet {

String chars = "bcdefghijklmnopqrstuvwxyz 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ !@#$%^&*()....,.,.__..,.,.___,..:..,.,.___,..:_,..:,.xxxzyxyyzxyyzxxzxz$%#@%@#^^#%@@$@#$@^!^!^^!^^^^!^!^!^(?";
String[][] newone = new String[7][5];
int a = 70;
int b = 80;
PFont libe;

public void setup() {
  size(800, 1000);
  frameRate(10);
  libe = loadFont("LiberationMono-14.vlw");
}

public void draw() {
  background(255);
  fill(0);

  for(int i = 0; i < width; i+=80) {
    for(int j = 0; j < height; j+=97) {
        pushMatrix();
      
      translate(i, j);
      drawsegment();
      popMatrix();
    }
  }
  
}

public void drawsegment() {
  
  a = PApplet.parseInt(map(mouseX, 0, width, 0, 130));
  b = a + PApplet.parseInt(map(mouseY, 0, height, 0, 30));
  
  int c = abs(b-a);
  
  for (int j = 0; j < 7; j++) {
    newone[j][0] = "";
  }
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 7; j++) {
      newone[j][0] += chars.charAt(PApplet.parseInt(random(c))+a);
    }
  }
  
  textFont(libe, 14);
  for (int j = 0; j < 7; j++) {
    text(newone[j][0], 1, j*14 + 14);
  }
 
  
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "basen_odhalovanie" });
  }
}
