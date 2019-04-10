class ObjectR {
  
  float oX = width; 
  float oY = height/2; 
  
  float x, y, xVel, yVel, w, h;
  float r,g,b;
  boolean isHit = false;
  float timer = -1; 
  
  ObjectR() {
    //rgb(255, 153, 153)
    r = 255;
    g = 153;
    b = 153; 
    
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
  
  void collision(Object o){
    
    if(isHit == false){
      
      if(dist(o.x, o.y, x, y)<o.w/2+w/2 && o.w >=100 && w>=100){ //loud
         //collision from right
         o.xVel = -o.xVel;
         xVel = -xVel; 
         o.yVel = -o.yVel;
         yVel = - yVel; 
         isHit = true;
         o.isHit = true; 
      }
    }
    
  }
  
  
  void drawMe() {
    //fill(0);
    if(timer>0){
     timer --;  
    }
    if(timer == 0){
      boomR.remove(this);  
    }
    
    pushStyle(); 
    noStroke(); 
    fill(r,g,b);
    ellipse(x,y,w,h);
    //rect(x,y,w*8,h);
    if(w>=0 && w<=5){       //whispers
        
       if(x <= (1400)){
          x += xVel;
          y += yVel;
          if(xVel<0){ 
            xVel += 0.1;  
          }          
          if(yVel<0){
            yVel += 0.01;  
          }
          if(yVel >= 0 && xVel >= 0){         //need to set a timer and after timer it removes itself
             //r = 0; 
             b = 255; 
             if(timer == -1)
             timer = 50; 
          }
        }
        else{
          x += xVel;
          y += yVel;
        }
    }
    if(w>5 && w<=100){      //normal 
      x += xVel;
      y += yVel;
     if(x <= (width/2)){
          x += xVel;
          y += yVel;
          if(xVel<0){ 
            xVel += 0.1;  
          }          
          if(yVel<0){
            yVel += 0.01;  
          }
          if(yVel >= 0 && xVel >= 0){         //need to set a timer and after timer it removes itself
             //r = 0; 
             b = 255; 
             if(timer == -1)
             timer = 50; 
          }
        }
        else{
          x += xVel;
          y += yVel;
        }
    }
    if(w>100){             //loud
      //xVel = xVel*1.01; 
      //yVel = yVel*1.01;
      x += xVel;
      y += yVel;
     if(x <= (width/2)){
          x += xVel;
          y += yVel;
          if(xVel<0){ 
            xVel += 0.1;  
          }          
          if(yVel<0){
            yVel += 0.01;  
          }
          if(yVel >= 0 && xVel >= 0){         //need to set a timer and after timer it removes itself
             //r = 0; 
             b = 255; 
             if(timer == -1)
             timer = 50; 
          }
        }
        else{
          x += xVel;
          y += yVel;
        }
      
    }
    
    
    
    
    for(int i = 0; i<boom.size(); i ++){
      collision(boom.get(i));       
    }
    popStyle(); 
  }
  
  
}