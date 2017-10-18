class SpaceShip {
  PVector pos, vel, acc;
  float speed = 3, r = 5, G = 0.4, mass = 10;
  int numOfTrajectories, trajectoriesCount = 0;
  Moon moon;
  PVector [] trajectories;
  ArrayList <PVector> trail = new ArrayList <PVector>();
  SpaceShip(float x, float y, Moon m) {
    pos = new PVector(x, y);
    vel = new PVector();
    acc = new PVector();
    moon = m;
    numOfTrajectories = floor(random(100));
    trajectories = new PVector[numOfTrajectories];
    for (int i = 0; i < numOfTrajectories - 1; i++) {
      trajectories[i] = new PVector(random(width), random(height));
    }
    trajectories[numOfTrajectories - 1] = new PVector(moon.pos.x, moon.pos.y);
  }

  void update() {
    acc = PVector.sub(trajectories[trajectoriesCount], pos);
    acc.normalize();
    acc.mult(0.1);
    vel.add(acc);
    vel.limit(speed);
    pos.add(vel);
    trail.add(new PVector(pos.x, pos.y));
    if (trail.size() > 50)trail.remove(trail.get(0));
    if(frameCount % 10 == 0)trajectoriesCount++;
    if (trajectoriesCount >= numOfTrajectories) {
      trajectoriesCount = numOfTrajectories - 1;
    }
  }

  void show() {
    float theta = vel.heading() + radians(90);    
    noFill();
    stroke(0, 255, 0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
    stroke(255, 0, 0);
    beginShape();
    for (PVector tr : trail)vertex(tr.x, tr.y);
    endShape();
  }
}