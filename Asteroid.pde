class Asteroid extends Floater {
  private double myRotSpeed;
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
      float rFactor = (float)((Math.random()-0.5) * mySize / 2);
      double rRange = (auxRadians.get( (i+1) % auxRadians.size() ) + 2*PI - auxRadians.get(i) ) % (2*PI);
      xCorners[i] = (float)Math.cos(auxRadians.get(i) + rRange/2 + Math.random()*rRange/5) * (mySize + rFactor);
      yCorners[i] = (float)Math.sin(auxRadians.get(i) + rRange/2 + Math.random()*rRange/5) * (mySize + rFactor);
    }
  }
  
  public void move() {
    myPointDirection += myRotSpeed;
    super.move();
  }
  
  
}
