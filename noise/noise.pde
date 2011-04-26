import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioOutput out;
PinkNoise pn;
WhiteNoise wn;
int counter;


void setup()
{
  size(screen.width, screen.height);
  minim = new Minim(this);
  out = minim.getLineOut();
  pn = new PinkNoise(0.5);
  out.addSignal(pn);
  
}

void draw() {
  background(255);
  stroke(0);
  noFill();
  beginShape();
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  vertex(random(width), random(height));
  endShape();
  fill(0);
}
