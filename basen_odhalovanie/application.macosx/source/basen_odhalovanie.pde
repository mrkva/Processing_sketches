String chars = "bcdefghijklmnopqrstuvwxyz 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ !@#$%^&*()....,.,.__..,.,.___,..:..,.,.___,..:_,..:,.xxxzyxyyzxyyzxxzxz$%#@%@#^^#%@@$@#$@^!^!^^!^^^^!^!^!^(?";
String[][] newone = new String[7][5];
int a = 70;
int b = 80;
PFont libe;

void setup() {
  size(800, 1000);
  frameRate(10);
  libe = loadFont("LiberationMono-14.vlw");
}

void draw() {
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

void drawsegment() {
  
  a = int(map(mouseX, 0, width, 0, 130));
  b = a + int(map(mouseY, 0, height, 0, 30));
  
  int c = abs(b-a);
  
  for (int j = 0; j < 7; j++) {
    newone[j][0] = "";
  }
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 7; j++) {
      newone[j][0] += chars.charAt(int(random(c))+a);
    }
  }
  
  textFont(libe, 14);
  for (int j = 0; j < 7; j++) {
    text(newone[j][0], 1, j*14 + 14);
  }
 
  
}

