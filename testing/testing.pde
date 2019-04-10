import controlP5.*;
ControlP5 cp5; 
Slider Cone; 

//Arduino
import processing.serial.*;
Serial myPort; 
String val; 
float vol;  //blue
float vol2; //white
byte[] inBuffer = new byte[255];

import processing.sound.*;
import ddf.minim.*;

//Sound
AudioIn input; 
Amplitude analyzer;

float inVolLeft;
float inVolRight;

ArrayList<Object> boom = new ArrayList<Object>();
ArrayList<ObjectR> boomR = new ArrayList<ObjectR>();
ArrayList<Object> temp = new ArrayList<Object>();
ArrayList<ObjectM> merge = new ArrayList<ObjectM>(); 
ArrayList<Particle> explosion = new ArrayList<Particle>();

PrintWriter output;

void setup() {
  size(1900, 1000);
  //size(screen.width, screen.height); 
  surface.setResizable(true);
   cp5 = new ControlP5(this);
    cp5.addSlider("cone")
     .setRange(1,200)
     .setValue(1)
     .setPosition(100,200)
     .setSize(100,10)
     ;

  ////audio via computer mic////
  input = new AudioIn(this, 0); 
  input.start();
  analyzer = new Amplitude(this);   
  analyzer.input(input);
  
  output = createWriter("out.txt"); 
  
  ////arduino setup ////
  myPort = new Serial(this, Serial.list()[0], 9600); 
 
}

void draw() {
  
  ////bg////
  background(0);
  
  ////arduino connection code////
  
  if(myPort.available() > 0 ){
    println("  "); 
    
    myPort.readBytesUntil('&', inBuffer); 
    
    if(inBuffer != null){
       String s1 = new String(inBuffer); 
       
       String[] p = splitTokens(s1, "&"); 
       if(p.length<2) return; 
       
       String[] mic1 = splitTokens(p[0], "a"); 
       if(mic1. length != 3) return; 
       
       vol  = float(mic1[1]); 
       
       print("1st sensor:");
       print(vol);
       println(" "); 
       
       String[] mic2 = splitTokens(p[0],"b"); 
       if(mic2.length != 3) return; 
       vol2 = float(mic2[1]); 
       
       print("2nd sensor:"); 
       print(vol2); 
       println("  "); 
    }       
  }
  //port available
  
  //output.println(vol + " /  " + vol2);
  
  
  /////Room Tone ////
  // if (vol<5){
  //  vol = 5;  
  // }

  ////Draw output from left side////
  for (int i = 0; i < boom.size(); i++) {
    Object o = boom.get(i);
    o.drawMe();
    
    if (o.x > width || o.x < 0 || o.y > height || o.y < 0) {
      boom.remove(o);
    }
  }

  ////Draw output from right side////
  for (int i = 0; i < boomR.size(); i++) {
    ObjectR r = boomR.get(i);
    r.drawMe();

    if (r.x > width || r.x < 0 || r.y > height || r.y < 0) {
      boomR.remove(r);
    }
  }
  
  ////Draw merged objects////
  for(int m = 0; m<merge.size(); m++){
     merge.get(m).drawMe();  
  }
  
  ////Draw explosions////
  for (int i = 0; i < explosion.size(); i++) {
    Particle p = explosion.get(i);
    p.drawMe();
  }

  ////input for left side//// 
  if (keyPressed == false) {
  //if (keyPressed) {
    /////using comp mic
    //float vol = 100*analyzer.analyze();
    if (vol<2) {
      vol = 1;
    }
    if(vol>=500){
      vol = 500; 
    }
    Object o = new Object();
    o.x = 0;
    o.y = height/2;
       
    if(vol<6){
      o.xVel = random(6,10);
      o.yVel = random(-0.5,0.5); 
    }
    else if(vol>=6 && vol<200){
      o.xVel = random(2, 8);
      o.yVel = random(-3, 3);
    }
    else if(vol>=200){
      o.xVel = random(2, 8);
      o.yVel = random(-15, 15);
    }
    //o.xVel = random(2,5); 
    //o.yVel = random(-3,3); 
    //with input
    o.w = vol;
    o.h = vol;
    //without input
    //o.w = 5; 
    //o.h = 5; 
    //o.w = random(1, 20);
    //o.h = o.w; 
    
    //println("yes");

    boom.add(o);
  }



  ////input for right side////
  if (keyPressed == false) {
    //if (keyPressed && keyCode == RIGHT) {
    //using comp mic
    //float vol2 = 100*analyzer.analyze();
    if(vol2<2){
       vol2 = 1;  
    }
    if(vol2>=500){
      vol2 = 500; 
    }
    ObjectR r = new ObjectR();
    r.x = width;
    r.y = height/2;
    if(vol2<6){
      r.xVel = random(-10,-6);
      r.yVel = random(-0.5,0.5); 
    }
    else if(vol2>=6 && vol2<200){
      r.xVel = random(-8, -2);
      r.yVel = random(-3, 3);
    }
    else if(vol2>=200){
      r.xVel = random(-8, -2);
      r.yVel = random(-15, 15);
    }
    //r.xVel = random(-5,-2); 
    //r.yVel = random(-3,3); 
    //with input
    r.w = vol2;
    r.h = vol2;
    //without input
    //r.w = 5;
    //r.h = 5;

    boomR.add(r);
  }

}

void cone(float l){
  vol = l ;
}