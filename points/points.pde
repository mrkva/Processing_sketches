int n = 100;
int count;
float[][] points = new float[n*n*n][5];

void setup() {
  size(500, 500);
  for (int i = 0; i < width; i+= width/n) {
    for (int j = 0; j < height; j+= height/n) {
      points[count][0] = i;
      points[count][1] = j;
      point(i, j);
      count++;
    }
  }
}

void draw() {
  
}

