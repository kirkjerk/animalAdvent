int BASECOUNT = 14; //whale

Whale w = new Whale();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  
}
void draw() {
  background(WHITE);
  w.draw();
  k.draw();
  k.adv();
}

class Drop {
   float x,y,xs,ys;
   Whale w;
   Drop(Whale pw){
      w = pw;
      
      float a = k.scaleX/5;
    //  float m = k.scaleY; println(m);
      float offa =-.3;// PI*m;
      x =  w.x + w.BASE * 1.4 *  cos(a+offa);
      y = w.y +  w.BASE* 1.4  * sin(a+offa);
      
     // line(0,0,x,y);
      
      float mul = 4;
      
       a -= PI/2 + random(-.1,.1);
      xs = mul *cos(a);
      ys = mul * sin(a);
   }
   
   boolean move(){
      x += xs;
     y += ys;
     ys += .1;
    if(y  > 510) return false;
   return true; 
   }
   void draw(){
     fill(color(LITEGREEN)); noStroke();
     w.drawCircle(w.figX(w.placeForDrops,x),w.figY(w.placeForDrops,y),6);
     w.placeForDrops++;
   }
}


class Whale extends Animal {
  float x = 270, y = 250;
  int placeForDrops; 
  ArrayList<Drop> drops = new ArrayList<Drop>();
  Whale() {
    super();
    BASE = 100;
    smallStrokeWeight = BASE/50;
    basicStrokeWeight = BASE/40;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
  }


  void draw() { 
   super.draw();
    
    stroke(GRAY,100);
setLightStrokeWeight();
    pushMatrix();
    if (true) {
      translate(zerod(x), zerod(y));
      fill(GRAY);
      //float m = k.scaleY; println(m);
/*      if(k.along > .98){
        drawCircle(figX(5,0),figY(5,BASE*-.355),BASE*.3,1);
        drawCircle(figX(5,0),figY(5,BASE*.636),BASE*.3,1);
        drawCircle(figX(5,0),figY(5,BASE*.12),BASE,.4);
      }*/
      fill(GRAY);
      drawTail(5,6,7);
      drawBody(1, 2,3,4,8,7); //8-14 = teeth
      
      
      
      fill(GRAY);
      
    }
    popMatrix();
    placeForDrops = 15;
    ArrayList<Drop> dropsToKill = new ArrayList<Drop>();
    for(Drop d : drops){
      if(!d.move()){
         dropsToKill.add(d); 
      }
      d.draw(); 
    }
    drops.removeAll(dropsToKill);
   
       if(k.mousePressed())drops.add(new Drop(this)); 
   
  }
  void drawBody(int placeBody, int placeMouth, 
  int placeEye, int placeFront,
  int placeTeeth, int howManyTeeth) {
    
//drawing this cheat line from the points of the triangle to the square of the mouth...    
        float ang1 = k.scaleX/-5  -PI/2;
        float ang2 = k.scaleX/5 -  PI/2;
    //println(n);
    
    float topBackX = figX(placeBody,BASE*.496*cos(ang1)) ;
    float topBackY = figY(placeBody,BASE*.496*sin(ang1));
    float botBackX = figX(placeBody,BASE*-.78*cos(ang1));
    float botBackY = figY(placeBody,BASE*-.78*sin(ang1));
    float topFrontX = figX(placeBody,BASE*.496*cos(ang2));
    float topFrontY = figY(placeBody,BASE*.496*sin(ang2));
    float botFrontX = figX(placeBody,BASE*-.792*cos(ang2));
    float botFrontY = figY(placeBody,BASE*-.792*sin(ang2));
    
    quad(topBackX,topBackY,topFrontX,topFrontY,botFrontX,botFrontY,botBackX,botBackY);
    
    //line(-200,-200,topBackX,topBackY);
    //line(-200,-200,botBackX,botBackY);
    //line(-200,-200,topFrontX,topFrontY);
    //line(-200,-200,botFrontX,botFrontY);

    
    pushMatrix(); 
    if (true) {
      rotate(zerod(k.scaleX/5));
      drawSquare(
        figX(placeBody, 0)-antizerod(10), 
        figY(placeBody, -BASE/2)-antizerod(10), 
      avgd(20, BASE*1.75), avgd(20, BASE));
      drawMouth(placeMouth,placeTeeth, howManyTeeth);
      drawEye(placeEye);
      drawFront(placeFront);
    }
    popMatrix();
  }
  void drawTail(int placeMain, int placeTop, int placeBot){
    stroke(GRAY); fill(GRAY);
    pushMatrix();
     rotate(zerod(k.scaleX/-5));
    drawTriangleFromBase(
      figX(placeMain,0),
      figY(placeMain,BASE*.15)+antizerod(15),
      avgd(0,PI*-.5),avgd(10,BASE*.64),avgd(3,3));
      
      float backX = BASE*-1.95;
      float backY = BASE * .15;
      //float n = k.scaleY; n *= 3; println(n);
      drawTailFin( backX,  backY,  placeTop, 1);
      drawTailFin( backX,  backY,  placeBot, -1);

      
     // fill(BLACK); noStroke(); ellipse(backX,backY,3,3);
      
   popMatrix();   
  }
  void drawTailFin(float backX, float backY, int place, int dir){
     
      drawTriangleFromPoints(
        figX(place,backX),
        figY(place,backY) - antizerod(10),
        figX(place,backX * 1.2) - antizerod(10),
        figY(place,backY + BASE*.6 * dir) + antizerod(10), 
        figX(place ,backX * .7) + antizerod(10),
        figY(place ,backY)+ antizerod(10));   
  }
  
  
  void drawMouth(int placeMouth,int placeTeeth, int howManyTeeth){
    noStroke(); fill(BLACK);  
    for(int i = 0; i < howManyTeeth; i++){
         drawTooth(placeTeeth + i, i * 1.0 / howManyTeeth); 
      }
    fill(GRAY); setLightStrokeWeight();   
    drawTriangleFromBase(figX(placeMouth,0),figY(placeMouth,BASE*.636) + antizerod(15),
      avgd(0,PI/2),avgd(10,BASE*.15),avgd(3,12));    
      

  }
  
  void drawTooth(int place, float ratio){
      float off = BASE * .8 * ratio;
      //float m = k.scaleY; println(m);
      drawCircle(figX(place,BASE*.75 + off),figY(place,BASE*.54),avgd(5,5));
  }
  
  void drawEye(int placeEye){
      fill(BLACK); stroke(BLACK);
      drawCircle(figX(placeEye,BASE*.2),figY(placeEye,BASE*.4),avgd(5,BASE*.05));
  }
  void drawFront(int placeFront){
    fill(GRAY,zerod(255)); stroke(GRAY);
    
     drawD(figX(placeFront,BASE*1.75), figY(placeFront,0),0,
     avgd(20,BASE),avgd(1,.5));
  }
  
  
}


//CUT HERE------------------------------------>8-------------

//ANIMAL
