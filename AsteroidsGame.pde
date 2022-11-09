Spaceship ship = new Spaceship();
Star[] starSky = new Star[200];
void setup() {
  size(400,400);
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
