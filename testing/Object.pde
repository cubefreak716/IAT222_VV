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
    //r = 0; 
    //g = 0; 
    //b = 0;
    
  }
  
  void collision(ObjectR o){
    if(isHit == false){      
      //if (dist(o.x, o.y, x, y) < o.w/2 + w/2 && (o.w - w) > 30) {   //bounces off aka loud
      //  //bouncing off: small vs. large
      //  //println("hiya"); 
      //  println("scenario 1: bounce");
      //  o.xVel = -o.xVel;
      //  xVel = -xVel; 
      //  //o.yVel = -o.yVel;
      //  //yVel = - yVel; 
      //  isHit = true;
      //  o.isHit = true;
      //} 
      //else if (dist(o.x, o.y, x, y) < o.w/2 + w/2 && (w - o.w) > 30 ) { //bounces off other version
      //  //bouncing off: large vs small
      //  println("scenario 2: bounce");
      //  o.xVel = -o.xVel;
      //  xVel = -xVel; 
      //  //o.yVel = -o.yVel;
      //  //yVel = - yVel; 
      //  isHit = true;
      //  o.isHit = true;
      //}
      //else if (dist(o.x, o.y, x, y) < o.w/2 + w/2) {   //normal && o.w <100 && o.w > 20 && w <100 && w > 20
      //  //merging: removes original circles and creates new object
      //  isHit = true;
      //  o.isHit = true; 
      //  println("scenario 3: purple merge"); 
      //  boom.remove(this);
      //  boomR.remove(o); 
      //  //purple
      //  ObjectM lala = new ObjectM(x, y);
      //  lala.w = w; 
      //  lala.h = h; 
      //  merge.add(lala); 
      //  //lala.drawMe();
      //}
      if ((dist(o.x, o.y, x, y) < o.w/2 + w/2 )&& w > o.w && isHit ==false && o.isHit == false) {  //if circles are touching and left circ is bigger than right circ
        //merging: two circles touch and travel together
        isHit = true;
        o.isHit = true; 
        println("scenario 4: merge and go right");
        float xDist = o.x - x;
        float yDist = o.y - y;
        //println(xDist, yDist);

        float newOX = x + xDist;
        float newOY = y + yDist;

        o.x = newOX;
        o.y = newOY;
        o.xVel = xVel;
        o.yVel = yVel;
      } 
      else if ((dist(o.x, o.y, x, y) < o.w/2 + w/2 )&& w < o.w && isHit ==false && o.isHit == false) {  //if circles are touching and left circ is smaller than right circ
        //merging: two circles touch and travel together
        isHit = true;
        o.isHit = true; 
        println("scenario 5: merge and go left");
        float xDist = o.x - x;
        float yDist = o.y - y;
        //println(xDist, yDist);

        float newOX = x + xDist;
        float newOY = y + yDist;

        //o.x = x; 
        //o.y = y; 

        o.x = newOX;
        o.y = newOY;
        xVel = o.xVel;
        yVel = o.yVel;
      }
      //else if (dist(o.x, o.y, x, y) < o.w/2 + w/2 && o.w >= w + 10 || o.w <= w - 10 && isHit == false && o.isHit == false) {
      //    //println("yasss");
      //    isHit = true;
      //    o.isHit = true;

      //    int current = 0;
      //    while (current != 30) {
      //      current += 1;
      //      Particle p = new Particle(x, y);
      //      explosion.add(p);
      //      //timerEx = p.timer;
      //    }
      //    boom.remove(this);
      //    boomR.remove(o);
          
      //}
      
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
    rectMode(CENTER);
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
        if(x >= (width/2)){ 
          x += xVel;
          y += yVel;
          if(xVel>0){
            xVel -= 0.1;  
          }
          if(yVel>0){
            yVel -= 0.01;  
          }
          //else if(yVel<0){
          //  yVel += 0.01;  
          //}
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
    if(w>100 && w < 400){
      //xVel = xVel*1.2; 
      //yVel = yVel*1.2; 
      x += xVel;
      y += yVel;   
        if(x >= (width/2)){ 
          x += xVel;
          y += yVel;
          if(xVel>0){
            xVel -= 0.1;  
          }          
          if(yVel>0){
            yVel -= 0.01;  
          }
          //if(yVel<0){
          //  yVel += 0.01;  
          //}
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
    if( w >= 400){ //biggest
      //xVel = xVel; 
      //yVel = yVel; 
      x += xVel;
      y += yVel; 
      //r = 0; 
      //g = 0; 
      //b = 0; 
        if(x >= (width/2)){ 
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
    
    
    
    for(int i = 0; i<boomR.size(); i ++){
      collision(boomR.get(i));       
    }
    popStyle(); 
  }
  
  
}