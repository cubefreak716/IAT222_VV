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

void setup() {
  size(1900, 1000);

  ////audio via computer mic////
  input = new AudioIn(this, 0); 
  input.start();
  analyzer = new Amplitude(this);   
  analyzer.input(input);
  
  
  ////arduino setup ////
  myPort = new Serial(this, Serial.list()[0], 9600); 

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
  }//port available
  
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
  if (keyPressed && vol>0) {
  //if (keyPressed) {
    /////using comp mic
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
  if (keyPressed && keyCode == RIGHT && vol2 >0 ) {
    //if (keyPressed && keyCode == RIGHT) {
    //using comp mic
    //float vol2 = 100*analyzer.analyze();
    //if(vol2<2){
    //   vol2 = 2;  
    //}
    ObjectR r = new ObjectR();
    r.x = width;
    r.y = height/2;
    r.xVel = random(-8, -2);
    r.yVel = random(-2, 2);
    //with input
    r.w = vol2;
    r.h = vol2;
    //without input
    //r.w = 2;
    //r.h = 2;

    boomR.add(r);
  }

}