

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(0);
  for (int i = 0; i <= height; i+= width/150) { 
    fill(255);
    stroke(0);
    rect(width/2, i, mouseX * sin(map(i, 0, height, 0, TWO_PI)), width/50);
  }
}
