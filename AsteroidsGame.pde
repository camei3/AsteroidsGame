Spaceship ship;
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
Star[] starSky = new Star[200];
TimerUI hyperBar;
boolean mouseMode = false;
float refresh = 0;

boolean wKey, aKey, sKey, dKey, qKey, eKey;



void setup() {
  size(800, 600);
  newSky();
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).setX(Math.random()*width);
    asteroids.get(i).setY(Math.random()*height);
  }    
  ship = new Spaceship();  
  hyperBar = new TimerUI(width/2-100, height-20, 200, 10, 100); 
  wKey = aKey = sKey = dKey = qKey = eKey = false;
}

void draw() {
  doMovement();
  if (mouseMode) {
    double mouseAngle = Math.atan((mouseY-ship.getY())/(mouseX-ship.getX()));
    if (mouseX < ship.getX()) {
      mouseAngle += PI;
    }    
    ship.setTheta(degrees((float)mouseAngle));
  }

  background(0);
  for (int i = 0; i < starSky.length; i++) {
    starSky[i].move();
    starSky[i].show();
  }
  ship.move();
  ship.show();
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  for (int i = asteroids.size()-1; i >= 0; i--) {
    if (dist((float)asteroids.get(i).getX(),(float)asteroids.get(i).getY(),(float)ship.getX(),(float)ship.getY()) < ship.getSize()+asteroids.get(i).getSize()) {
      asteroids.remove(i);
    }
  }


  hyperBar.tick(-0.1);
  hyperBar.show();
  if (refresh > 0) {
    if (refresh == 50) {
      ship.setX(Math.random()*width);
      ship.setY(Math.random()*height);
      ship.setTheta(Math.random()*360);
      ship.setXSpeed(0);
      ship.setYSpeed(0);                       
      newSky();
    }
    translate((width*refresh*2/100)-width, 0);
    fill(lerpColor(color(0, 0), color(0, 255), (50-abs(50-refresh))/50));
    rect(0, 0, width, height); 
    resetMatrix();
    refresh-=2.5;
  }
}

public void keyPressed() {
  if (refresh <= 0) {
    if (key == 'q') {
      qKey = true;
    }
    if (key == 'e') {
      eKey = true;
    }    
    if (key == 'w') {
      wKey = true;
    }
    if (key == 's') {
      sKey = true;
    }  
    if (key == 'a') {
      aKey = true;
    }  
    if (key == 'd') {
      dKey = true;
    }
    if (key == 'x') {
      mouseMode = !mouseMode;
    }

    if (key == ' ') {
      hyperBar.tick(1.5);
      if (hyperBar.isFilled()) {
        refresh = 100;
        hyperBar.reset();
      }
    }

  }
}
public void keyReleased() {
  if (key == 'q') {
    qKey = false;
  }
  if (key == 'e') {
    eKey = false;
  }    
  if (key == 'w') {
    wKey = false;
  }
  if (key == 's') {
    sKey = false;
  }  
  if (key == 'a') {
    aKey = false;
  }  
  if (key == 'd') {
    dKey = false;
  }
  
  if (key == '.') {
    asteroids.add(new Asteroid());
  }
  if (asteroids.size() > 0 && key == ',') {
    asteroids.remove(0);
  }
}
void newSky() {
  for (int i = 0; i < starSky.length; i++) {
    starSky[i] = new Star();
  }
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < 100; i++) {
    asteroids.add(new Asteroid());
  }  
}

public class TimerUI {
  private float myX, myY, myW, myH;
  private float cooldown, maxTime;
  private color startColor, endColor, noColor;
  public TimerUI(float x, float y, float w, float h, float t) {
    myX = x;
    myY = y;
    myW = w;
    myH = h;
    cooldown = 0;
    maxTime = t;
    noColor = startColor = color(64);    
    endColor = color(255);
  }

  public void show() {
    noStroke();
    fill(noColor);
    rect(myX, myY, myW, myH);
    fill(lerpColor(startColor, endColor, cooldown/maxTime));
    rect(myX, myY, myW*cooldown/maxTime, myH);
  }

  public void tick(float rate) {
    if (cooldown - rate < maxTime && cooldown + rate > 0) {   
      cooldown += rate;
    }
  }
  public void reset() {
    cooldown = 0;
  }
  public boolean isFilled() {
    return (cooldown >= maxTime);
  }
  public void newColors(color nC, color sC, color eC) {
    noColor = nC;
    startColor = sC;    
    endColor = eC;
  }
}

public void doMovement() {
  if (qKey) {
    ship.setTheta(ship.getTheta()-3);
  }
  if (eKey) {
    ship.setTheta(ship.getTheta()+3);
  }    
  if (wKey) {
    ship.setXSpeed(ship.getXV() + 0.02*Math.cos(radians((float)ship.getTheta())));
    ship.setYSpeed(ship.getYV() + 0.02*Math.sin(radians((float)ship.getTheta())));
  }
  if (sKey) {
    ship.setXSpeed(ship.getXV() + 0.01*Math.cos(radians((float)ship.getTheta())+PI));
    ship.setYSpeed(ship.getYV() + 0.01*Math.sin(radians((float)ship.getTheta())+PI));
  }  
  if (aKey) {
    ship.setXSpeed(ship.getXV() + 0.01*Math.cos(radians((float)ship.getTheta())-PI/2));
    ship.setYSpeed(ship.getYV() + 0.01*Math.sin(radians((float)ship.getTheta())-PI/2));
  }  
  if (dKey) {
    ship.setXSpeed(ship.getXV() + 0.01*Math.cos(radians((float)ship.getTheta())+PI/2));
    ship.setYSpeed(ship.getYV() + 0.01*Math.sin(radians((float)ship.getTheta())+PI/2));
  }
}
