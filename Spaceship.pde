class Spaceship extends Floater {
  
 public Spaceship() {
   corners = 4;
   xCorners = new int[] {-10,-10,10,10};
   yCorners = new int[] {-10,10,10,-10};
   myXspeed = 3;
   myYspeed = 1;
   myPointDirection = 25;
   myColor = color(129,53,0);
 }
 public void move() {
   super.move();
   myPointDirection++;
 };
}
