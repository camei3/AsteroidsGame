class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected float[] xCorners;   
  protected float[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  
  protected float mySize; //stores hitbox
  
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if (myCenterX > width + mySize)
    {     
      myCenterX = -mySize;
    } else if (myCenterX + mySize < 0)
    {     
      myCenterX = width + mySize;
    }    
    if (myCenterY > height + mySize)
    {    
      myCenterY = -mySize;
    } else if (myCenterY + mySize < 0)
    {     
      myCenterY = height + mySize;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   

  public double getXV() {
    return myXspeed;
  }
  public double getYV() {
    return myYspeed;
  }
  public void setXSpeed(double newVx) {
    myXspeed = newVx;
  }
  public void setYSpeed(double newVy) {
    myYspeed = newVy;
  }
  public double getTheta() {
    return myPointDirection;
  }
  public void setTheta(double newTheta) {
    myPointDirection = newTheta;
  }

  public double getX() {
    return myCenterX;
  }

  public double getY() {
    return myCenterY;
  }

  public void setX(double newX) {
    myCenterX = newX;
  }

  public void setY(double newY) {
    myCenterY = newY;
  }
  
  public float getSize() {
    return mySize;
  }
} 
