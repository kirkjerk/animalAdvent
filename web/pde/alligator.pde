int BASECOUNT = 45; //alligator

Alligator  a = new Alligator();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  a.draw();
  k.draw();
  k.adv();
}


class Alligator extends Animal {
  float x, y;
  float ang;
  float mv;
  Alligator() {
    super();
    BASE = 150;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/45;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 200; 
    y = 250;

    ang = 0;
    mv = 0;
  }

  float jawang;
  void draw() { 
    super.draw();

    if (k.mousePressed()) {
      jawang = -k.scaleBut * 1.3;
    } 
    else {
      if (jawang < 0) jawang += .2;
    }
    if (jawang > 0) {
      jawang = 0;
    }

    pushMatrix();
    translate(zerod(x), zerod(y*1.25));

    //rotate(-zerod(k.scaleY)/3);

    translate(0, zerod(y*-.25));

    strokeMicro();
    stroke(GREEN);

    drawBody(1);
    fill(GREEN, avgd(0, 255));
    drawTail(2);
    drawFeet(3, 4, 5, 6, 27, 28, 29, 30);
    drawLowerJaw(7);
    //
    //  void drawUpperJaw(int placejaw, int placeeye1, int placeeye2, int placenose1, int placenose2, 
    //int place, int placeeye, int placeback) { 

    drawUpperJaw(8, 9, 10, 11, 12, 13, 23, 40);
    //drawUpperJaw(1,1,1,1,1,1,1,1);
    drawBackStuff(31, 42);
    popMatrix();
  }


  void drawBackStuff(int place, int oplace) {
    strokeMed();
    stroke(ORANGE);
    noFill();

    //drawBackSquarePrint(m,n,.13,.06, 0, place); place++;

    drawBackSquare(-0.86800003, 0.075999975, 0.16, 0.05, -0.3926991, place); 
    place++;
    drawBackSquare(-0.388, -0.06400001, 0.2, 0.11, 0.0, place); 
    place++;
    drawBackSquare(-0.652, -0.015999973, 0.2, 0.07, -0.3926991, place); 
    place++;
    drawBackSquare(-0.68, 0.11199999, 0.16, 0.05, -0.19634955, place); 
    place++;
    drawBackSquare(-0.44, 0.08800006, 0.16, 0.07, 0.0, place); 
    place++;
    drawBackSquare(-0.07999998, -0.09200001, 0.3, 0.07, 0.0, place); 
    place++;
    drawBackSquare(-0.051999986, 0.04400003, 0.3, 0.09, 0.0, place); 
    place++;
    drawBackSquare(0.27600002, -0.04400003, 0.26, 0.12, 0.0, place); 
    place++;
    drawBackSquare(0.232, 0.08800006, 0.13, 0.06, 0.0, place); 
    place++;

    //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);

    //drawBackSquare(m,n,0.13,0.06, 0.0, place); place++;

    fill(ORANGE);
    noStroke();
    drawCircle(figX(oplace, BASE*-0.824), figY(oplace, BASE*0.14), BASE*.03); 
    oplace++;
    drawCircle(figX(oplace, BASE*-0.564), figY(oplace, BASE*0.06799996), BASE*.03);
    oplace++;
    drawCircle(figX(oplace, BASE*-0.292), figY(oplace, BASE*0.088), BASE*.03);
    oplace++;
    drawCircle(figX(oplace, BASE*0.384), figY(oplace, BASE*0.08), BASE*.03);
    oplace++;
  }

  void drawBackSquarePrint(float x, float y, float w, float h, float a, int place) {
    //println("drawBackSquare("+x+","+y+","+w+","+h+", "+a+", place); place++;");
    drawBackSquare( x, y, w, h, a, place);
  }
  void drawBackSquare(float x, float y, float w, float h, float a, int place) {


    drawSquareCenteredAngled(  figX(place, BASE*x), figY(place, BASE*y), avgd(15, BASE*w), avgd(10, BASE*h), zerod(a));
  }


  void drawBody(int place) {
    fill(GREEN);
    drawSquareCentered(figX(place, 0), figY(place, 0), avgd(15, BASE), avgd(5, BASE/3));
  }
  void drawTail(int place) {

    drawTriangleFromPoints(
    figX(place, -BASE/2) + antizerod(10), 
    figY(place, -BASE/6) - antizerod(5), 
    figX(place, -BASE/2) + antizerod(10), 
    figY(place, BASE/6) + antizerod(5), 
    figX(place, -BASE*5/4) - antizerod(10), 
    figY(place, BASE/5) );
  }
  void drawLowerJaw(int place) { 
    drawTriangleFromPoints(
    figX(place, BASE/2) - antizerod(10), 
    figY(place, BASE/24) - antizerod(5), //top
    figX(place, BASE/2) - antizerod(10), 
    figY(place, BASE/6) + antizerod(5), //bottom
    figX(place, BASE*7/4) + antizerod(10), 
    figY(place, BASE/12) ); //out
  }   

  void drawUpperJaw(int placejaw, int placeeye1, int placeeye2, int placenose1, int placenose2, 
  int place, int placeeye, int placeback) { 
    //float a = map(k.scaleY,-1,1,-1,0);
    //println(a);
    pushMatrix();
    translate(zerod(BASE/2), 0);
    rotate(zerod(jawang));
    drawTriangleFromPoints(
    figX(placejaw, 0) - antizerod(10), 
    figY(placejaw, -BASE/6) - antizerod(5), //top
    figX(placejaw, 0) - antizerod(10), 
    figY(placejaw, BASE/24) + antizerod(5), //bottom
    figX(placejaw, BASE*5/4 ) + antizerod(10), 
    figY(placejaw, 0) ); //out
    // fill(PINK);
    //fill(PINK,avgd(0,128));
    //extra circle
    drawCircle(figX(place, 0)+ antizerod(10), figY(place, 0), 
    avgd(0, BASE*.1)) ;




    strokeMed();
    noFill();
    // drawC(float x, float y, float a, 
    //float sz, float stretch, float extraangle) {
    drawC(figX(placeeye1, BASE*.16), figY(placeeye1, BASE*-.164), zerod(PI/2), avgd(15, BASE*.15), avgd(1, .75), -.2);
    drawC(figX(placeeye2, BASE*.316), figY(placeeye2, BASE*-.14), zerod(PI/2), avgd(15, BASE*.15), avgd(1, .75), -.2);


    drawCircle(figX(placenose1, BASE*1.136), figY(placenose1, BASE*-.04), avgd(10, BASE*.065));
    drawCircle(figX(placenose2, BASE*1.064), figY(placenose2, BASE*-.048), avgd(10, BASE*.065));
    //drawCircle(BASE*1.064, BASE*-0.048,BASE*.065);

    stroke(BLACK, 255);
    strokeMin();

    for (int i = 1; i <6; i++) {
      drawTooth(i, 1, place, BASE*.15);
      place++;
    }

    noStroke();
    fill(ORANGE);
    //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);println("figX(place,BASE*"+m+"),figY(place,BASE*"+n+")");
    drawCircle(figX(placeeye, BASE*.164), figY(placeeye, BASE*-.176), BASE*.07);
    placeeye++;
    drawCircle(figX(placeeye, BASE*.32), figY(placeeye, BASE*-.152), BASE*.07);
    placeeye++;
    fill(BLACK);
    drawCircle(figX(placeeye, BASE*.164), figY(placeeye, BASE*-.176), BASE*.035);
    placeeye++;
    drawCircle(figX(placeeye, BASE*.32), figY(placeeye, BASE*-.152), BASE*.035);
    placeeye++;

    stroke(ORANGE);
    noFill();

    //drawBackSquarePrint(m,n,.17,.05, 0, placeback); placeback++;
    drawBackSquare(0.48399997, -0.047999978, 0.17, 0.05, zerod(PI/30), placeback); 
    placeback++;
    drawBackSquare(0.13199997, -0.051999986, 0.13, 0.06, 0.0, placeback); 
    placeback++;


    popMatrix();
    stroke(BLACK);
    //lower teeth row
    pushMatrix();
    translate(zerod(BASE/2), zerod(BASE/16));
    rotate(zerod(PI*.008));


    for (int i = 0; i <5; i++) {
      drawTooth(i, -1, place, BASE*.25);
      place++;
    }

    popMatrix();
  }  
  void drawTooth(int out, float dir, int place, float off) {
    float cx = off + (BASE * out)* .2;
    float sz = map(out, 0, 5, BASE*.06, BASE*.08);
    drawVByPoints(   
    figX(place, cx) - avgd(5, sz*.8), figY(place, 0)  -dir *antizerod(5), 
    figX(place, cx), figY(place, 0) + dir * avgd(10, sz), 

    figX(place, cx) + avgd(5, sz*.8), figY(place, 0) -dir *antizerod(5)
      );
  }


  void drawFeet(int place1, int place2, int place3, int place4, 
  int placefoot1, int placefoot2, int placefoot3, int placefoot4) {
    drawFoot(place2, -BASE*.45, placefoot1, k.scaleY, k.scaleX); 

    drawFoot(place1, -BASE*.3, placefoot2, k.scaleX, k.scaleY); 
    drawFoot(place3, BASE*.3, placefoot3, -k.scaleY, - k.scaleX); 
    drawFoot(place4, BASE*.45, placefoot4, -k.scaleX, -k.scaleY);
  }
  void drawFoot(int place, float x, int placefoot, float offX, float offY) {
    pushMatrix();
    translate(zerod(offX * BASE*.05), zerod(offY * BASE * .02));
    strokeMin();
    float topy =  figY(place, BASE/6) - antizerod(5);
    drawTriangleFromPoints(
    figX(place, x) - avgd(5, BASE*.08), 
    topy, 
    figX(place, x) + avgd(5, BASE*.05), 
    topy, 
    figX(place, x), 
    topy + avgd(8, BASE*.16)

    );
    strokeMed();
    topy =  figY(placefoot, BASE/6);
    //drawBirdTrack(float x, float y, float sz, float a, float apart) {
    drawBirdTrack(figX(placefoot, x)-antizerod(5), topy + avgd(0, BASE*.16)-antizerod(8), BASE*.1, PI/2, 1);
    popMatrix();
  }
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
