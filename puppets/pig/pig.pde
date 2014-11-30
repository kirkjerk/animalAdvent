int BASECOUNT = 15; //pig

Pig  p = new Pig();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  
}
void draw() {
  background(WHITE);
  p.draw();
  k.draw();
  k.adv();
}


class Pig extends Animal {
  float x,y;

  Pig() {
    super();
    BASE = 300;
    smallStrokeWeight = BASE/100;
    basicStrokeWeight = BASE/40;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 300; 
    y = 250;

    
  }


  void draw() { 
    super.draw();
    pushMatrix();
    
    translate(zerod(x),zerod(y));
    strokeMed();

stroke(PINK);
noFill();    
    pushMatrix();
    
      drawBody(10);
      drawLegs(11,12,13,14);
      
    if(true){
      translate(zerod(-BASE*.5),0);
rotate(zerod(k.scaleX/1.5));
    fill(WHITE);

      drawEars(2,3);
      drawHead(1);
      fill(BLACK); stroke(BLACK); strokeMicro();
      
      
      
      drawEyes(7,8);
      strokeMed(); noFill();
      drawMouth(9);
    fill(WHITE); stroke(PINK); strokeMed();
      
      drawNose(4,5,6);
    }
    popMatrix(); //head
    
    strokeWeight(avgd(  smallStrokeWeight,basicStrokeWeight));
noFill();
  drawTail(15);
    
    popMatrix();
  }
  
  //drawC(float x, float y, float a, float sz, float stretch, float extraangle) {
  void drawBody(int place){
    
    drawC(figX(place,BASE*-.184), 
                figY(place,BASE*.032),
                zerod(PI),
                avgd(15,BASE*.5),1.5,0);
                   
  }
  void drawLegs(int place1,int place2,int place3,int place4){
    
  drawV(figX(place1,BASE*-.432),figY(place1,BASE*.38)+antizerod(10), avgd(20,BASE*.17) , zerod(PI*.1), PI/8 );

  drawV(figX(place2,BASE*-.284),figY(place2,BASE*.42)+antizerod(10), avgd(20,BASE*.17) , zerod(PI*.064), PI/8 );
    
    drawV(figX(place3,BASE*0),figY(place3,BASE*.415)+antizerod(10), avgd(20,BASE*.17) , zerod(-PI*.064), PI/8 );
  drawV(figX(place4,BASE*.116),figY(place4,BASE*.358)+antizerod(10), avgd(20,BASE*.17) , zerod(-PI*.1), PI/8 );
  
  }
  
  void drawTail(int place){
  
    // float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
    drawSpiral(figX(place,BASE*.14)-antizerod(10),figY(place,BASE*-.088)+antizerod(10),
    zerod(-PI/4), avgd(20,BASE*.15), zerod(k.scaleBut)
    );
  }

  void drawHead(int place){
    drawCircle(figX(place,0), 
                figY(place,0),
                avgd(20,BASE*.4));
                   
  }
  void drawEars(int place1,int place2){
    //(float x, float y, float sz, float ang, float angApart) 
    
    drawVFillMedStroke(figX(place1,BASE*-.252),figY(place1,BASE*-.208)+antizerod(10), avgd(20,BASE*.15) , zerod(PI*.736), PI/8 ,PINK);
    drawVFillMedStroke(figX(place2,BASE*.252),figY(place2,BASE*-.208)+antizerod(10), avgd(20,BASE*.15) , zerod(PI*-.736), PI/8 ,PINK);
  }
  
  void drawNose(int place, int place1,int place2){
    //void drawD(float x, float y, float a, float sz, float stretch) {
      
      drawD(figX(place,0),figY(place,BASE*.06),zerod(-PI/2),avgd(20,BASE*.14),avgd(1,2));
      //drawLine(float x, float y, float a, float sz) {
        float h = .052;
      drawLine(figX(place1,BASE*-.024),figY(place1,BASE*h/2),0,avgd(15,BASE*h));
      drawLine(figX(place2,BASE*.024),figY(place1,BASE*h/2),0,avgd(15,BASE*h));
  }
  void drawEyes(int place1, int place2){
      
      float x = .1; float y = -.1;
      drawCircle(figX(place1,BASE*-x),figY(place1,BASE*y),avgd(4,BASE*.02));
      drawCircle(figX(place2,BASE*x),figY(place1,BASE*y),avgd(4,BASE*.02));
  }
  //void drawU(float x, float y, float a, float sz, float stretch, boolean close) {
  void drawMouth(int place){
      drawU(figX(place,0),figY(place,BASE*-.02)-antizerod(5),0,avgd(20,BASE*.3),avgd(.5,1),false);
  }
  
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
