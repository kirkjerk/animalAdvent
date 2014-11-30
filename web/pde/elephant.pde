int BASECOUNT = 22; //elephant

Elephant e = new Elephant();
Keeper k = new Keeper();
void setup(){
  size(500,500);
  strokeCap(SQUARE);
    
}
void draw(){
  background(WHITE);
  e.draw();
  k.draw();
  k.adv();
}



class Elephant extends Animal{
  float x = 380, y = 222;
 Elephant(){
  super();
  BASE = 180;
  smallStrokeWeight = BASE/50;
  basicStrokeWeight = BASE/20;
  heavyStrokeWeight = BASE/10;
  PIECECOUNT = 20;
 }
 
   
  void draw(){   

      super.draw(); 
     
      pushMatrix();
      translate(k.avg(0,x),k.avg(0,y));
   
     float headAngle = k.avg(0,-k.scaleY);

       pushMatrix();       //head rotation...
         translate(k.avg(0, -BASE),0);
         rotate(k.avg(0,headAngle));

         drawBackTusk(5);
         
         drawBackEar(4);
       pushMatrix();
         rotate(k.avg(0,1));
         drawTrunkAndHeadCirle(1);
         popMatrix();
         
         
         
       popMatrix();//end head
     
     drawLegs(10,11,12,13);
     drawToenails(15 ,17,19,21);
     drawTail(7);
     drawButt(2);
      drawBody(14);  
      
     pushMatrix(); //head stuffprin
         translate(k.avg(0, -BASE),0);
         rotate(headAngle);
     
     
     drawEar(3);
     
     drawFrontTusk(6);
     drawEyes(8,9);
     
         popMatrix();
      
         
         
         
       popMatrix();
  }
  void drawTrunkAndHeadCirle(int place){
         noFill(); stroke(GRAY);
         setHeavyStrokeWeight();
         //println(place);
         //we're cheating the head coloring here, as a seperate circle-
         //kind of part of the S, but it needs sep color control
         //grab the x so it only computes once, and the rest just because it's shared 
         float x = figX(place,0);
         float y = figY(place,BASE*.35);
          //fill(LITEGREEN,k.avg(0,255)); 
         float a = k.avg(0,0);
         float sz = k.avg(10,BASE*.7);
         noStroke(); fill(GRAY,k.avg(0,255));
         drawSComplexTopCircle(x,y,a,sz);
         
         stroke(GRAY); noFill();
         drawSComplex(x,y,
           a,sz, //angle and size
           k.avg(0,-.2),
           k.avg(0,-.5 - (1-k.scaleBut)/3), //cheat of how long bottom S goes
           k.avg(1,1 + (1-k.scaleBut)/2) // scale of size of bottom S
           
           
           ); 
    
  }
  void drawBody(int place){
       stroke(GRAY);
       fill(GRAY);
     drawSquare(figX(place,-BASE)-antizerod(6),figY(place,-BASE*.35)+antizerod(4)
     -k.avg(10,0) //adjust as letter
     ,k.avg(14,BASE*1),k.avg(14,BASE*.8)); 
  }
  void drawButt(int place){
    setHeavyStrokeWeight();
   stroke(GRAY);
   
    fill(GRAY,k.avg(0,255));
    
    
    drawD(figX(place,BASE*.09),figY(place,BASE*.053),0,k.avg(20,BASE*.801),k.avg(1,.6)); 
   // drawD(float x, float y, float a, float sz, float stretch){
  }
  
  
  void drawEar(int place){
     stroke(GRAY);  fill(WHITE);
     drawD(figX(place,0),figY(place,0),0,k.avg(20,BASE*.7),1);
    //-BASE/4 
  }
  
   void drawBackEar(int place){
     setStrokeWeight();
     stroke(GRAY);  fill(WHITE);
     drawC(figX(place,-BASE*.4),figY(place,0),k.avg(0,0),k.avg(20,BASE*.6),1,-.2);
    //-BASE/4 
  }

  void drawBackTusk(int place){
    setStrokeWeight();
    stroke(GRAY); fill(WHITE); 
    pushMatrix(); rotate(k.avg(0,.7));
    //float x, float y, float a, float sz, float scale
    drawTriangleFromCorner(figX(place,0),figY(place,BASE*.6)-k.avg(10,0),
      k.avg(0,PI),k.avg(8,BASE*.1),2.5);
    popMatrix();
    
}

  
  void drawFrontTusk(int place){
    setStrokeWeight();
    stroke(GRAY); fill(WHITE); 
    pushMatrix(); rotate(k.avg(0,.22));
    //float x, float y, float a, float sz, float scale
    drawTriangleFromCorner(figX(place,0),figY(place,BASE*.6)-k.avg(10,0),k.avg(0,PI),k.avg(8,BASE*.1),2.5);
    popMatrix();
    
}

  void drawLegs(int place1, int place2, int place3, int place4){
    fill(GRAY);stroke(GRAY);
    setHeavyStrokeWeight();
        drawLegsOrToenails(place1,place2,place3,place4, false);
  }
  void drawToenails(int place1, int place2, int place3, int place4){
    setLightStrokeWeight();
     noFill();stroke(BLACK);
        drawLegsOrToenails(place1,place2,place3,place4, true);    
  }
  
  void drawLegsOrToenails(int place1, int place2, int place3, int place4, boolean toenails){
      float w = BASE*.15;
      float h = BASE*.35;
      float t = k.avg(0,BASE*.475);
      
   
      
      pushMatrix();
      translate(k.avg(0,-BASE*.94),t);
      rotate(k.avg(0,map(k.scaleX,-1,1,.5,-.5)));
      drawLegOrToenail(place1, toenails,w,h);
  //println(place2);
      popMatrix();

      pushMatrix();
      translate(k.avg(0,-BASE*.64),t);
      rotate(k.avg(0,map(k.scaleX,-1,1,-.5,.5)));
      drawLegOrToenail(place2,toenails,w,h);
      popMatrix();
      
      
      pushMatrix();
      translate(k.avg(0,-BASE*.2),t);
      rotate(k.avg(0,map(k.scaleX,-1,1,.5,-.5)));
      drawLegOrToenail(place3,toenails,w,h);
      popMatrix();   
   
        
      
      pushMatrix();
      translate(k.avg(0,BASE*.1),t);
      rotate(k.avg(0,map(k.scaleX,-1,1,-.5,.5)));
      drawLegOrToenail(place4,toenails,w,h);
      popMatrix();     
  }
  void drawLegOrToenail(int place, boolean isToenail, float w, float h){
     if(! isToenail) {
       drawSquare(figX(place,-w*.5) - antizerod(4),figY(place,0)- antizerod(4),k.avg(10,w),k.avg(10,h));
     }
     else {
       //(float x, float y, float a, float sz, float stretch, boolean close){
       drawU(figX(place,-w*.5),figY(place,h*1.15),k.avg(0,PI),k.avg(10,h/4),.5,false);
       drawU(figX(place+1,0),figY(place+1,h*1.15),k.avg(0,PI),k.avg(10,h/4),.5,false);
     }
  }

  void drawEyes(int place1,int place2){
    fill(BLACK); noStroke();
    drawCircle(figX(place1,-BASE*.26),figY(place1,BASE*.25),k.avg(5,BASE/20));
    drawCircle(figX(place2,-BASE*.16),figY(place2,BASE*.25),k.avg(5,BASE/20));
  }
  
  
  void drawTail(int place){
    setStrokeWeight();
   stroke(GRAY); noFill();
    //float a = map(k.scaleX,0,1,.5,1.5);
    //float b = map(k.scaleY,-1,1,-1,1);
    
    //println(a+"::"+b);

    drawC(figX(place,BASE*0.26),figY(place,BASE*-.34),k.avg(0,PI * 1.2),k.avg(20,20),1,k.avg(0,-.6)); 
   //drawD(float x, float y, float a, float sz, float stretch){
  }
  
  
}



//CUT HERE------------------------------------>8-------------

//ANIMAL
