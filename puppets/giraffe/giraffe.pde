int BASECOUNT = 50; //giraffe

Giraffe g = new Giraffe();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);
}
void draw() {
  background(WHITE);
  g.draw();
  k.draw();
  k.adv();
  
}

class Giraffe extends Animal {
  float basex, basey;
  float ang;
  float mv;

  float neckMul = 1;


  Giraffe() {

    super();
    //cache some sin values



    BASE = 100;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/35;
    heavyStrokeWeight = BASE/20;
    basex = 250; 
    basey = 250;

    ang = 0;
    mv = 0;
  }




  void draw() { 

    super.draw();



    //    neckMul = map(k.scaleY, 1, -1, .7,1.1);
    if (k.mousePressed()) {
      neckMul *= 1.02;
    } 
    else {
      neckMul = 1 + (neckMul - 1) * .8;
    }
    //BASE = map(neckMul - 1,0,100,50,.01);
    //BASE = map(k.scaleY,1,-1,1,100);


    BASE = 360 / (2.2 + 2*neckMul);

    basey =  406 - BASE*1.8;// + (neckMul-1) * 10;
    //BASE = 100 + 20 / constrain((neckMul - 1),1,200);
    float heightOnScreen = (BASE*2.2) + BASE * 2 * neckMul;


    float r = 0;

    pushMatrix();
    strokeMed();
    fill(ORANGE);
    stroke(ORANGE);


    translate(zerod(basex), zerod(basey));


    drawBody(1);


    pushMatrix();
    translate(zerod(BASE*.365), zerod(BASE*-.112));

    rotate(zerod(.22+k.scaleX)); //neck angle
    drawNeck(2);
    drawHead(3, 14);

    drawMane(20);
    fill(BROWN); 
    noStroke();
    drawNeckSpots(45);

    popMatrix();
    fill(ORANGE); 
    stroke(ORANGE);
    drawLegs(4, 9);
    drawTail(8, 13); 
    fill(BROWN);
    noStroke();
    drawBodySpots(39);

    popMatrix();
  }
  void drawBodySpots(int place) {
    drawSpot(place++, -.348, -.116, .2, .15);
    drawSpot(place++, -0.384, 0.092, .2, .1);
    drawSpot(place++, -0.12, 0.056, .2, .1);
    drawSpot(place++, -0.092, -0.12, .2, .13);
    drawSpot(place++, 0.168, -0.08, .17, .17);
    drawSpot(place++, 0.184, 0.12, .2, .12);
  }
  void drawNeckSpots(int place) {
    drawSpot(place++,0.0,-0.17 * neckMul,.12,.2* neckMul);
    drawSpot(place++,0.0,-0.45 * neckMul,.12,.2* neckMul);
    drawSpot(place++,0.0,-0.72 * neckMul,.12,.2* neckMul);

    drawSpot(place++,0.0,-0.99 * neckMul,.12,.2* neckMul);
    drawSpot(place++,0.0,-1.25 * neckMul,.08 ,.2 * neckMul);
    drawSpot(place++,0.0,-1.5 * neckMul,.08 ,.2 * neckMul);
    //drawSpot(place++, m, n, .12, .2);
    //println("drawSpot(place++,"+m+","+n+",.12,.2);");
  }

  void drawSpot(int place, float x, float y, float w, float h) {
    drawSquareCentered(
    figX(place, BASE*x), 
    figY(place, BASE*y), 
    avgd(14, BASE*w), avgd(7, BASE*h));
  }

  void drawMane(int place) {

    for (int i = 1; i < 20; i++) {
      drawLine(figX(place, map(i, 0, 20, -BASE*.16, 0)), 
      figY(place, BASE * i * neckMul * -.1), zerod(PI/2), avgd(12, BASE*.08));
      place++;
    }
  }
  void drawNeck(int placeNeck) {
    // drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(placeNeck, 0), figY(placeNeck, 0)+antizerod(8), 0, avgd(6, BASE*.16), avgd(3, 13 * neckMul));
  }
  void drawBody(int place) {
    drawSquareCentered(figX(place, 0), figY(place, 0), avgd(16, BASE), avgd(8, BASE/2));
  }

  void drawHead(int placeNeck, int place) {

    pushMatrix();
    translate(0, zerod(BASE*-.16*13*neckMul));
rotate(zerod(k.scaleY));
    drawTriangleFromBase(figX(placeNeck, 0)-antizerod(8), figY(placeNeck, 0), PI/2, avgd(6, BASE*.08), avgd(3, 4));
    //void drawD(float x, float y, float a, float sz, float stretch) {
    fill(ORANGE, zerod(255));
    //drawV(float x, float y, float sz, float ang, float angApart) {

    drawV(figX(place, 0), figY(place, BASE*-.084)+antizerod(6), avgd(12, BASE*.2), 0, .5);
    place++;
    drawD(figX(place, BASE*-.136), figY(place, BASE*-.052), zerod(PI*.428), avgd(12, BASE*.24), avgd(1, .7));
    place++;
    drawD(figX(place, BASE*.3), figY(place, BASE*.032), zerod(PI*.428), avgd(8, BASE*.12), avgd(1, .5));
    place++;


    fill(ORANGE);
    drawCircle(figX(place, BASE*-0.084), figY(place, BASE*-.244), avgd(8, BASE*.05));
    place++;

    drawCircle(figX(place, BASE*.088), figY(place, BASE*-0.244), avgd(8, BASE*.05));
    place++;

    fill(BLACK);
    noStroke();
    drawCircle(figX(place, BASE*.08), figY(place, BASE*-.008), avgd(8, BASE*.05));



    fill(ORANGE);
    stroke(ORANGE);
    popMatrix();
  } 
  void drawTail(int place, int placeEnd) {


    noFill();
    pushMatrix();
    translate(zerod(BASE*-.504), zerod(BASE*-.252));
    rotate(zerod(.652));
    line(figX(place, 0), figY(place, 0)-antizerod(8), 
    figX(place, 0), figY(place, BASE*.5)+antizerod(8));
    //stroke(BLACK);
    //void drawBirdTrack(float x, float y, float sz, float a, float apart) {
    drawBirdTrack(figX(placeEnd, 0), figY(placeEnd, BASE*.5)-antizerod(4), avgd(12, BASE*.15), zerod(PI), 1.5);

    popMatrix();
  } 


  void drawLegs(int placeTop, int placeBot) {
    drawLeg(placeTop++, placeBot++, -.384, 0, 0);
    drawLeg(placeTop++, placeBot++, -.124, 0, 0);

    drawLeg(placeTop++, placeBot++, .304, .252, -.336);
    drawLeg(placeTop++, placeBot++, .396, -.252, .832);
  }
  void drawLeg(int placeTop, int placeBot, float over, float topAngle, float botAngle) {
    pushMatrix();
    //noStroke();
    strokeMed();
    translate(zerod(BASE*over), zerod(BASE*.228));
    rotate(zerod(topAngle));
    drawTriangleFromBase(figX(placeTop, 0), figY(placeTop, 0)+antizerod(8), zerod(PI), avgd(6, BASE*.1), avgd(3, 7));
    translate(zerod(0), zerod(BASE*.752));
    rotate(zerod(botAngle));
    stroke(ORANGE);
    line(figX(placeBot, 0), figY(placeBot, 0)-antizerod(8), figX(placeBot, 0), figY(placeBot, BASE)+antizerod(8));
    popMatrix();
  }
}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
