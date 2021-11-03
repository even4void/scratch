int[] data = {0, 20, 40, 60, 80, 60, 40, 20, 0};

void settings() {
  size(220, 120);
}

void setup() {
  background(255);
  textSize(10);
}

void draw() {
  for (int i=0; i < height; i+=20) {
    stroke(233, 70);
    line(0, i, width, i);
  }
  for (int x=0; x < data.length; x++) {
    fill(100, 149, 237);
    rect(25*x, height-data[x], 20, data[x]);
    fill(255);
    text(data[x], 25*x + 5, height-data[x]+10);
  }
}
