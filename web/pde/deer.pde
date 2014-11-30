int BASECOUNT = 16; //deer

Deer d = new Deer();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  d.draw();
  k.draw();
  k.adv();
}


class Deer extends Animal {
  float x, y;
  float ang;
  float mv;
  Deer() {
    super();
    BASE = 120;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/45;
    heavyStrokeWeight = BASE/20;
    PIECECOUNT = 20;
    x = 220; 
    y = 250;

    ang = 0;
    mv = 0;
  }


  void draw() { 
    super.draw();


   ang = map(k.scaleBut,0,1,-PI*.4,PI*.1);
  //ang = -PI*.4;
    
  
    pushMatrix();
    translate(zerod(x), zerod(y));
    rotate(zerod(k.scaleY*.2));
    noStroke();
    fill(TAN);
    drawBody(1);
    drawNeck(2);
    drawHeadEarsAntlers(3,9,10,11,12,13);
    drawLegs(4,5,6,7);
    drawTail(8);
    popMatrix();
  }
  
    void drawBody(int place){
      drawSquareCentered(figX(place,0),figY(place,1),avgd(15,BASE),avgd(10,BASE*.5));
    }
    void drawNeck(int place){
      
      float x = BASE / 2 + cos(ang) * BASE*.8;
     float y =  sin(ang) * BASE*.8; 
   //  stroke(TAN); strokeMed();
     
     
     
     drawTriangleFromPoints(
       figX(place,BASE/2  + BASE * constrain(  ang *.2  ,-2,0) ) - antizerod(8), //top
       figY(place,-BASE/4) + antizerod(8),
       figX(place,BASE/2) +  antizerod(8), //bot
       figY(place,BASE/4)+ antizerod(8),
       figX(place,x), //out 
       figY(place,y)- antizerod(8)

     
     );
     
     line(BASE / 2, 0, x, y);
    }
    void drawHeadEarsAntlers(int place, int placeear1,int placeear2, 
      int placeEye, int placeAntlers, int placeY){
       pushMatrix();
       translate(avgd(0,BASE / 2),0);
       rotate(zerod(ang));
      
        //fill(PINK);
        //drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
         
          drawTriangleFromBase(figX(place,BASE*.664),figY(place,BASE*-.004)+antizerod(8),zerod(PI),avgd(8,BASE*.12),avgd(2,3));
fill(TAN,zerod(255));
          //drawD(float x, float y, float a, float sz, float stretch) {
strokeMin();
stroke(TAN);
            drawD(figX(placeear1,BASE*.732),figY(placeear1,BASE*-.168), zerod(PI), avgd(15,BASE*.18), 1);
            drawD(figX(placeear2,BASE*.824),figY(placeear2,BASE*.148), zerod(PI*.85), avgd(15,BASE*.14), 1);
strokeMax();
noFill();

          

            //void drawU(float x, float y, float a, float sz, float stretch, boolean close) {
drawU(figX(placeAntlers,BASE*1.256),figY(placeAntlers,BASE*-.112)-antizerod(8),zerod(PI*.444),avgd(30,BASE),avgd(.5,.7),false);

      //drawY(float x, float y, float sz, float a, float apart) {
      
      drawY(figX(placeY,BASE*.968),figY(placeY,BASE*-.492),avgd(16,BASE*.2),0,.8);
      placeY++;
      drawY(figX(placeY,BASE*.928),figY(placeY,BASE*-.2),avgd(16,BASE*.2),zerod(PI * .688),.8);
      placeY++;
      drawY(figX(placeY,BASE*.976),figY(placeY,BASE*.088),avgd(16,BASE*.2),zerod(PI * .196),.8);
      placeY++;
      drawY(figX(placeY,BASE*1.2),figY(placeY,BASE*.336),avgd(16,BASE*.2),zerod(PI * .864),.8);

      

      
      
      noStroke();
      fill(BLACK);
      
      
      drawCircle(figX(placeEye,BASE*0.684),figY(place,BASE*0.056),BASE*.05);
      
      
      popMatrix(); 
    }
    void drawLegs(int place1,int place2,int place3,int place4){
      //drawCFromBot(float x, float y, float a, float sz, float stretch, float extraangle) {
        noFill();
        stroke(TAN);
        strokeMax();
        
        float a = k.scaleX*.5;
        
        drawCFromBot(figX(place1,BASE*-0.45),figY(place1,BASE*0.088)+antizerod(8),
          avgd(0,PI*1.35)+zerod(a) ,avgd(15,BASE*.6), 1,zerod(-1.1));
        drawCFromBot(figX(place2,BASE*-0.3),figY(place2,BASE*.132)+antizerod(8),
          avgd(0,PI*-0.76)+zerod(a),avgd(15,BASE*.7), avgd(1,.7),zerod(-1.1));
        drawCFromBot(figX(place3,BASE*.372),figY(place3,BASE*.264)+antizerod(8),
          avgd(0,PI*-1.32)-zerod(a) ,avgd(15,BASE*.6), avgd(1,.7),zerod(-1.1));
        drawCFromBot(figX(place4,BASE*.272),figY(place4,BASE*.264)+antizerod(8),
          avgd(0,PI*-1.196)-zerod(a) ,avgd(15,BASE*.6), avgd(1,.7),zerod(-1.1));
    }

    void drawTail(int place){
      strokeMin();
      fill(TAN);
      
      drawTriangleFromPoints(
        figX(place,BASE*-0.5)-antizerod(8),
        figY(place,BASE*-0.25)+antizerod(8),
        figX(place,BASE*-0.5),
        figY(place,BASE*-0.35)-antizerod(8),
        figX(place,BASE*-0.3)+antizerod(8),
        figY(place,BASE*-0.25)  +antizerod(8)    
      );
    }

}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
