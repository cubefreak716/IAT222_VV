class ObjectM {
  
  float x,y, xVel, yVel, w, h;
  float r,g,b;
  boolean isHit = false;
  
  ObjectM(float x, float y) {
    //rgb(137, 66, 244)
    r = 153;
    g = 158;
    b = 255;
    this.x = x; 
    this.y = y; 
    
  }
  
  /*
  Object(float x, float y, float xVel, float yVel, float w, float h) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
    this.w = w;
    this.h = h;
    
  }*/
  
  //void collision(Object o){
    
  //  if(isHit == false){
      
  //    if(dist(o.x, o.y, x, y)<o.w/2+w/2 && o.w >=100 && w>=100){ //loud
  //       //collision from right
  //       o.xVel = -o.xVel;
  //       xVel = -xVel; 
  //       o.yVel = -o.yVel;
  //       yVel = - yVel; 
  //       isHit = true;
  //       o.isHit = true; 
  //    }
  //  }
    
  //}
  
  
  void drawMe() {
    //fill(0);
    pushStyle(); 
    noStroke(); 
    fill(r,g,b);
    ellipse(x,y,10,10);
    //rect(x,y,w*8,h);
    w += 1;
    h += 1;
    if (w>80){
     merge.remove(this);  
    }
    
    popStyle(); 
  }
  
  
}