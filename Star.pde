class Star {
  PVector pos;
  float r = 0, sinCount = 0, inc = 0;
  Star(float x, float y) {
    pos = new PVector(x, y);
    r = floor(random(2, 7));
    inc = random(0.001, 0.5);
  }
  void update() {
    pos.x += sin(sinCount * 3) * r/50 * floor(random(0,2));
    pos.y += sin(sinCount) * r/50 * floor(random(0,2));
    sinCount += inc;
  }
  void show() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, r, r);
  }
}