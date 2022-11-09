class Star {
  private float myX, myY;
  private int myColor;
  private float mySize;
  private float motionPos,motionAmp,motionPer;
  public Star() {
    myX = (float)(Math.random()*width);
    myY = (float)(Math.random()*height);
    myColor = color((int)(Math.random()*25)+150,(int)(Math.random()*25)+150,(int)(Math.random()*25)+80);  
    mySize = (float)(Math.random()*10);
    motionPos = (float)(Math.random()*2*PI);
    motionAmp = (float)(Math.random()*.01)+.01;
    motionPer = radians((float)(Math.random()*10)+5);
  }
  public void show() {
    strokeWeight(mySize);
    stroke(myColor);
    point(myX,myY);
  }
  public void move() {
    motionPos += motionPer;
    myY += cos(radians(motionPos))*motionAmp;
  }
}
