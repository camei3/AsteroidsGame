class Bullet extends Floater {
  private double myLifespan = 0;
  
  public Bullet (Spaceship ship) {
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myXspeed = ship.getXV();
    myYspeed = ship.getYV();
    myPointDirection = ship.getTheta();
    mySize = 5;
    myColor = color(175,195,255);
  }
  public void accelerate() {
    myXspeed += 6*Math.cos(radians((float)myPointDirection));
    myYspeed += 6*Math.sin(radians((float)myPointDirection));
  }
  public void show() {
    fill(myColor);   
    stroke(myColor);    
    strokeWeight(mySize);
    point((float)myCenterX,(float)myCenterY);
 
  }
  public void move() {
    super.move();
    myLifespan += Math.sqrt(myXspeed*myXspeed+myYspeed*myYspeed);
  }
  
  public double getLifespan() {
    return myLifespan;
  }  
}
