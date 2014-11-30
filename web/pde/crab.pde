int BASECOUNT = 21; //crab

Crab  c = new Crab();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  c.draw();
  k.draw();
  k.adv();
}


class Crab extends Animal {
  float x, y;
  float ang;
  float mv;
  Crab() {
    super();
    BASE = 150;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/30;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 250; 
    y = 200;

    ang = 0;
    mv = 0;
  }


  void draw() { 
    super.draw();

    pushMatrix();
    translate(zerod(x), zerod(y*1.25));

    //rotate(-zerod(k.scaleY)/3);

    translate(0, zerod(y*-.25));

    strokeMin();

    drawBody(1);
    drawEyes(2, 3);
    drawArms(4, 5, 6, 7);

    drawClaws(8, 9, 10, 11);

    drawLegs(12);//20 next

    drawAnts(20,21);

stroke(BLACK); noFill();
//drawCFromTop(float x, float y, float a, float sz, float stretch, float extraangle){
  

  
    popMatrix();
  }

  void drawLegs(int place){
    
     strokeMed();
    stroke(ORANGE);
    noFill(); 
    float ang =  map(k.scaleY,-1,1,0,1.5);
//left legs
    drawCFromTop(figX(place,BASE*-.328),figY(place,BASE*.244)-antizerod(5),zerod(ang),avgd(15,BASE*.4),avgd(.5,.5),-.73);
    place++;
    ang -= .1;
    drawCFromTop(figX(place,BASE*-.228),figY(place,BASE*.328)-antizerod(5),zerod(ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    place++;
    ang -= .1;
    drawCFromTop(figX(place,BASE*-.132),figY(place,BASE*.4)-antizerod(5),zerod(ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    place++;
    ang -= .1;
    drawCFromTop(figX(place,BASE*-.008),figY(place,BASE*.44)-antizerod(5),zerod(ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    place++;
//right legs - positve x, 
   ang =  PI + map(k.scaleY,1,-1,0,-1.5) ;//reset;
    drawCFromBot(figX(place,BASE*.328),figY(place,BASE*.244)-antizerod(5),avgd(PI,ang),avgd(15,BASE*.4),avgd(.5,.5),-.73);
    place++;
    ang += .1;
    drawCFromBot(figX(place,BASE*.228),figY(place,BASE*.328)-antizerod(5),avgd(PI,ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    place++;
    ang += .1;
    drawCFromBot(figX(place,BASE*.132),figY(place,BASE*.4)-antizerod(5),avgd(PI,ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    place++;
    ang += .1;
    drawCFromBot(figX(place,BASE*.008),figY(place,BASE*.44)-antizerod(5),avgd(PI,ang),avgd(15,BASE*.4),avgd(.5,.75),-.73);
    
  }



    void drawAnts(int place1, int place2){
  
   //  float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
     float x = .124; float y = -.156;
     //void drawJ(float x, float y, float ang, float sz,  float lineMul, float extraAng) {
          drawJ(figX(place2,BASE*x),figY(place2,BASE*y)+antizerod(3),
              zerod(PI),avgd(10,BASE*.18),1,zerod(-0)); 
          drawFlipJ(figX(place1,BASE*-x),figY(place1,BASE*y)+antizerod(3),
              zerod(PI),avgd(10,BASE*.18),1,zerod(-0),avgd(1,0)); 
  }

  void drawBody(int place) {
    fill(ORANGE, zerod(255));
    stroke(ORANGE);
    //void drawD(float x, float y, float a, float sz, float stretch) {        
    drawD(figX(place, 0), figY(place, 0), zerod(PI/2), avgd(15, BASE), 1);
  }
  void drawEyes(int place1, int place2) {

    fill(GREEN);
    stroke(GREEN);
    float x = BASE * .12;
    float y = BASE * -.04;

    drawCircle(figX(place1, -x), figY(place1, y), avgd(8, BASE*.1));
    drawCircle(figX(place2, x), figY(place2, y), avgd(8, BASE*.1));
  }
  //drawSquareCentered(float x, float y, float w, float h)
  void drawArms(int place1, int place2, int place3, int place4) {
    fill(ORANGE); 
    stroke(ORANGE);
    
    float x = BASE * .584;
    float y = BASE * .052;
    drawSquareCentered( figX(place1, -x), figY(place1, y), avgd(10, BASE*.1), avgd(10, BASE*.1));
    drawSquareCentered( figX(place2, x), figY(place2, y), avgd(10, BASE*.1), avgd(10, BASE*.1));
    //void drawTriangleInSquareCentered(float x, float y, float w, float h,float a) {
    x = BASE * .724;
    y = BASE * .052; 
    drawTriangleInSquareCentered(figX(place3, -x), figY(place3, y)+antizerod(4), 
    avgd(10, BASE*.095), avgd(10, BASE*.095), avgd(PI/4, PI/2) );
    drawTriangleInSquareCentered(figX(place4, x), figY(place4, y)+antizerod(4), 
    avgd(10, BASE*.095), avgd(10, BASE*.095), avgd(PI/4, 0) );
  }
float clawPinchTrack = -3.3;
  void drawClaws(int place1, int place2, int place3, int place4) {
  //  clawPinchTrack = 4 * k.scaleY;
    
    
    float clawPinch = sin(clawPinchTrack);
    float clawPinch2 = cos(clawPinchTrack);
    if(k.mousePressed()) clawPinchTrack += .15;
  //  println(clawPinch);
    
    //void drawD(float x, float y, float a, float sz, float stretch) {        
    fill(ORANGE, zerod(255)); 
    stroke(ORANGE);
    float a = k.scaleX + PI/2;
    pushMatrix();
    translate(zerod(-BASE*.75), 0);
    drawD(figX(place1, -cos(a)*BASE*.25), figY(place1, -sin(a)*BASE*.25), zerod(a +PI/2), avgd(15, BASE*.5), 1);
  
    float adj = -.8;
    float pinch = (PI*.22) +   constrain(  clawPinch * 2,-1,1 ) * PI/6;
     fill(ORANGE);
    drawTriangleFromBase(figX(place3, -cos(a+adj)*BASE*.1), figY(place3, -sin(a+adj)*BASE*.1)+antizerod(5), zerod(a - pinch),avgd(6 ,BASE*.063),avgd(2,5));   
  
    popMatrix();
    
    pushMatrix();
     a  += PI;
    translate(zerod(BASE*.75), 0);
    drawD(figX(place2, cos(a)*BASE*.25), figY(place2, sin(a)*BASE*.25), zerod(a +PI/2), avgd(15, BASE*.5), 1);
    //fill(BLACK);
    pinch = -((PI*.22) +   constrain(  clawPinch2 * 2,-1,1 ) * PI/6);
    adj = .855;
    drawTriangleFromBase(figX(place4, cos(a+adj)*BASE*.1), figY(place3, sin(a+adj)*BASE*.1)+antizerod(5), zerod(a - pinch),avgd(6,BASE*.063),avgd(2,5));   

    popMatrix();

//void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
 
  
  }
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
