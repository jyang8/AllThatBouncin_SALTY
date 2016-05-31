/* 
Team SALTY -- Sadia Azmine, Lucy Tang, Jessica Yang
APCS2 pd9
HW47 -- All That Bouncin'
2016-05-31
*/

class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;


  void draw() {
    ellipse( x, y, rad, rad );
    fill(c);
    move();
  }
  
  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 10;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }

 
  void bounce() {
    if ( x == 0 || x == 600 )
      dy *= -1;
    if ( y == 0 || y == 600 )
      dx *= -1; 
  }

  void process() {
    if ( state == GROWING ) {
      dx = 0; //stops moving
      dy = 0;
      float tmp = 2*rad; 
      while ( rad < tmp ) {
        rad++; //grows
      }
      state = SHRINKING;
    }
    if ( state == SHRINKING ) {
      while ( rad > 0 ) {
        rad--;
      }
      state = DEAD;
    }
    if ( state == DEAD ) {
      rad = 0;
    }
  }

  boolean isTouching( Ball other ) {
     return (this.x == other.x && this.y == other.y); 
  }
 
  
}//end class Ball