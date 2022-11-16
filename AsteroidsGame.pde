Spaceship ship = new Spaceship();
Star[] starSky = new Star[200];
float charge = 0;
void setup() {
  size(800,600);
  newSky();
}

void draw() {
  
  double mouseAngle = Math.atan((mouseY-ship.getY())/(mouseX-ship.getX()));
  if (mouseX < ship.getX()) {
    mouseAngle += PI;
  }
  ship.setTheta(degrees((float)mouseAngle));
  
  background(0);
  for (int i = 0; i < starSky.length; i++) {
    starSky[i].move();
    starSky[i].show();
  }
  ship.move();
  ship.show();

  if (charge > 0) {
    charge -= 0.1;
  }
  noStroke();  
  fill(125);
  rect(width/2-100,height-20,200,10);
  fill(lerpColor(color(255,120,0),color(120,255,0),charge/100));
  rect(width/2-100,height-20,charge*2,10);
  
}

public void keyPressed() {
  if (key == 'w') {
    ship.setXSpeed(ship.getXV() + 0.1*Math.cos(radians((float)ship.getTheta())));
    ship.setYSpeed(ship.getYV() + 0.1*Math.sin(radians((float)ship.getTheta())));
  }
  
  if (key == 's') {
    ship.setXSpeed(ship.getXV() - 0.1*Math.cos(radians((float)ship.getTheta())));
    ship.setYSpeed(ship.getYV() - 0.1*Math.sin(radians((float)ship.getTheta())));
  }  
  
  if (key == ' ') {
    charge++;
    if (charge >= 100) {
      ship.setX(width/2);
      ship.setY(height/2);
      ship.setXSpeed(0);
      ship.setYSpeed(0);
      newSky();
      charge = 0;
    }
  }
}

void newSky() {
  for (int i = 0; i < starSky.length; i++) {
    starSky[i] = new Star();
  }  
}
