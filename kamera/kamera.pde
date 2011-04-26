//import processing.opengl.*;


import processing.video.*;

Capture cam;
float[] br = new float[100000];


void setup() {

  size(500, 500);

  // If no device is specified, will just use the default.
  cam = new Capture(this, 100, 100);
}


void draw() {
  background(0,0,0);
  int index = 0;
  int numPixels = cam.width * cam.height;
  if (cam.available() == true) {
    cam.read();

    /*  for(int i = 0; i < numPixels; i++) {
     br[i] = brightness(cam.pixels[i]) / 20;
     }*/
    pushMatrix();

    for(int x = 0; x < cam.width; x++) {
      translate(0,5);
      for(int y = 0; y < cam.height; y++) {
        index++;
        noFill();
        stroke(255,255,255);
        br[index] = brightness(cam.pixels[x*y]) / 20;
        translate(5,0);
        ellipse(0, 0, br[x*y], br[x*y]);
      }
    }
    popMatrix();
  }
} 

