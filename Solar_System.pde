// Solar system 
// Austin Cash Priebe
/* ToDo
 * 
 * Calculate mass based on size
 * 
*/

Body sun;
Body planet;
boolean planetHold = false;

void setup() {
  fullScreen();
  //size(1000, 1000);
  background(0);
  
  sun = new Body(new PVector(width/2, height/2), new PVector(0, 0), 50);
  sun.c = #FEFF00;
  sun.s = #FFD500;
  planet = new Body(new PVector(width/2, height/5), new PVector(15, 0), 5);
}

void draw() {
  if(planetHold) {
    planet.velocity = new PVector(0, 0);
    planet.acceleration = new PVector(0, 0);
    sun.location = new PVector(width/2, height/2);
    sun.velocity = new PVector(0, 0);
  } else {
    float sunM = sun.radius * sun.radius * sun.radius;
    float planetM = planet.radius * planet.radius * planet.radius;
    PVector gravity = PVector.sub(sun.location, planet.location);
    float r2 = gravity.magSq();
    float F = (0.75) * sunM * planetM / r2;
    gravity.setMag(F);
    planet.update(gravity);
    sun.update(gravity.mult(-1));
  }
  
  background(0);
  sun.display();
  planet.display();
  println("Planet: (" + planet.location.x + ", " + planet.location.y + ")");
  println("Sun:    (" + sun.location.x + ", " + sun.location.y + ")");
}  

void mousePressed() {
  planet.location = new PVector(mouseX, mouseY);
  planetHold = true;
}

void mouseReleased() {
  planetHold = false;
  PVector loc2 = new PVector(mouseX, mouseY);
  PVector vel2 = PVector.sub(loc2, planet.location);
  planet.velocity = PVector.div(vel2, 5);
}