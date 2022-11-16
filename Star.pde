public class Star {
  private double myX, myY;
  private int myColor;
  private float mySize;
  private double motionPos,motionAmp,motionPer;
  public Star() {
    myX = Math.random()*width;
    myY = Math.random()*height;
    myColor = color((int)(Math.random()*25)+200,(int)(Math.random()*25)+200,(int)(Math.random()*25)+130);  
    mySize = (float)(Math.random()*5);
    motionPos = Math.random()*2*PI;
    motionAmp = Math.random()*0.01+0.05;
    motionPer = radians((float)(Math.random()*0.1)+1);
  }
  public void show() {
    strokeWeight(mySize);
    stroke(myColor);
    point((float)myX,(float)myY);
  }
  public void move() {
    motionPos += motionPer;
    myY += Math.cos((float)motionPos)*motionAmp;
  }
  public double getMotionPos() {
    return motionPos;
  }
}
