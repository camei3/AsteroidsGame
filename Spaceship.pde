public class Spaceship extends Floater {

 public Spaceship() {
   corners = 5;
   xCorners = new int[] {-10,10,15,10,-10};
   yCorners = new int[] {-10,-10,0,10,10};
   myXspeed = 0;
   myYspeed = 0;
   myPointDirection = 25;
   myColor = color(129,53,0);
   myCenterX = width/2;
   myCenterY = height/2;
 }
}
