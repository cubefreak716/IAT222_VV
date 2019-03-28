//Arduino
import processing.serial.*;
Serial myPort; 
String val; 
float vol;  //blue
float vol2; //white


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

void setup() {
  size(1900, 1000);

  ////audio via computer mic////
  input = new AudioIn(this, 0); 
  input.start();
  analyzer = new Amplitude(this);   
  analyzer.input(input);
  
  
  ////arduino setup ////
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600); 
  //myPort.bufferUntil('\n');

}

void draw() {
  
  ////bg////
  background(255);
  
  ////arduino connection code////
  //while(myPort.available() > 0){
    
  //  String inBuffer = myPort.readStringUntil('\n');   
  //  if (inBuffer != null) {      
  //    inBuffer = trim(inBuffer);
  //    vol = float(inBuffer);      
  //  }
  //  println("vol1 = " + vol); 
    
  //  String inBuffer2 = myPort.readStringUntil('\n'); 
  //  if(inBuffer2 != null){
  //     inBuffer2 = trim(inBuffer2); 
  //     vol2 = float(inBuffer2); 
  //  }    
  //  println("vol2 = " +vol2); 
  //}
  
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

  ////input for left side//// 
  if (keyPressed) {
    //float vol = 100*analyzer.analyze();
    //if (vol>40) {
    //  vol = 40;
    //}
    //println(vol); 
    //Object o = new Object(0, height/2, random(-2,2), random(-2,2), 10, 10);
    Object o = new Object();
    o.x = 0;
    o.y = height/2;
    o.xVel = random(2, 8);
    o.yVel = random(-2, 2);
    //with input
    //o.w = vol;
    //o.h = vol;
    //o.w = 5; 
    //o.h = 5; 
    o.w = random(1, 20);
    o.h = o.w; 
    
    //println("yes");

    boom.add(o);
  }



  ////input for right side////
  if (keyPressed && keyCode == RIGHT) {
    float vol2 = 100*analyzer.analyze();
    if(vol2<2){
       vol2 = 2;  
    }
    ObjectR r = new ObjectR();
    r.x = width;
    r.y = height/2;
    r.xVel = random(-8, -2);
    r.yVel = random(-2, 2);
    //r.w = 2;
    //r.h = 2;
    r.w = vol2;
    r.h = vol2;

    boomR.add(r);
  }

}