int BASECOUNT = 16; //frog

Frog f = new Frog();
Keeper k = new Keeper();
void setup(){
  size(500,500);
strokeCap(SQUARE);    
}
void draw(){
  background(WHITE);
  k.draw();
  f.draw();
  
  k.adv();  
}


class Frog extends Animal{
 
 Frog(){
  super();
  BASE = 200;
  smallStrokeWeight = BASE/50;
  basicStrokeWeight = BASE/20;
  heavyStrokeWeight = BASE/15;
  PIECECOUNT = 16;
 }
 
  
  void draw(){   
    
     super.draw(); 
     pushMatrix();
       translate(k.avg(0,250),k.avg(0,300));
       pushMatrix();
           rotate(map(k.scaleX,0,1,0,k.avg(0,PI/40)));     
    
           drawBody(1);     
           drawEyes(2,3);
           drawHips(4,5);
           drawLegs(6,7);
           drawMouth(8);
           drawNostrils(9,10);
           drawPupils(11,12);
       popMatrix();
       drawFeet(13,14,15,16);
    popMatrix();

  }
  


  void drawBody(int place){
     stroke(LITEGREEN);
     noFill();
     setHeavyStrokeWeight();  
  pushMatrix(); 
  translate(k.avg(figX(place,0),0),k.avg(figY(place,0),  - BASE/100));
  
     drawD(0,0,
           k.avg(0,-PI/2),k.avg(20,BASE),
           k.avg(1,1.8));
     popMatrix();
  }
  
  void drawEyes(int place1, int place2){
     stroke(LITEGREEN);
     noFill();
     setStrokeWeight();

     drawCircle(figX(place1, - BASE * .2),
                 figY(place1, - BASE * .94),
                k.avg(10,BASE * .175)); 
     drawCircle(figX(place2,  BASE * .2),
                 figY(place2, - BASE * .94),
                k.avg(10,BASE * .175)); 
                
                //ellipse(0,0,100,100);
                //println(figX( - BASE * .2));
  }
  void drawHips(int place1, int place2){
     stroke(LITEGREEN);
     fill(LITEGREEN,k.avg(0,255));
     setStrokeWeight();
     
     drawD(figX(place1, - BASE * .5),
           figY(place1,0),
            k.avg(0,-PI/2),k.avg(20,BASE*.25),
           k.avg(1,2.5));

     drawD(figX(place2, BASE * .5),
           figY(place2,0),
            k.avg(0,-PI/2),k.avg(20,BASE*.25),
           k.avg(1,2.5));


  }
  void drawFeet(int place1, int place2,int place3, int place4){
     stroke(LITEGREEN);
     fill(LITEGREEN);    
      drawTriangleFromCorner(figX(place1,-BASE/2), figY(place1,0) -antizerod(5),k.avg(0,.1),k.avg(6,BASE/10),2);
      drawTriangleFromCorner(figX(place4,+BASE/2), figY(place4,0)-antizerod(5),k.avg(0,-.1),k.avg(6,BASE/10),2);
      drawTriangleFromCorner(figX(place2,0-BASE/6), figY(place2,0)-antizerod(5),k.avg(0,-.05),k.avg(6,BASE/10),2);
      drawTriangleFromCorner(figX(place3,+BASE/6), figY(place3,0)-antizerod(5),k.avg(0,.05),k.avg(6,BASE/10),2);
  }
  
  void drawLegs(int place1, int place2){
     stroke(LITEGREEN);
      drawLine(figX(place1,-BASE/6),figY(place1,-BASE/8),0,k.avg(20,BASE/4));    
      drawLine(figX(place2,BASE/6),figY(place2,-BASE/8),0,k.avg(20,BASE/4));    
  
  }
  
  void drawMouth(int place){
     stroke(ORANGE);
     //println(k.mousePressed());
     if(k.mousePressed()) fill(ORANGE,zerod(255)); else noFill();
    drawU(figX(place,0),figY(place,0-BASE*.4),k.avg(0,PI),k.avg(15,BASE*.6),k.avg(1,.8),false); 
  }
  void drawNostrils(int place1, int place2){
    noStroke();
    fill(BLACK);    
    drawCircle(figX(place1,0 - BASE/20),figY(place1,0-BASE*.9),k.avg(3,BASE/40));
    drawCircle(figX(place2,0 + BASE/20),figY(place2, 0-BASE*.9),k.avg(3,BASE/40));
      
  }
  void drawPupils(int place1, int place2){
    noStroke();
    fill(BLACK);    
    
    float eye1x = 0 - BASE*.2;
    float eye2x = 0 + BASE*.2;
    
    
    
    float eye1y = 0-BASE*.95;
    float eye2y = 0-BASE*.95;
   //  line(0,0,210,110);
 //line(0,0,285,110);
    float a1 = atan2(mouseY - 110, mouseX - 210);
    eye1x += cos(a1) * BASE*.05;
    eye1y += sin(a1) * BASE*.05;
    float a2 = atan2(mouseY - 110, mouseX - 285);
    eye2x += cos(a2) * BASE*.05;
    eye2y += sin(a2) * BASE*.05;
    
    drawCircle(figX(place1,eye1x),figY(place1,eye1y),k.avg(8,BASE/15));
    drawCircle(figX(place2,eye2x),figY(place2,eye2y),k.avg(8,BASE/15));
    //drawCircle(figX(0 + BASE/20),figY(0-BASE*.9),k.avg(3,BASE/15));
    
  }
  
}




//CUT HERE---------
//ANIMAL
