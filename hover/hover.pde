import processing.opengl.*;

int count = 7;
float[][] e = new float[count][5];

void setup() {
 
  size(600, 600, OPENGL);
  smooth();
  for (int i = 0; i < count; i++) {
    e[i][0] = random(width); // random x coordinate
    e[i][1] = random(height);  // random y coordinate
    e[i][2] = random(255); // random color which gets rewrited later when hover
    e[i][3] = e[i][2]; // original, stored after mouse left the object
    e[i][4] = 0; // dragged ? (0 | 1)
  }
}

void draw() {
  fill(0,1);
 noStroke();
 rect(0,0,width,height);
 stroke(255);
 // background(255);
  
  for (int i = 0; i < count; i++) {
    e[i][0] += ((round(random(1)) * 2) - 1) * noise(mouseX*0.05);
    e[i][1] += ((round(random(1)) * 2) - 1) * noise(mouseY*0.05);
  }

  
  //hover
  for (int i = 0; i < count; i++) {
    if ( (dist(e[i][0], e[i][1], mouseX, mouseY)) < 15) {
      e[i][2] = color(255,0,0);
    } else {
      e[i][2] = e[i][3];
    }
  }
    
  for (int i = 0; i < count; i++) {
    fill(255);
    ellipse(e[i][0], e[i][1], 10, 10);
  }  
  
  noFill();  
  beginShape();
  curveVertex(e[0][0], e[0][1]);
  for (int i = 0; i < count; i++) {
    curveVertex(e[i][0], e[i][1]);
    
  }
  curveVertex(e[0][0], e[0][1]);
  curveVertex(e[0][0], e[0][1]);
  endShape(CLOSE);

}

void mouseDragged() {
  for (int i = 0; i < count; i++) {
    if ( (dist(e[i][0], e[i][1], mouseX, mouseY)) < 15) {
      e[i][4] = 1;
    }
  }
  
  for (int i = 0; i < count; i++) {
    if (e[i][4] == 1) {
      e[i][0] = mouseX;
      e[i][1] = mouseY;
    }
  }
  
}

void mouseReleased() {
  for (int i = 0; i < count; i++) {
    e[i][4] = 0;
  }
}
