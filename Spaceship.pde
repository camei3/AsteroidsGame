public class Spaceship extends Floater {

 public Spaceship() {
   corners = 7;
   xCorners = new float[] {12,-8,-11,-8,-8,-11,-8};
   yCorners = new float[] {0,8,6,3,-3,-6,-8};
   myXspeed = 0;
   myYspeed = 0;
   myPointDirection = 25;
   myColor = color(210,255,255);
   myCenterX = width/2;
   myCenterY = height/2;
   mySize = 1;
 }
 
}
