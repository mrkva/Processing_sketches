int fade = 255;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  update();
  ellipse(mouseX, mouseY, 30, 30);
  
}

void update() {
  fill(255, fade);
  fade -= 3;
}

void mouseMoved() {
  fade = 255;
}
