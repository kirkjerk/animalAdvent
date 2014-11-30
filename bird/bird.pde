void setup(){
   size(120,120); 
}

color ORANGE = color(255, 128, 0);
color WHITE = color(255);
color TAN = color(255, 200, 100);
boolean isBird;
float shakeATailfeather =  0;// -.5 to .5, .125 increments


void draw(){
    background(255);
    isBird = !mousePressed;
    //println(isBird);
    strokeWeight(4);
    stroke(ORANGE);
    
    pushMatrix();
    if(! isBird){
       translate(4,7); 
    }
    drawBody();
    drawTail();
    
    drawBeak();
    drawLines();
    drawHead();
    drawPupil();
    drawFeet();
    drawWing();
    popMatrix();
   // saveFrame("shake_"+shakeATailfeather+".png");
    
    
    
}

void drawBody(){
    if(isBird) {
       fill(ORANGE);
      noStroke();
    } else {
       stroke(ORANGE);
      fill(WHITE);

     }
      pushMatrix();
     if(isBird){
       translate(60,50);
       arc(0,0,50,60,0,PI);
     } else {
       translate(10,15);
       rotate(-PI/2);
       arc(0,0,25,30,0,PI);
       line(-12,0,12,0);
    }
    popMatrix();
}

void drawTail(){
   noStroke();
  fill(ORANGE);
 float sz = 1;
   pushMatrix();
 if(isBird) {
   translate(39,54);
 //  float shakeATailfeather = map(mouseY,0,height,1,-1);
   
   rotate(-PI*5/4  + shakeATailfeather);
   sz = 1.3;
 }
  else {
    translate(70,15);
    rotate(PI/2);
   
  }
   
  triangle(0,0,-12*sz,25*sz,12*sz,25*sz);
    popMatrix(); 
}

void drawHead(){
  stroke(ORANGE);
  noFill();
     strokeWeight(8);
    if(isBird) ellipse(84,39,18,18);
    else ellipse(96,15,18,18);
    

}
void drawBeak(){
  noStroke();
  fill(TAN);
  pushMatrix();
  
 //translate((mouseX-20),(mouseY-20));
 if(isBird) translate(97,40);
 else {
   translate(16,65);
 rotate(-PI/2);
 }
  triangle(0,-7,20,0,0,7);
  //translate((mouseX-20),(mouseY-20));
  
  
  
  
  popMatrix();
}

void drawLines(){
   strokeWeight(2);
  stroke(0);
 


  if(isBird){
    line(96,39,114,40);
    
    line(56,79,56,97);
    line(65,79,70,96);
  } else {
     line(55,44,55,64); 
     line(90,44,90,64);
     line(100,44,100,64);
  }
}

void drawPupil(){
  noStroke();
  fill(0);
  if(isBird) ellipse(83,39,5,5); //81
  
  else ellipse(15,93,5,5);
  
}
void drawFeet(){
  strokeWeight(2);
  stroke(0);
  noFill();
  pushMatrix();
   if(isBird) {
     translate(56,99);
    rotate(.2);
   } else {
 
    
       translate(50,100);
       rotate(PI);
    
       

   }
   drawFoot();
  popMatrix();
  pushMatrix();
   
   if(isBird){
    translate(71,97);
    rotate(-1.3);
   } else {
       translate(70,100);
       rotate(PI);
     
   }
  drawFoot();
  popMatrix();
}


void drawFoot(){
  float sz = 8;
   line(0,0, -sz,sz);
   line(0,0, 0,sz*1.3);
   line(0,0, sz,sz);
}

void drawWing(){
  pushMatrix();
  // println((mouseX+20)+"::" +(mouseY+20)); 
   if(isBird){
     translate(62,64);
     rotate(3);
   } else {
     translate(98,94);
   }
   
   float sz = 8;
   arc(0, -sz/2, sz, sz, -PI*.75, PI/2);
   arc(0, sz/2, sz, sz, -PI*.5, PI*.75);
  popMatrix();
}
