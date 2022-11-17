public class Star {
  private double myX, myY;
  private int myColor;
  private float mySize;
  private double cyclePos,motionAmp,motionPer;
  public Star() {
    myX = Math.random()*width;
    myY = Math.random()*height;
    myColor = color((int)(Math.random()*25)+200,(int)(Math.random()*25)+200,(int)(Math.random()*25)+130);  
    mySize = (float)(Math.random()*5);
    cyclePos = Math.random()*2*PI;
    motionAmp = Math.random()*0.05+0.1;
    motionPer = frameRate*((Math.random()*5)+15);
  }
  public void show() {
    strokeWeight(mySize);
    stroke(myColor);
    point((float)myX,(float)myY);
  }
  public void move() {
    cyclePos += 2*PI/(motionPer);
    myY += Math.cos((float)cyclePos/motionAmp)*motionAmp;
  }
  public double getCyclePos() {
    return cyclePos;
  }
}
