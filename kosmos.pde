ArrayList <SpaceShip> sp;
ArrayList <Star> stars;
Moon moon;
void setup() {
  size(400, 700);
  moon = new Moon(250, 100);
  sp = new ArrayList <SpaceShip>();
  stars = new ArrayList <Star>();
  for (int i = 0; i < 300; i++)stars.add(new Star(floor(random(width / 5)) * 5, floor(random(height / 5)) * 5));
}
void draw() {
  background(0);
  moon.show(); 
  if (sp != null) {
    for (SpaceShip SP : sp) {
      SP.update();
      SP.show();
    }
  }
  for (Star s : stars) {
    s.update();
    s.show();
  }
  if (sp.size() > 50)sp.remove(sp.get(0));
}

void mousePressed() {
  sp.add(new SpaceShip(mouseX, mouseY, moon));
}