Spaceship ship = new Spaceship();
Star[] starSky = new Star[200];
TimerUI hyperBar;
boolean mouseMode = true;
float refresh = 0;
void setup() {
  size(800, 600);
  newSky();
  hyperBar = new TimerUI(width/2-100, height-20, 200, 10, 100);  
}

void draw() {
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
    translate((width*refresh*2/100)-width,0);
    fill(lerpColor(color(0,0),color(0,255),(50-abs(50-refresh))/50));
    rect(0, 0, width, height); 
    resetMatrix();
    refresh-=2.5;

  }
}

public void keyPressed() {
  if (refresh <= 0) {
    if (key == 'x') {
      mouseMode = !mouseMode;
    }
    
    
    if (key == 'q') {
      ship.setTheta(ship.getTheta()-9);
    }
    if (key == 'e') {
      ship.setTheta(ship.getTheta()+9);      
    }    
    if (key == 'w') {
      ship.setXSpeed(ship.getXV() + 0.1*Math.cos(radians((float)ship.getTheta())));
      ship.setYSpeed(ship.getYV() + 0.1*Math.sin(radians((float)ship.getTheta())));
    }
    
    if (key == 's') {
      ship.setXSpeed(ship.getXV() + 0.1*Math.cos(radians((float)ship.getTheta())+PI));
      ship.setYSpeed(ship.getYV() + 0.1*Math.sin(radians((float)ship.getTheta())+PI));
    }  
    if (key == 'a') {
      ship.setXSpeed(ship.getXV() + 0.1*Math.cos(radians((float)ship.getTheta())-PI/2));
      ship.setYSpeed(ship.getYV() + 0.1*Math.sin(radians((float)ship.getTheta())-PI/2));
    }  
    if (key == 'd') {
      ship.setXSpeed(ship.getXV() + 0.1*Math.cos(radians((float)ship.getTheta())+PI/2));
      ship.setYSpeed(ship.getYV() + 0.1*Math.sin(radians((float)ship.getTheta())+PI/2));
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

void newSky() {
  for (int i = 0; i < starSky.length; i++) {
    starSky[i] = new Star();
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
    rect(myX,myY,myW,myH);
    fill(lerpColor(startColor,endColor,cooldown/maxTime));
    rect(myX,myY,myW*cooldown/maxTime,myH);
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

