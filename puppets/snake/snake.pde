int BASECOUNT = 3; //snake

Snake s = new Snake();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  
}
void draw() {
  background(WHITE);
  s.draw();
  k.draw();
  k.adv();
}


class Snake extends Animal {
  float x,y;

  Snake() {
    super();
    BASE = 300;
    smallStrokeWeight = BASE/200;
    basicStrokeWeight = BASE/80;
    heavyStrokeWeight = BASE/30;
    PIECECOUNT = 20;
    x = 250; 
    y = 250;

    
  }

float mv; 
  void draw() { 
    super.draw();
    pushMatrix();
    
    translate(zerod(mouseX),zerod(mouseY));
rotate(zerod(k.scaleX));

strokeCap(ROUND);
float mv = 0;

    drawBody(1,2,3);

    popMatrix(); //head
  }
  void drawBody(int place, int placeTongue, int placeEye){

//  float drawSine(float x1, float x2, float ybase,
//                  float startseed, float endseed,
//                  ifloat   steps, float yscale){

mv += k.scaleBut/3; 
if(mv >= 2 * PI) mv -= 2 * PI;
noStroke();noFill();
      float endval = drawSine(figX(place,0),figY(place,0),avgd(PI/2,0),avgd(20,BASE),
          avgd(PI*-0.18,mv),avgd(PI*2.176,mv + 8*PI),
          120,avgd(10,BASE*.06));
//void drawBirdTrack(float x, float y, float sz, float a, float apart) {
        strokeMin();
        stroke(PINK);
        
  
         drawYFromBase(figX(placeTongue,BASE*.5),figY(placeTongue,sin(endval) * BASE*.06) + antizerod(10),
                 avgd(20,BASE*.05),avgd(0,PI/2 + cos(endval)),.5); 
          strokeMax();
stroke(GREEN);
noFill();
   
         drawSine(figX(place,0),figY(place,0),avgd(PI/2 * 1.15,0),avgd(20,BASE),
          avgd(PI*-0.18,mv),avgd(PI*2.176,mv + 8*PI),
          120,avgd(10,BASE*.06));
          
          
          noStroke();
          fill(BLACK);
          
          drawCircle(figX(placeEye,BASE*.5),figY(placeEye,sin(endval) * BASE*.06)  - 3         ,BASE*.02);
  }

  
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
