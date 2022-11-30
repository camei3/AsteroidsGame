class Asteroid extends Floater {
  private double myRotSpeed;
  private float mySize;
  public Asteroid() {
    
    myCenterX= width/2;
    myCenterY = height/2;
    
    myRotSpeed = (Math.random()-0.5)*2;
    myXspeed = (float)(Math.random()-0.5);
    myYspeed = (float)(Math.random()-0.5);   
    myColor = color(155,75,10);
    mySize = (float)Math.random()*8+4;
    double rotation = 0;
    ArrayList <Double> auxRadians = new ArrayList <Double>();
    do {
      auxRadians.add(rotation);
      rotation += Math.random()*(PI/12) + PI/6;      
    } while (rotation < 2*PI);
    
    corners = auxRadians.size();
    xCorners = new float[corners];
    yCorners = new float[corners];    
    for (int i = 0; i < corners; i++) {
      float rFactor = (float)((Math.random()-0.5) * mySize / 4);
      xCorners[i] = (float)Math.cos(auxRadians.get(i)) * mySize + rFactor;
      yCorners[i] = (float)Math.sin(auxRadians.get(i)) * mySize + rFactor;
      
      //xCorners[i] += (Math.random()-0.5) * mySize / 10;
      //yCorners[i] += (Math.random()-0.5) * mySize / 10;      
    }

  }
  
  
  public void move() {
    myPointDirection += myRotSpeed;
    super.move();
  }
  
  
}
