class Particle {
  float x, y, xVel, yVel;
  int timer;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    xVel = random(-5, 5);
    yVel = random(-5, 5);
    timer = 20; 
  }
  
  void drawMe() {
    ellipse(x,y, 3, 3);
    x += xVel;
    y += yVel;
    if(timer > 0){
     timer--; 
    }
    if(timer == 0){
      explosion.remove(this); 
    }
      
  }
  
  
  
  
}
