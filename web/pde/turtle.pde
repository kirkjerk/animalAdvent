int BASECOUNT = 12; //turtle

Turtle t = new Turtle();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  t.draw();
  k.draw();
  k.adv();
}


class Turtle extends Animal {
  float x, y;
  float ang;
  float mv;
  float legIn;
  float legOut;
  float legY;
  Turtle() {
    super();
    BASE = 150;
    legY = BASE*.024;
     legIn = -BASE *.12;
     legOut = BASE*.024;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/45;
    heavyStrokeWeight = BASE/20;
    PIECECOUNT = 20;
    x = 250; 
    y = 250;

    ang = 0;
    mv = 0;
  }

  float rock;


  void draw() { 
    super.draw();

    float r = 0;
  if(k.mousePressed()){  
    r = zerod((sin(rock)/4) * (1 - k.scaleBut)) ;
  }
  
    pushMatrix();
    translate(zerod(x), zerod(y + legIn - legY  + (abs(r) * BASE*.1)     ));
    



  
    rotate(r   );
 
 
   
 
rock += .2;

    drawHeadAndTail(2,7,12);
    drawLegs(3);
    drawShell(1);
    drawDivide(8,9);
    
    popMatrix();
  }
  void drawShell(int place){
    //drawD(float x, float y, float a, float sz, float stretch) {
          strokeMin();
    stroke(GREEN);
    fill(GREEN,zerod(250));

     drawD(figX(place,0),figY(place,0),zerod(-PI/2),avgd(16,BASE),1); 
  }
  float headAng = -.712;
  float tailAng = -.432;
  void drawHeadAndTail(int placeHead, int placeTail, int placeEye){
     //drawC(float x, float y, float a, float sz, float stretch, float extraangle) {
       
       strokeMax();
       stroke(TAN);
       noFill();
  //float m = k.scaleX; float n = k.scaleY; m*= 3; println(m+":"+n);     
      //headAng = PI * m;
      float headX = BASE*.5;
      float headY = BASE*-.188;
      float headSize = BASE*.3;

      if(k.mousePressed()) {
       if(headAng < -.144 ) headAng += .1;         
      } else {
        if(headAng > -.712) headAng -= .1;       
      }
      headAng = constrain(headAng, -.712,-.144);

//

      drawC(figX(placeHead,headX),figY(placeHead,headY),zerod(headAng * PI),avgd(16,headSize),1,zerod(-1.2));
//-.324
      
      float tailX = BASE*-.556;
      float tailY = BASE*-.144;
      float tailSize = BASE*.25;
//-.924

      if(k.mousePressed()) {
       if(tailAng > -.924) tailAng -= .1; 
      } else {
        if(tailAng < -.432) tailAng += .1;
      }
constrain(tailAng, -.924,-.432);
      drawC(figX(placeTail,tailX),figY(placeTail,tailY),zerod(tailAng*PI),avgd(16,tailSize),1,zerod(-1.6));

  
      noStroke();
      
      fill(BLACK);//
      //
      drawCircle(
        figX(placeEye,headX +headSize*.55*cos(PI*(headAng + .74))),
        figY(placeEye,headY+headSize*.55*sin(PI*(headAng+.74))),
        avgd(4,BASE*.03));
      
  
  }
  
  
  
 
  
  void drawLegs(int place){
    stroke(TAN);
    
      if(k.mousePressed()) {
       if(legY > legIn ) legY -= BASE*.1;         
      } else {
        if(legY < legOut) legY += BASE*.1;       
      }
      legY = constrain(legY, legIn,legOut);

    float a = k.scaleX * BASE * .05;
    float b = k.scaleY * BASE * .05;

    if(k.mousePressed()){
       a = 0;
      b = 0; 
    }
    
    drawLine(figX(place,BASE*-0.32 + a),figY(place,legY+b),0,avgd(20,BASE*.25));
    place++;
    drawLine(figX(place,BASE*-.16 - a ),figY(place,legY - b),0,avgd(20,BASE*.25));
    place++;
    drawLine(figX(place,BASE*.16 + a ),figY(place,legY + b),0,avgd(20,BASE*.25));
    place++;
    drawLine(figX(place,BASE*0.32 - a),figY(place,legY - b),0,avgd(20,BASE*.25));
    place++;
  }
  void drawDivide(int placeHoriz, int place){
    
    strokeMed();
    stroke(BLACK);
    noFill();
    drawEquals(figX(placeHoriz,0),figY(placeHoriz,BASE*-.24), avgd(6,BASE*.18), avgd(12,BASE*.752) , avgd(1,1.28));
    
    drawLine(figX(place,BASE*-.216),figY(place,BASE*-.24),avgd(PI/32,PI/8),avgd(20,BASE*.204));

    place++;
    drawLine(figX(place,0),figY(place,BASE*-.064),0,avgd(20,BASE*.152));
    place++;

    drawLine(figX(place,BASE*.216),figY(place,BASE*-.24),avgd(-PI/32,-PI/8),avgd(20,BASE*.204));

    place++;
    
  }
  void drawEquals(float x, float y, float h, float w, float botMul){
     pushMatrix();
     translate(x,y);
     line(-w/2,- h/2,w/2,-h/2);
     line(-w/2 * botMul, h/2,w/2 * botMul,h/2);
    popMatrix(); 
  }

}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
