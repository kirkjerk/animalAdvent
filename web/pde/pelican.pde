int BASECOUNT = 13; //pelican

Pelican p = new Pelican();
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


class Pelican extends Animal {
  float x, y;
  float ang;
  float mv;
  Pelican() {
    super();
    BASE = 150;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/30;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 250; 
    y = 225;

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

    drawBeak(9,10,11);

    drawBody(1,2,3,4,12,13);
    drawFeetsAndLegs(5,6,7,8);

  
    popMatrix();
  }

 
  void drawBody(int place, int placeTail, int placeNeck, int placeHead, int placeEye, int placeWing) {
    fill(TAN, zerod(255));
    stroke(TAN);
    //void drawD(float x, float y, float a, float sz, float stretch) {        
    drawD(figX(place, 0), figY(place, 0), zerod(PI/2), avgd(15, BASE), avgd(1,1.1));
    
     
   fill(TAN);
    //drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
      drawTriangleFromBase(figX(placeTail,BASE*-.396), figY(placeTail,BASE*-.004)+antizerod(6 ), 0, avgd(8,BASE*.1),avgd(2,2));
      drawTriangleFromBase(figX(placeNeck,BASE*.3), figY(placeNeck,BASE*-.004)+antizerod(6 ), 0, avgd(8,BASE*.2),avgd(2,2));
      drawCircle(figX(placeHead,BASE*.3), figY(placeHead,BASE*-.436),avgd(10,BASE*.225));
      
    noStroke();
    fill(BLACK);
    
    drawCircle(figX(placeEye,BASE*.324),figY(placeEye,BASE*-.452),avgd(4,BASE*.05));
    //draw3(float x, float y, float ang, float sz) {
      stroke(BLACK);
      noFill();
    draw3(figX(placeWing,BASE*-.06),figY(placeWing,BASE*.224),zerod(PI*.84),avgd(8,BASE*.15));
    
    
    

      
  }
  void drawBeak(int place, int placeTri, int placeLine) {
        

    fill(ORANGE, zerod(255));
    stroke(ORANGE);
    
    float midBeak = BASE*.748;
    float topBeak = BASE*-.432;
    float halfBeak = .352;
    
    //void drawD(float x, float y, float a, float sz, float stretch) {        
    drawD(figX(place, BASE*.748), figY(place, topBeak), zerod(PI/2), avgd(15, BASE*.7), avgd(1,1.4));
    
    // drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    pushMatrix();
    fill(ORANGE);
    translate(figX(placeTri,midBeak - BASE * halfBeak), figY(placeTri,topBeak - BASE * .01));
    rotate(zerod(-k.scaleBut));
    noStroke();
      drawTriangleFromBase(0,0+antizerod(8), zerod(PI/2), avgd(6,BASE*halfBeak * 2/10), avgd(5,10) );
    
    popMatrix();
    stroke(BLACK);

    line(figX(placeLine,midBeak - BASE * halfBeak),figY(placeLine,topBeak)-antizerod(8),
          figX(placeLine,midBeak + BASE * halfBeak),figY(placeLine, topBeak)+antizerod(8));
          

  }
    
  
  
  void drawFeetsAndLegs(int placefoot1, int placefoot2, int placeleg1, int placeleg2){
   // float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
    pushMatrix();
    translate(zerod(BASE*-.06), zerod(BASE*.548));
    if(k.scaleX < 0) {
      rotate(zerod(-k.scaleX));          
    }
    stroke(BLACK);
    noFill();
    line(figX(placeleg1,0),figY(placeleg1,0)-antizerod(8),figX(placeleg1,0),figY(placeleg1, BASE*.15)+antizerod(8));
    stroke(ORANGE);
    fill(ORANGE);
      
    drawTriangleFromCorner(figX(placefoot1,0),figY(placefoot1, BASE*.15)-antizerod(8),zerod(PI/5), avgd(8,BASE*.1), avgd(1.5,1)) ;
      
    popMatrix();
    
    pushMatrix();
    translate(zerod(BASE*.06), zerod(BASE*.548));
    if(k.scaleX > 0) {
      rotate(zerod(-k.scaleX));          
    }
    stroke(BLACK);
    noFill();
    line(figX(placeleg2,0),figY(placeleg2,0)-antizerod(8),figX(placeleg2,0),figY(placeleg2, BASE*.15)+antizerod(8));
    stroke(ORANGE); 
    fill(ORANGE);
      
    drawTriangleFromCorner(figX(placefoot2,0),figY(placefoot2, BASE*.15)-antizerod(8),zerod(-PI/5), avgd(8,BASE*.1), avgd(1.5,1)) ;
      
    popMatrix();    
  }
 
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
