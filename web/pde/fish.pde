int BASECOUNT = 71; //fish
 void drawBezierFuck(float x, float y, float a, float h, float fat, float pinch1, float pinch2, boolean close){
    pushMatrix();
    translate(x,y);
    rotate(a);
    
    

    
    float tiltx = h / 2  * fat    + h * m;
    float tilty = - h/2 + h * n;
    
    
    
    bezier(0,-h/2, //anchor top
    h  * fat * pinch1, -h/2   , //pull top of curve to right
    h  * fat * pinch2, h/2, //pull but of curve to right
   0,h/2); //anchor bottom
    
    if(close){
       line(0,-h/2,0,h/2); 
    }
    
   popMatrix(); 
 }


ArrayList<Fish> school = new ArrayList<Fish>();

Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
school.add(new PrettyFish(61,6));
  school.add(new SplineFish(52,2));
   school.add(new MixedFish(8,3));
  school.add(new StripedFish(23,4));
  school.add(new LongFish(36,5));  
school.add(new FirstFish(1,1));  
   

  
}
void draw() {
  background(WHITE);


  for (Fish f : school) {
    f.move();
    f.draw();
  }

  k.draw();
  k.adv();
}
/*

 class GenericFish extends Fish {
 
 GenericFish(int bp) {
 
 super(bp);
 BASE = 40; 
 speedMul = 5;
 super.duper();
 }
 
 
 void draw() {
 super.draw(); 
 int place = baseplace;
 
 
 stroke(GREEN);
 strokeMed();
 
 drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), 1.5 );
 place++;
 
 
 
 super.doneDraw();
 
 }
 
 
 }
 */
boolean freeze=false;//;//true;

 class PrettyFish extends Fish {
 
 PrettyFish(int bp ,int sn) {
 
 super(bp, sn);
 BASE = 40; 
 speedMul = 5;
 super.duper();
 }
 
 
 void draw() {
 super.draw(); 
 int place = baseplace;
 
 
 stroke(TAN);
 fill(WHITE);
 strokeMed();
 
 
       //top fin
    drawTriangleFromBase(figX(place, BASE*-.28*dir), figY(place, BASE*-.2)+antizerod(6), zerod(PI * -(.136 + speed * .1)  *dir), avgd(8, BASE*.4), avgd(2, 3) );
    place++;

     //bot fin
    drawTriangleFromBase(figX(place, BASE*-.28*dir), figY(place, BASE*.2)+antizerod(6), zerod(PI - PI * -(.136 + speed * .1)  *dir), avgd(8, BASE*.4),avgd(2, 3 ));
    place++;

    //bot mini fin
    drawTriangleFromBase(figX(place, BASE*-.852*dir), figY(place, BASE*.172)+antizerod(6), zerod(PI - PI * -(.136 )  *dir), avgd(8, BASE*.12), 2 );
    place++;


 fill(TAN);
 
 //body
 drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), avgd(2,2.5) );
 place++;
 
      //tail
  drawTriangleFromCorner(figX(place, dir * BASE*-1), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.45)), avgd(1.5, .8 + (speed*.8) ) );
  place++;
fill(BLACK);
stroke(BLACK);
 
   drawTriangleFromCorner(figX(place, dir * BASE*-.26), figY(place, BASE*-.176)+antizerod(-6), zerod(PI/2*-.224*dir), avgd(8, BASE*(.15)), 1.5 );
  place++;

 
 //head
 fill(WHITE);
 stroke(TAN);
 drawD(figX(place, 0), figY(place, 0), zerod(PI/2- PI/2*dir), avgd(16, BASE), avgd(1,1.6) ) ;
 place++;
 
 //eye
 fill(GREEN);
 stroke(GREEN);
 drawCircle(figX(place, BASE*dir*.432),figY(place,BASE*-.2),avgd(12,BASE*.3));
 place++;
//pupil
noStroke();
fill(BLACK);
 drawCircle(figX(place, BASE*dir*.46),figY(place,BASE*-.168),avgd(8,BASE*.12));
 place++;
//mouth
 drawCircle(figX(place, BASE*dir*.796),figY(place,BASE*.024),avgd(4,BASE*.08));
 place++;
 //nostril
 drawCircle(figX(place, BASE*dir*.736),figY(place,BASE*-.188),avgd(2,BASE*.04));
 place++;
 
 super.doneDraw();
 
 }
 
 
 }


 class SplineFish extends Fish {
 
 SplineFish(int bp ,int sn) {
 
 super(bp, sn);
 
 BASE = 50; 
 speedMul = 5;
 super.duper();
 }
 
 
 void draw() {
 super.draw(); 
 int place = baseplace;
 strokeMed();
 stroke(BLACK);fill(BLACK);
      //top fin
    drawTriangleFromBase(figX(place, BASE*-.2*dir), figY(place, BASE*-.332)+antizerod(6), zerod(PI * -(.136 + speed * .2)  *dir), avgd(8, BASE*.2), 1.5 );
    place++;

     //bot fin
    drawTriangleFromBase(figX(place, BASE*-.2*dir), figY(place, BASE*.332)+antizerod(6), zerod(PI - PI * -(.136 + speed * .2)  *dir), avgd(8, BASE*.2), 1.5 );
    place++;
 
 
 float pinch1 = .1;
 float pinch2 = .9;
 if(dir < 0) {
  pinch1 = .9;
  pinch2 = .1;  
 }
  fill(GREEN,zerod(255));
 // fill(GREEN);
  
 stroke(GREEN);
 
 
 drawBezierD(figX(place, 0), figY(place, 0),zerod(-PI/2), avgd(16,BASE*2),avgd(.5,.7),avgd(1,pinch1),avgd(1,pinch2),true);
 place++;
 fill(ORANGE,zerod(255));
 
 stroke(ORANGE);
 drawBezierD(figX(place, 0), figY(place, 0),zerod(PI/2), avgd(16,BASE*2),avgd(.5,.7),avgd(1,pinch2),avgd(1,pinch1),true);
 place++;
 
 stroke(BLACK);
 fill(BLACK);
    //tail
  drawTriangleFromCorner(figX(place, dir * BASE*-1), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.328)), avgd(1.5, .8 + (speed*.8) ) );
  place++;

 //eye
 fill(WHITE);
 stroke(GREEN);
 drawCircle(figX(place, BASE*.684*dir), figY(place, BASE*-.24),avgd(10,BASE*.3));
 place++;
  noStroke();
  fill(BLACK);
drawCircle(figX(place, BASE*.732*dir), figY(place, BASE*-.2),avgd(4,BASE*.08),avgd(1,1.2));
place++;

//nostril
drawCircle(figX(place, BASE*.94*dir), figY(place, BASE*-.136),avgd(2,BASE*.05),avgd(1,1.2));
place++;

//upddown line
stroke(BLACK);
drawLine(figX(place, BASE*.636*dir), figY(place, 0),zerod(PI/2),avgd(12,BASE*.75));
place++;
 

 
 super.doneDraw();
 
 }
 
 void drawBezierD(float x, float y, float a, float h, float fat, float pinch1, float pinch2, boolean close){
    pushMatrix();
    translate(x,y);
    rotate(a);
    
    

    
    float tiltx = h / 2  * fat    + h * m;
    float tilty = - h/2 + h * n;
    
    
    
    bezier(0,-h/2, //anchor top
    h  * fat * pinch1, -h/2   , //pull top of curve to right
    h  * fat * pinch2, h/2, //pull but of curve to right
   0,h/2); //anchor bottom
    
    if(close){
       line(0,-h/2,0,h/2); 
    }
    
   popMatrix(); 
 }
 
 

 
 
 
 
 }
 
 
 class LongFish extends Fish {
 
 LongFish(int bp ,int sn) {
 
 super(bp, sn);
 BASE = 30; 
 speedMul = 5;
 super.duper();
 }
 
 
 void draw() {
 super.draw(); 
 int place = baseplace;
 
 stroke(GREEN);
 fill(GREEN);
 
    drawTriangleFromPoints(figX(place, dir*BASE*.32)-antizerod(5), figY(place, BASE*-.42)+antizerod(5), 
    figX(place, BASE*-(.336 + abs(speed*.35) )*dir), figY(place, BASE*-.668)-antizerod(5), 
    figX(place, dir*BASE*-.444)+antizerod(5), figY(place, BASE*-.26)+antizerod(5));
    place++;
    drawTriangleFromPoints(figX(place, dir*BASE*-.444)+antizerod(5), figY(place, BASE*-.26)+antizerod(5), 
    figX(place, BASE*-(.892 + abs(speed*.35) )*dir), figY(place, BASE*-.488)-antizerod(5), 
    figX(place, dir*BASE*-.996)-antizerod(5), figY(place, BASE*-.196)+antizerod(5));
    place++;

  
      drawTriangleFromPoints(figX(place, dir*BASE*-.996)-antizerod(5), figY(place, BASE*-.196)+antizerod(5), 
    figX(place, BASE*-(1.388 + abs(speed*.25) )*dir), figY(place, BASE*-.372)-antizerod(5), 
   figX(place, dir*BASE*-1.4)+antizerod(5), figY(place, BASE*-0.088)+antizerod(5) );
    place++;
  
  
  
      drawTriangleFromPoints(figX(place, dir*BASE*.32)-antizerod(5), figY(place, BASE*.42)+antizerod(5), 
    figX(place, BASE*-(.336 + abs(speed*.35) )*dir), figY(place, BASE*.668)-antizerod(5), 
    figX(place, dir*BASE*-.444)+antizerod(5), figY(place, BASE*.26)+antizerod(5));
    place++;
    drawTriangleFromPoints(figX(place, dir*BASE*-.444)+antizerod(5), figY(place, BASE*.26)+antizerod(5), 
    figX(place, BASE*-(.892 + abs(speed*.35) )*dir), figY(place, BASE*.488)-antizerod(5), 
    figX(place, dir*BASE*-.996)-antizerod(5), figY(place, BASE*.196)+antizerod(5));
    place++;

  
      drawTriangleFromPoints(figX(place, dir*BASE*-.996)-antizerod(5), figY(place, BASE*.196)+antizerod(5), 
    figX(place, BASE*-(1.388 + abs(speed*.25) )*dir), figY(place, BASE*.372)-antizerod(5), 
   figX(place, dir*BASE*-1.4)+antizerod(5), figY(place, BASE*0.088)+antizerod(5) );
    place++;
  
  strokeMax();
  drawLine(figX(place, dir*BASE*-1.9),figY(place,0),0,avgd(10,BASE*.4));
  drawLine(figX(place, dir*BASE*-1.72),figY(place,0),0,avgd(10,BASE*.4));
  place++;
  
 stroke(ORANGE);
 fill(ORANGE);
 strokeMed();
 
     //tail
    drawTriangleFromCorner(figX(place, dir * BASE*-1.944), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.5)), avgd(1.5, .8 + (speed*.8) ) );
    place++;
 
 //body
 drawTriangleFromBase(figX(place, BASE*.5*dir), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), avgd(1.5,5));
 place++;
 fill(ORANGE,zerod(255));
 //head
 drawD(figX(place, BASE*.5*dir), figY(place, 0), zerod(PI/2- PI/2*dir), avgd(16, BASE), avgd(1,1.6) ) ;
 
 place++;
//eye
 fill(WHITE);
 drawCircle(figX(place, BASE*.74*dir), figY(place, 0),avgd(10,BASE*.3),avgd(1,1.2));
 place++;
  noStroke();
  fill(BLACK);
drawCircle(figX(place, BASE*.72*dir), figY(place, 0),avgd(4,BASE*.1),avgd(1,1.2));
place++;

//nostril
drawCircle(figX(place, BASE*1.204*dir), figY(place, BASE*.012),avgd(2,BASE*.05),avgd(1,1.2));
place++;

//upddown line
stroke(BLACK);
drawLine(figX(place, BASE*.5*dir), figY(place, 0),0,avgd(12,BASE));
place++;
//smile line 
drawLine(figX(place, BASE*1.08*dir), figY(place, BASE*.18),zerod(dir*PI*.772),avgd(12,BASE*.300));
 place++;
 
 fill(BLACK);
      //sidefin
    drawTriangleFromCorner(figX(place, dir * BASE*.432), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.075)), avgd(1.5, 2) );
    place++;
 
 
 super.doneDraw();
 
 }
 
 
 }



class StripedFish extends Fish {

  StripedFish(int bp ,int sn) {
 
 super(bp, sn);
    BASE = 50; 
    speedMul = 5;
    super.duper();
  }


  void draw() {
    super.draw(); 
    int place = baseplace;


    stroke(GREEN);
    fill(WHITE);

    strokeMed();
    //void drawD(float x, float y, float a, float sz, float stretch) {
    drawD(figX(place, 0), figY(place, 0), zerod(PI/2- PI/2*dir), avgd(16, BASE), 1 ) ;


    place++;

    fill(GREEN, 255);
    //tail w/ flip
    drawTriangleFromCorner(figX(place, dir * -BASE*.724), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.35)), avgd(1.5, .8 + (speed*.8) ) );
    place++;

    //top fin
    drawTriangleFromBase(figX(place, BASE*-.288*dir), figY(place, BASE*-.252)+antizerod(6), zerod(PI * -(.1 + speed * .2)  *dir), avgd(8, BASE*.2), 1.5 );
    place++;

    //bot fin
    drawTriangleFromBase(figX(place, BASE*-.192*dir), figY(place, BASE*.292)+antizerod(6), zerod((PI *1  +PI* (.1 + speed * .2)  )  *dir), avgd(8, BASE*.2), avgd(2, 2.5) );
    place++;

    //small bot fin
    drawTriangleFromBase(figX(place, BASE*-.548*dir), figY(place, BASE*.084)+antizerod(6), zerod((PI *1  +PI* (.1 + speed * .2)  )  *dir), avgd(8, BASE*.1), avgd(2, 2.5) );
    place++;

    //body
    drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), 1.5 );
    place++;
//stripes
    stroke(BLACK);
    fill(BLACK);
    drawTrapezoid(figX(place, BASE*-.044*dir), figY(place, 0), avgd(6, BASE/12*dir), avgd(12, BASE*.868), avgd(1, .56 * 2), 0);
    place++;
    drawTrapezoid(figX(place, BASE*-.288*dir), figY(place, 0), avgd(6, BASE/12*dir), avgd(12, BASE*.508), avgd(1, 2*.656), 0);
    place++;
    drawTrapezoid(figX(place, BASE*-.52*dir), figY(place, 0), avgd(6, BASE/12*dir), avgd(12, BASE*.2), avgd(1, 1.6), 0);
    place++;


    stroke(GREEN); fill(GREEN);

    drawCircle(figX(place, BASE*.288*dir), figY(place, BASE*-.132), avgd(16, BASE*.236));
    place++;
    noStroke();
    fill(BLACK);
    drawCircle(figX(place, BASE*.336*dir), figY(place, BASE*-.128), avgd(8, BASE*.12));
    place++;

    drawCircle(figX(place, BASE*.44*dir), figY(place, BASE*.032), avgd(4, BASE*.05));
    place++;
    noFill();
    stroke(GREEN);
    drawLine(figX(place, BASE*.308*dir), figY(place, BASE*.204), zerod(PI*-.276*dir), avgd(12, BASE*.25));


    super.doneDraw();
  }
}


class MixedFish extends Fish {

  MixedFish(int bp ,int sn) {
 
 super(bp, sn);
    BASE = 35; 
    speedMul = 5;
    super.duper();
  }


  void draw() {
    super.draw(); 
    int place = baseplace;

    //float m = k.scaleX; float n = k.scaleY;  println(m+":"+n);
    stroke(GREEN);
    strokeMed();
    fill(GREEN);
    drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), avgd(1.5, 3)  );
    place++;

    stroke(ORANGE);
    fill(ORANGE);
    //tail w/ flip
    drawTriangleFromCorner(figX(place, dir * -BASE*1.284), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.5)), avgd(1.5, .8 + (speed*.8) ) );
    place++;
    drawTriangleFromPoints(figX(place, dir*BASE*-.81)-antizerod(5), figY(place, BASE*-.264)+antizerod(5), 
    figX(place, BASE*-(.5 + abs(speed*.5) )*dir), figY(place, BASE*-0.752)-antizerod(5), 
    figX(place, dir*BASE*-.22)+antizerod(5), figY(place, BASE*-.408)+antizerod(5));
    place++;
    drawTriangleFromPoints(figX(place, dir*BASE*-.81)-antizerod(5), figY(place, -BASE*-.264)+antizerod(5), 
    figX(place, BASE*-(.5 + abs(speed*.5) )*dir), figY(place, -BASE*-0.752)-antizerod(5), 
    figX(place, dir*BASE*-.22)+antizerod(5), figY(place, -BASE*-.408)+antizerod(5));
    place++;

    fill(TAN, zerod(255));
    stroke(TAN);

    drawD(figX(place, 0), figY(place, 0), zerod(PI/2-PI /2*dir), avgd(16, BASE), avgd(1, 1.3)  );
    place++;


    stroke(BLACK);
    noFill();
    drawU(figX(place, BASE*-0.148*dir), figY(place, BASE*-0.224)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;
    drawU(figX(place, BASE*-0.136*dir), figY(place, BASE*.208)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;
    drawU(figX(place, BASE*-.344*dir), figY(place, BASE*.104)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;
    drawU(figX(place, BASE*-.432*dir), figY(place, BASE*-.172)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;
    drawU(figX(place, BASE*-.66*dir), figY(place, BASE*.112)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;
    drawU(figX(place, BASE*-.848*dir), figY(place, BASE*-0.064)-antizerod(4), zerod(dir*PI/2), avgd(20, BASE*.2), avgd(.4, 1), false);
    place++;


    stroke(TAN);
    fill(WHITE);
    drawCircle(figX(place, BASE*.288*dir), figY(place, BASE*-.132), avgd(16, BASE*.35));
    place++;
    noStroke();
    fill(BLACK);
    drawCircle(figX(place, BASE*.34*dir), figY(place, BASE*-.104), avgd(8, BASE*.15));
    place++;

    drawCircle(figX(place, BASE*.552*dir), figY(place, BASE*.072), avgd(4, BASE*.1));
    place++;
    noFill();
    stroke(BLACK);
    drawLine(figX(place, BASE*.308*dir), figY(place, BASE*.204), zerod(PI*-.276*dir), avgd(12, BASE*.5));
    super.doneDraw();
  }
}


class FirstFish extends Fish {

  FirstFish(int bp ,int sn) {
 
 super(bp, sn);
    BASE = 30; 
    speedMul = 5;
    super.duper();
  }

  void draw() {
    super.draw(); 
    int place = baseplace;


    stroke(GREEN);
    strokeMed();
    fill(GREEN, zerod(255));
    //void drawD(float x, float y, float a, float sz, float stretch) {

    drawD(figX(place, 0), figY(place, 0), zerod(PI/2-PI/2*dir), avgd(16, BASE), 1  );
    place++;

    fill(GREEN);

    //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(6), zerod(-PI/2*dir), avgd(8, BASE/2), 1.5 );
    place++;
    //   drawTriangleFromCorner(float x, float y, float a, float sz, float scale) {

    //tail
    drawTriangleFromCorner(figX(place, dir * -BASE*.688), figY(place, 0)+antizerod(-6), zerod(PI/2*dir), avgd(8, BASE*(.5)), avgd(1.5, .8 + (speed*.8) ) );
    place++;

    //

    //
    drawMFromBase(figX(place, dir*BASE*-.38), figY(place, BASE*(-.208 + speed*.1)) + antizerod(8), zerod(dir*-PI*.156 ), avgd(15, BASE*.6), avgd(1, .5));
    // stroke(BLACK);
    place++;

    drawMFromBase(figX(place, dir*BASE*-.42), figY(place, BASE*(.196 -speed*.1 )  ) + antizerod(8), zerod(PI + dir*PI*.156), avgd(15, BASE*.6), avgd(1, .5));
    place++;
    stroke(BLACK);
    fill(BLACK);

    drawCircle(figX(place, dir*BASE*.1), figY(place, BASE*-.128), BASE*.1, 1);
    place++;

    drawLine(figX(place, dir*BASE*.224), figY(place, BASE*.14), zerod(PI*.664*dir), avgd(12, BASE*.5));


    super.doneDraw();
  }
}


class Fish extends Animal {
  float basex, basey;
  float ang;
  float mv;
  float dir = 1.0;

  int numParts = 0;
  int baseplace;

  float MINX = 100;
  float MAXX = 400;
  float MINY = 100;
  float MAXY = 350;



  float speed = 0;
  float yspeedmul = 0;
  //float speedMul;
  float speedMul = 1;
int ofSix;
  int getNumParts() {
    return numParts;
  }

  Fish(int startPlace, int sn) {

    super();

    baseplace = startPlace;
ofSix = sn;
    // if(random(1) < .5) goLeft = true;
  }
  float startY;
  void duper() {
    smallStrokeWeight = BASE/30;
    basicStrokeWeight = BASE/25;
    heavyStrokeWeight = BASE/20;
    PIECECOUNT = 20;
    float mul = 300 / 6;
    
    basex = random(100, 400); 
    basey = mul * ofSix;
    startY = basey;
    if(random(100) < 50) dir = -1;
  }


  void move() {
    if(freeze) { 
      dir = k.mousePressed()?-1:1;
      //speed = map(k.scaleX,-1,1,0,1);
      speed = k.mousePressed()?1:0;
      return;
    }
    if (speed < .3) { //might be time to kick
      if (random(1) < .1) {  //random chance of kick!
        speed = 1;
        yspeedmul = random(-1, 1);
      }
      if (k.mousePressed()) {
        if (abs(basex - mouseX) > BASE*.5) { //avoid swish back and forth
          if (basex < mouseX ) {
            dir = 1;
          } 
          else {
            dir = -1;
          }
        }

    }
    
            float goalY = mouseY;
        if(! k.mousePressed()){
           goalY = startY; 
        }
        if (basey < goalY) {
          yspeedmul = abs(yspeedmul);
        } 
        else {           
          yspeedmul = -abs(yspeedmul);
        }
      }
    
    
    speed *= .95;

    if (basex > MAXX) dir = -1;
    if (basex < MINX) dir = 1;
    if (basey > MAXY) yspeedmul = -abs(yspeedmul);
    if (basey < MINY) yspeedmul = abs(yspeedmul);

    basex += dir * speed * speedMul;
    basey += abs(speed) * yspeedmul;
  }


  void draw() { 

    super.draw();
    strokeMed();
    pushMatrix();
    translate(zerod(basex), zerod(basey));
    //dir = 1;
    //if (mousePressed) dir = -1;
  }
  void doneDraw() {
    popMatrix();
  }
}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
