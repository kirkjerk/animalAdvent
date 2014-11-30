int BASECOUNT = 13; //crow

Crow c = new Crow();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);
}
void draw() {
  background(WHITE);
  c.draw();
  k.draw();
  k.adv();
}
class Kaw {
  Crow c ;
  float x, y;
  float remain;
  Kaw(Crow pc) {
    c = pc;
    remain = 1.0;
    x = c.BASE*1.8;
    y = 0;
  } 
  boolean move() {
    remain -= .01;
    y -= .5;
    if (remain <= 0) return false;
    

    return true;
  }
  void draw(int place) {
    stroke(BLACK, 255 * remain);
    pushMatrix();
    translate(c.zerod(x), c.zerod(y));
    c.drawK(c.figX(place,0),c.figY(place,0), 8);
    c.drawA(c.figX(place+1,20),c.figY(place+1,0), 8);
    c.drawW(c.figX(place+2,40),c.figY(place+2,0), 8);
    popMatrix();

  }
}


class Crow extends Animal {
  ArrayList<Kaw> kaws = new ArrayList<Kaw>();

  float basex, basey;
  float backup;

  Crow() {

    super();
    //cache some sin values



    BASE = 65;
    smallStrokeWeight = BASE/30;
    basicStrokeWeight = BASE/20;
    heavyStrokeWeight = BASE/10;
    basex = 250; 
    basey = 250;
  }


  boolean mouseLastTime = false;

  void draw() { 
    super.draw();
    pushMatrix();


    if (k.mousePressed()) {
      if (! mouseLastTime) {
        kaws.add(0,new Kaw(this));
      }
      mouseLastTime = true;
    } 
    else {
      mouseLastTime = false;
    }


    backup = map(k.scaleY, -1, 1, 0, 1);

    translate(zerod(basex), zerod(basey));
    strokeMed();
    fill(BLACK, zerod(255));
    stroke(BLACK);
    drawBody(1);
    drawWings(3, 4);
    drawBeak(5, 6);
    drawTail(7);
    drawHead(2, 12, 13);
    drawLegs(8);

  int place = 14;

    ArrayList<Kaw> kawsToKill = new ArrayList<Kaw>();
    for (Kaw kaw : kaws) {
      if (! kaw.move()) {
        kawsToKill.add(kaw);
      } else {
         kaw.draw(place);
        place += 3; 
      }
    }
    kaws.removeAll(kawsToKill);



    popMatrix();
  }
  void drawBody(int place) {
    // drawD(float x, float y, float a, float sz, float stretch) {drawSquareCentered(figX(place,0),figY(place,0),avgd(10,BASE*.8),avgd(14,BASE));
    drawD(figX(place, 0), figY(place, 0), avgd(0, PI/2), avgd(14, BASE), 1);
  }

  void drawHead(int place, int placeEye, int placePupil) {
    fill(BLACK, zerod(255));
    // drawD(float x, float y, float a, float sz, float stretch) {drawSquareCentered(figX(place,0),figY(place,0),avgd(10,BASE*.8),avgd(14,BASE));
    drawD(figX(place, BASE*.852), figY(place, BASE*-.116), avgd(0, PI), avgd(14, BASE*.6), avgd(1, 1.5));
    fill(WHITE);
    drawCircle(figX(placeEye, BASE*.708), figY(placeEye, BASE*-0.124), avgd(10, BASE*.3));
    noStroke();
    fill(GREEN);
    drawCircle(figX(placePupil, BASE*.704), figY(placePupil, BASE*-.088), avgd(8, BASE*.15));
  }

  void drawWings(int place1, int place2) {
    // drawD(float x, float y, float a, float sz, float stretch) {drawSquareCentered(figX(place,0),figY(place,0),avgd(10,BASE*.8),avgd(14,BASE));
    drawD(figX(place1, BASE*.1 + BASE*k.scaleX*.1), figY(place1, BASE*-.26), avgd(0, -.2 + k.scaleX/3), avgd(14, BASE*.9), avgd(1, .6));
    drawD(figX(place2, BASE*-.276 + BASE*k.scaleX*.1), figY(place2, BASE*-.26), avgd(0, -.2+k.scaleX/3), avgd(14, BASE*.9), avgd(1, .6));
  }
  void drawBeak(int place1, int place2) {
    //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    fill(BLACK);
    drawTriangleFromBase(figX(place1, BASE*.808 ), figY(place1, BASE*-.256)+antizerod(8), zerod(PI/2 - k.scaleBut/2), avgd(6, BASE*.17), avgd(3, 4)) ;  
    drawTriangleFromBase(figX(place2, BASE*.808 ), figY(place2, BASE*.028)+antizerod(8), zerod(PI/2 + k.scaleBut/2), avgd(6, BASE*.17), avgd(3, 4)) ;
  }  
  void drawTail(int place) {
    //drawTriangleFromCorner(float x, float y, float a, float sz, float scale)
    drawTriangleFromCorner(figX(place, BASE*-.48 ), figY(place, BASE*.028)-antizerod(8), zerod(PI/2 + backup), avgd(5, BASE*.17), avgd(3, 4));
  }

  void drawLegs(int place) {
    stroke(PINK);
    pushMatrix();
    translate(0, zerod(BASE*.22));
    rotate(zerod((1-backup)*1.32));
    // line(0,0,BASE*m,BASE*n);
    stroke(BLACK);
    line(figX(place, -BASE*.1), figY(place, 0)- antizerod(6), figX(place, -BASE*.1), figY(place, BASE*.75)+antizerod(6));
    place++;
    drawBirdTrack(figX(place, BASE*-.1), figY(place, BASE*.732), avgd(12, BASE*.15), zerod(PI+backup), 1.5);
    place++;
    line(figX(place, BASE*.1), figY(place, 0)- antizerod(6), figX(place, BASE*.1), figY(place, BASE*.75 )+antizerod(6));
    place++;
    drawBirdTrack(figX(place, BASE*.1), figY(place, BASE*.732), avgd(12, BASE*.15), zerod(PI-backup), 1.5);
    place++;

    popMatrix();
  }
}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
