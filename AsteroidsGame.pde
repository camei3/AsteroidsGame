Spaceship ship = new Spaceship();
Star[] starSky = new Star[200];
void setup() {
  size(800,600);
  for (int i = 0; i < starSky.length; i++) {
    starSky[i] = new Star();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < starSky.length; i++) {
    starSky[i].move();
    starSky[i].show();
  }
  ship.move();
  ship.show();
}

void keyPressed() {
  if (key == 'w') {
    ship.getTheta();
  }
}
