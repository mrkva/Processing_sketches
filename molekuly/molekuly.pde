import processing.opengl.*;

int l = 100;
int sphere_size = 30;
int lastx, lasty;
float[][] e = new float[100][2];

void setup() {

  size(screen.width, screen.height, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  colorMode(HSB, 100);
}

void draw() {

  background(0, 0, 100);
  stroke(0, 0, 0);
  strokeWeight(3);
  fill(0, 0, 100);
  //  l = mouseX / 6;
  //  sphere_size = mouseY / 6;

  translate(screen.width/2, screen.height/2);

  rotateX(map(mouseY, 0, height, 0, PI));
  rotateY(map(mouseX, 0, width, 0, PI));

  translate(0, -1 * int((l*0.5)/0.587));

  /*  sphere(sphere_size);
   line(0, 0, int(-0.809 * l), int(0.587 * l));
   
   translate(int(-0.809 * l), int(0.587 * l));
   sphere(sphere_size);
   line(0, 0, int(0.309 * l), int(0.951 * l));
   
   translate(int(0.309 * l), int(0.951 * l));
   sphere(sphere_size);
   line(0, 0, l, 0);
   
   translate(l, 0);
   sphere(sphere_size);
   line(0, 0, int(0.309 * l), int(-0.951 * l));
   
   translate(int(0.309 * l), int(-0.951 * l));
   sphere(sphere_size);
   
   line(0, 0, int(-0.809 * l), int(-0.587 * l));
   
   // translate(int(0.809 * l), int(0.587 * l));
   
   line(0, 0, int(0.909 * l), int(-0.309 * l));
   translate(int(0.909 * l), int(-0.309 * l));
   sphere(sphere_size);
   
   //
   
   
   line(0, 0, l, 0);
   
   translate(l, 0);
   sphere(sphere_size);
   line(0, 0, int(0.309 * l), int(-0.951 * l));
   
   translate(int(0.309 * l), int(-0.951 * l));
   sphere(sphere_size);
   
   line(0, 0, int(-0.809 * l), int(-0.587 * l));
   translate (int(-0.809 * l), int(-0.587 * l));
   sphere(sphere_size);
   
   line(0, 0, int(-0.809 * l), int(0.587 * l));
   
   translate(int(-0.809 * l), int(0.587 * l));
   sphere(sphere_size);
   line(0, 0, int(0.309 * l), int(0.951 * l)); */
   
    for (int i = 0; i < 10; i++) {
    if( dist(e[i][0],e[i][1],mouseX,mouseY) < 10 ) {

      // Change fill color to green.
      fill(64,187,128,100);
    }
  }
  polygon(5, 0, 0, l, 100);
  polygon(5, 0, 0, l, -100);
 
}


void polygon(int n, float cx, float cy, float r, int z)
{
  float angle = 360.0 / n;
  for (int i = 0; i < n; i++)
  {
    translate(cx + r * cos(radians(angle * i)),
    cy + r * sin(radians(angle * i)), z);
    e[i][0]= cx + r * cos(radians(angle * i)); 
    e[i][1]= cy + r * sin(radians(angle * i));  

    sphere(sphere_size);
    line(0, 0, (r + r/1.5) * cos(radians(angle * (i-3))),
    (r + r/1.5) * sin(radians(angle * (i-3))));

    translate(-cx + r * cos(radians(angle * i)),
    -cy + r * sin(radians(angle * i)), -z);
  }
}


void tube(float cx, float cy, float r, int z) {
  beginShape();
  ellipse(cx, cy, r, r);
  endShape();
}

