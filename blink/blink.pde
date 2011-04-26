int beat = 2;
int current = 0;

void setup() {
  size(screen.width, screen.height);
  colorMode(HSB, 100);
  frameRate(15);
}

void draw() {
  fill(current, 100, 100);
  rect(0, 0, screen.width, screen.height);
  if (current % 2 == 0) {
  fill(0);
  rect(0, 0, screen.width, screen.height);
  }
  if (current < 100) {
    current++;
  } else {
    current = 0;
  }
}
