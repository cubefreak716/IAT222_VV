class Object {
  
  float x, y, xVel, yVel, w, h;
  float r,g,b;
  boolean isHit = false; 
  float timer = -1; 
  
  Object() {
    //rgb(66, 134, 244)
    r = 153; 
    g = 209; 
    b = 255;
    
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
  
  void collision(ObjectR o){
    if(isHit == false){
      
      if(dist(o.x, o.y, x, y)<o.w/2+w/2  && (o.w - w) >10){   //bounces off aka loud
        //println("hiya"); 
         o.xVel = -o.xVel;
         xVel = -xVel; 
         o.yVel = -o.yVel;
         yVel = - yVel; 
         isHit = true;
         o.isHit = true; 
      }
      else if (dist(o.x, o.y, x, y)<o.w/2+w/2 && (w - o.w) >10 ){ //bounces off other version
         o.xVel = -o.xVel;
         xVel = -xVel; 
         o.yVel = -o.yVel;
         yVel = - yVel; 
         isHit = true;
         o.isHit = true;
      }
      else if(dist(o.x, o.y, x, y)<o.w/2+w/2){   //normal && o.w <100 && o.w > 20 && w <100 && w > 20
         isHit = true;
         o.isHit = true; 
         //println("hi"); 
         boom.remove(this);
         boomR.remove(o); 
         //purple
         ObjectM lala = new ObjectM(x,y);
         lala.w = w; 
         lala.h = h; 
         merge.add(lala); 
         //lala.drawMe(); 
      }
    }
    
  }
  
  
  void drawMe() {
    if(timer>0){
     timer --;  
    }
    if(timer == 0){
      boom.remove(this);  
    }
    pushStyle(); 
    noStroke(); 
    fill(r,g,b);
    ellipse(x,y,w,h);
    if(w>=0 && w<=5){         //whispers
        //println("size is right"); 
        if(x >= (500)){ 
          x += xVel;
          y += yVel;
          if(xVel>0){
            xVel -= 0.1;  
          }          
          if(yVel>0){
            yVel -= 0.01;  
          }
          if(yVel <= 0 && xVel <= 0){         //need to set a timer and after timer it removes itself
             g = 255;
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
    }
    if(w>100 && w < 400){
      xVel = xVel*1.2; 
      yVel = yVel*1.2; 
      x += xVel;
      y += yVel;      
    }
    if( w >= 400){ //biggest
      //xVel = xVel; 
      //yVel = yVel; 
      x += xVel;
      y += yVel; 
      r = 0; 
      g = 0; 
      b = 0; 
    }
    
    
    
    for(int i = 0; i<boomR.size(); i ++){
      collision(boomR.get(i));       
    }
    popStyle(); 
  }
  
  
}