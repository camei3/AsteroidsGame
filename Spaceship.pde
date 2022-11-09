class Spaceship extends Floater {
  
 public Spaceship() {
   corners = 4;
   int[] xCorn = {-10,-10,10,10};
   xCorners = xCorn;
   int[] yCorn = {-10,10,10,-10};
   yCorners = yCorn;
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
