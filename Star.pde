class Star {
  PVector pos;
  float r = 0, sinCount = 0;
  Star(float x, float y) {
    pos = new PVector(x, y);
    r = floor(random(2, 7));
  }
  void update() {
    pos.add(sin(sinCount) * r, sin(sinCount) * r);
    sinCount += 0.1;
  }
  void show() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, r, r);
  }
}