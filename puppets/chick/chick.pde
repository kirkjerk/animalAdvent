int BASECOUNT = 7; //chick

Chick c = new Chick();
Keeper k = new Keeper();
void setup(){
  size(500,500);
  strokeCap(SQUARE);   
}
void draw(){
  background(WHITE);
  k.draw();
  c.draw();
  
  k.adv();
}



class Chick extends Animal{
  float x = 250, y = 200;
 Chick(){
  super();
  BASE = 80;
  smallStrokeWeight = BASE/50;
  basicStrokeWeight = BASE/20;
  heavyStrokeWeight = BASE/15;
  PIECECOUNT = 10;
 }
 
   
  void draw(){   
      super.draw(); 
      
      pushMatrix();
      translate(k.avg(0,x),k.avg(0,y));
     
     pushMatrix();
     rotate(k.avg(0,map(k.scaleY, -1,1,-PI,PI)));
     drawBody(figX(1,0), figY(1,0), k.avg(20,BASE));
     
     
     float eyeang = -PI/5;
     drawEye(figX(2, (BASE * .2*cos(eyeang))), 
             figY(2, (BASE * .2*sin(eyeang))), k.avg(2,BASE*.2));
             

      drawBeak(3);
      
      drawWing(4);
      
popMatrix(); //main body rotation
float sep = abs(k.avg(1,k.scaleX*.75));
drawLegs(5,sep);
drawFeet(6,7,sep);


       popMatrix();
  }
  
  void drawBody(float x, float y, float sz){
      noStroke();
      fill(TAN);
      drawCircle(x,y,sz);
  }
  void drawEye(float x, float y, float sz){
     noStroke();
    fill(BLACK);
   drawCircle(x,y,sz); 
  }
  void drawBeak(int place){
     noFill();
    stroke(BLACK);
    setStrokeWeight();
    
    float sep = .5;
    if(mousePressed) sep = 0;
    
   drawV(figX(place,BASE/2),figY(place,0) + antizerod(5),
         k.avg(15,BASE / 4),k.avg(0,PI/2),
         k.avg(.3,sep)); 
  }
  
  float legDist(){
     return  BASE *.7;
  }
  
  void drawLegs(int place,float sep){
     noFill();
    stroke(BLACK);
    setStrokeWeight();
   drawV(figX(place,0),figY(place,BASE/2) + antizerod(5), //i.e. x y at bottom
      k.avg(15,legDist() ) , //how long out...
      k.avg(0,PI-sep*.5),
      avgd(.3,sep)); //how seperated 
  }
  
  void drawFeet(int place1, int place2,float sep){
     noFill();
    stroke(BLACK);
    setStrokeWeight();
    
  pushMatrix();
 translate(0,k.avg(0,figY(place1,BASE/2)));
   float a1 = PI+k.avg(0,PI-sep*.5);
    float x1 = legDist() * vXatAngle(a1,sep, true);
    float y1 = legDist() * vYatAngle(a1,sep, true);
    drawBirdTrack(figX(place1,x1),figY(place1,y1)-antizerod(5),k.avg(10,BASE/5),k.avg(0,a1+PI/2),.8);
 
    float x2 = legDist() * vXatAngle(a1,sep, false);
    float y2 = legDist() * vYatAngle(a1,sep, false);
    drawBirdTrack(figX(place2,x2),figY(place2,y2)-antizerod(5),k.avg(10,BASE/5),k.avg(0,-a1+PI/2),.8);
  popMatrix();  
    
    // pushMatrix();
  }
  
  
  void drawWing(int place){
    float a = PI*.67;
    float off = k.avg(0,BASE/5);
     draw3(figX(place,cos(a)*off),figY(place,sin(a)*off),k.avg(0,PI*.67),avgd(8,BASE*.2)); 
  }
  
}



//ANIMAL
