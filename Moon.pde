class Moon {
  PVector pos;
  Moon(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void show(){
  fill(255);
  noStroke();
  ellipse(pos.x, pos.y, 200, 200);
  }
}