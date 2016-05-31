/* 
Team SALTY -- Sadia Azmine, Lucy Tang, Jessica Yang
APCS2 pd9
HW47 -- All That Bouncin'
2016-05-31
*/

Ball[] balls;

boolean reactionStarted;


void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
  balls[0].state = Ball.DEAD;
}


void draw() {
  background(0);
  mouseClicked();

  for (int i=0; i < balls.length; i++ ) {
    balls[i] = new Ball();
  }

  for (int i=0; i < balls.length; i++ ) {
    balls[i].draw();
    balls[i].process();
  }
  
  if ( reactionStarted ) {
     for (int i=0; i < balls.length; i++ ) {
        if ( balls[i].state != Ball.MOVING ) {
          for (int j=0; j < balls.length; j++) {
             if ( i!=j && balls[i].isTouching(balls[j]) && balls[j].state == Ball.MOVING ) {
                 balls[j].state = Ball.GROWING;
             }
          }
        }
     }
  }
}

void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].rad = 0.1;
    balls[0].state = Ball.GROWING;
    reactionStarted = true;
    }
}