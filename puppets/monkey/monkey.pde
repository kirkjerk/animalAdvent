int BASECOUNT = 12; //monkey

Monkey monk = new Monkey();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);
}
void draw() {
  background(WHITE);
  monk.draw();
  k.draw();
  k.adv();
}

class Monkey extends Animal {
  float basex, basey;
  float ang;
  float mv;

  float windup;
    boolean mouseDownBefore;
    boolean isJumping;
    float spinangle = 0;
    
    float ydelta;
    float yspeed;
    
    float landingness = 0;
    
  Monkey() {

    super();
    //cache some sin values

    

    BASE = 65;
    smallStrokeWeight = BASE/30;
    basicStrokeWeight = BASE/20;
    heavyStrokeWeight = BASE/10;
    basex = 250; 
    basey = 250;

    ang = 0;
    mv = 0;
  }




  void draw() { 
    super.draw();
    pushMatrix();
    
    if(! k.mousePressed() && mouseDownBefore && ! isJumping){
      isJumping = true;
      windup = 0;
      yspeed = BASE*.1;
      landingness = 1;
    }
    
    if(isJumping){
      spinangle -= .2;
      if(spinangle < -2 * PI){
         spinangle = 0;
        isJumping = false; 
      }
    } else {
      if(landingness > 0){
         windup = k.scaleBut / 2;
      } else {
         windup = landingness; 
         landingness -= .1;
         if(landingness <0) landingness = 0;
      }
     
    }
    
    ydelta += yspeed;
    
    if(ydelta > 0 ){
             yspeed -= BASE*.006;
    } else {
       ydelta = 0; 
    }
    
    translate(zerod(basex), zerod(basey - ydelta));
strokeMed();
    fill(TAN);
    stroke(TAN);
    rotate(zerod(PI*.2 + windup + spinangle));
    strokeMed();
    
    drawBody(1);
    
    drawHead(2,3,4,5);
    
    
    
    strokeMax();
    
    drawLimbs(8);

    fill(BLACK);
    noStroke();
    drawEyesAndNose(6,7);


    popMatrix();
    
    mouseDownBefore = k.mousePressed();
  }
  void drawBody(int place){
     drawSquareCentered(figX(place,0),figY(place,0),avgd(10,BASE*.8),avgd(14,BASE)); 
  }
  void drawHead(int placeHead, int placeEar, int placeSnout, int placeMouth){
    //void drawD(float x, float y, float a, float sz, float stretch) {
    fill(TAN,zerod(255));
    drawD(figX(placeHead,BASE*.076),figY(placeHead,BASE*-1.224),zerod(PI*-1.068),avgd(16,BASE*1.4),avgd(1,1.4));
    fill(WHITE);
    drawD(figX(placeEar,BASE*-.216),figY(placeEar,BASE*-1.192),zerod(-PI*1.1 ),avgd(16,BASE*.65),avgd(1,1.4));
  noFill();
    drawC(figX(placeSnout,BASE*-.132),figY(placeSnout,BASE*-.988),zerod(-PI*1.1 ),avgd(16,BASE*1.1),avgd(1,2),zerod(-1));

    drawC(figX(placeMouth,BASE*.48),figY(placeMouth,BASE*-1.536),zerod(PI*-.528 ),avgd(16,BASE*1.1),avgd(1,1),zerod(-1.5));



  }
  void drawEyesAndNose(int placeEye, int placeNose){
    drawCircle(figX(placeNose,BASE*.08),figY(placeNose,BASE*-1.664),BASE*.15);
    drawCircle(figX(placeEye,BASE*-.108),figY(placeEye,BASE*-1.68),BASE*.07);
  }
  void drawLimbs(int place){
    drawCFromBot(figX(place,BASE*.08),figY(place,BASE*-.012)+antizerod(8),zerod(PI*.564 + k.scaleX /2),avgd(16,BASE*1.1),avgd(1,1),zerod(-1.5));
    place++;
    drawCFromBot(figX(place,BASE*-.164),figY(place,BASE*.068)+antizerod(8),zerod(PI*.664 +k.scaleY/2),avgd(16,BASE*1.1),avgd(1,1),zerod(-1.5));
    place++;
    drawCFromBot(figX(place,BASE*.012),figY(place,BASE*.572)+antizerod(8),zerod(PI*.764    - windup  ),avgd(16,BASE*1.1),avgd(1,1),zerod(-1.5));
    place++;
    drawCFromBot(figX(place,BASE*-.428),figY(place,BASE*.516)+antizerod(8),zerod(PI*.864 -  windup ),avgd(16,BASE*1.1),avgd(1,1),zerod(-1.5));
    place++;
//drawSpiral(float x, float y, float a, float sz, float undo) {
  drawSpiral(figX(place,BASE*-.344)-antizerod(6), figY(place,BASE*.468)-antizerod(6), avgd(0,PI*.75), avgd(16,BASE), 0,-1);
  place++;
  }
  

}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
