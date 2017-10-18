ArrayList <SpaceShip> sp;
Moon moon;
void setup() {
  size(400, 700);
  moon = new Moon(250, 100);
  sp = new ArrayList <SpaceShip>();
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
  if(sp.size() > 50)sp.remove(sp.get(0));
}

void mousePressed(){
sp.add(new SpaceShip(mouseX, mouseY, moon));
}