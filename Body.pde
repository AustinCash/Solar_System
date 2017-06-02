// Creates a body in a solar system

class Body {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  color c, s;
  
  Body(PVector loc, PVector vel, float r) {
    location = loc;
    velocity = vel;
    radius = r;
    c = color(127);
    s = color(170);
  }
  
  void update(PVector gforce) {
    acceleration = PVector.div(gforce, radius * radius * radius);
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void display() {
    stroke(s);
    strokeWeight(3);
    fill(c); 
    ellipse(location.x, location.y, 2 * radius, 2 * radius);
  }
}