import processing.opengl.*;

int n = 1000;
int r = 100;
float x, y, xn, yn;
float balls[][] = new float[n][6];
color ball_clr[] = new color[n];

void setup() {
  smooth();
  size(screen.width, screen.height, OPENGL);
  for (int i = 0; i < n; i++) {
    balls[i][0] = random(width); // x
    balls[i][1] = random(height); // y
    balls[i][2] = random(TWO_PI);
    balls[i][3] = random(50);
    balls[i][4] = 1;
   // ball_clr[i] = color(random(255),0,random(100),random(155));
   if (i <= n/3) ball_clr[i] = color(255,0,0,100);
   if ((i > n/3) && (i<2*(n/3))) ball_clr[i] = color(0,255,0,100);
   if (i > 2*(n/3)) ball_clr[i] = color(0,0,255,100);
  //  balls[i][5] = color(random(255),random(255),random(255),random(255));
  }
}

void draw() {
  
  background(255);
  
  for (int i = 0; i < n; i++) {
    
    
    balls[i][0] += sin(balls[i][2]) * balls[i][3];
    balls[i][1] += cos(balls[i][2]) * balls[i][3];

   if (balls[i][0] > width || balls[i][0] < 0) {
      balls[i][2] *= -1;
    } 
    
    if (balls[i][1] > height || balls[i][1] < 0) {
      balls[i][2] = (balls[i][2] * -1) + PI;
    }
    
   /* for(int j = 0; j < n; j++) {
      if (dist(balls[i][0], balls[i][1], balls[j][0], balls[j][1]) < r*2 && dist(balls[i][0], balls[i][1], balls[j][0], balls[j][1]) > 0) {
       balls[i][2] *= -1;
      }
    } */
    
   
  }
 //   rotateX(map(mouseY, 0, height, 0, PI));
 // rotateY(map(mouseX, 0, width, 0, PI));

  for (int i = 0; i < n; i++) {
    noFill();
  // noStroke();
  // fill(ball_clr[i]);
   pushMatrix();
    ellipse(balls[i][0], balls[i][1], r, r);
  // translate(balls[i][0], balls[i][1], balls[i][1]);
  // sphere(r/2);
   popMatrix();
  }
}

