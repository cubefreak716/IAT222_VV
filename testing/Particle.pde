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
    pushStyle(); 
    noStroke(); 
    //fill(249, 255, 221); 
    fill(random(0,255), 0, random(0,255)); 
    ellipse(x,y, 5, 5);
    popStyle();
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