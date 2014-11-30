class Animal {

  float BASE = 200;

  float boty = 390;

  float PIECECOUNT = 1; 

  float smallStrokeWeight, basicStrokeWeight, heavyStrokeWeight;
  float currentStrokeWeight;

  float zerod(float v) {
    return avgd(0, v);
  }
  float antizerod(float v) {
    return avgd(v, 0);
  }
  float avgd(float a, float b) {
    return k.avg(a, b);
  }

  void draw() {
    drawGrid();
    m = (float)Math.round(k.scaleX * 1000) / 1000;
    n = (float)Math.round(k.scaleY * 1000) / 1000;
    //println(m+"::"+n+"     "+frameRate);
  }


  void drawGrid() {

    strokeWeight(1);
    stroke(200); 
    noFill(); 
    float oldAlong = k.along;
    k.along = 0;

    for (int i = 1 ; i <= 72; i++) {
      float x = figXFake(i, 0)-8;
      float y = figY(i, 0)-8;
      rect(x, y, 16, 16);
    } 
    k.along = oldAlong;
  }


  void strokeMicro() {
    strokeWeight(1);
  }
  void strokeMin() {
    setLightStrokeWeight();
  }
  void strokeMed() {
    setStrokeWeight();
  }
  void strokeMax() {
    setHeavyStrokeWeight();
  }
  void strokeMega() {
  }


  void setStrokeWeight() {
    currentStrokeWeight = avgd(smallStrokeWeight, basicStrokeWeight);
    strokeWeight(currentStrokeWeight);
  }
  void setHeavyStrokeWeight() {
    currentStrokeWeight = avgd(smallStrokeWeight, heavyStrokeWeight);
    strokeWeight(currentStrokeWeight);
  }
  void setLightStrokeWeight() {
    currentStrokeWeight = smallStrokeWeight;
    strokeWeight(currentStrokeWeight);
  }

  int MAXPLACE = 18;

  float figXCore(int place, float dest) {
    place--;
    int newplace = place % MAXPLACE;

    return  avgd(over(newplace), dest);
  }
  float figXFake(int place, float dest) {
    return figXCore(place, dest);
  }
  float figX(int place, float dest) {
    if (place > allTimeMaxPlace) {
      //println("WAS"+allTimeMaxPlace);
      allTimeMaxPlace = place;
      //println(allTimeMaxPlace);
    }
    return figXCore(place, dest);
  }
  float figY(int place, float dest) {
    place--;
    int newplace = floor(place / MAXPLACE);

    float result = avgd(boty + 30 * newplace, dest); 
    return  result;
  }  
  int piecePtr;

  float over(int place) {
    float w = 460.0 / MAXPLACE;
    return 30 + (w * place);
  }

  void drawLine(float x, float y, float a, float sz) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, -sz/2, 0, sz/2);
    popMatrix();
  }

  void drawLineFromEndpoint(float x, float y, float a, float sz) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, sz, 0);
    popMatrix();
  }
  //from center.....
  void drawTrapezoid(float x, float y, float w, float h, float shrink, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    quad(-w/2, -h/2, w/2, shrink * -h/2, w/2, shrink * h/2, -w/2, h/2 );
    popMatrix();
  }


  //D (half circle w/ line, sz is ellipse sz
  void drawD(float x, float y, float a, float sz, float stretch) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    arc(0, 0, sz * stretch, sz, -PI/2, PI/2);
    line(0, -sz/2-currentStrokeWeight/2, 0, sz/2+currentStrokeWeight/2);
    popMatrix();
  }


  void drawK(float x, float y, float sz) {
    pushMatrix();
    translate(x, y);
    line(-sz, -sz, -sz, sz);
    line(sz, -sz, -sz, 0);
    line(sz, sz, -sz, 0);     
    popMatrix();
  }

  void drawA(float x, float y, float sz) {
    pushMatrix();
    translate(x, y);
    line(-sz, sz, 0, -sz);
    line(sz, sz, 0, -sz);
    line(-sz/2, sz/4, sz/2, sz/4);
    popMatrix();
  }

  void drawW(float x, float y, float sz) {
    pushMatrix();
    translate(x, y);
    line(-sz, -sz, -sz/2, sz);
    line(-sz/2, sz, -sz/2, sz);
    line(-sz/2, sz, 0, -sz);
    line(0, -sz, sz/2, sz);
    line(sz/2, sz, sz, -sz);
    popMatrix();
  }

  void drawC(float x, float y, float a, 
  float sz, float stretch, float extraangle) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    arc(0, 0, sz * stretch, sz, PI*.25 - extraangle, PI*1.75 + extraangle);    
    popMatrix();
  }
  void drawCFromTop(float x, float y, float a, float sz, float stretch, float extraangle) {
    drawCFrom(false, x, y, a, sz, stretch, extraangle);
  }
  void drawCFromBot(float x, float y, float a, float sz, float stretch, float extraangle) {
    drawCFrom(true, x, y, a, sz, stretch, extraangle);
  }

  void drawCFrom(boolean bot, float x, float y, float a, float sz, 
  float stretch, float extraangle) {
    pushMatrix();
    translate(x, y);  
    rotate(a);
    drawC(0, sz/2 * (bot?-1:1), 0, sz, stretch, extraangle);
    popMatrix();
  }

  void drawReverseC(float x, float y, float a, 
  float sz, float stretch, float extraangle) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    arc(0, 0, sz * stretch, sz, PI+ PI*.25 - extraangle, PI+ PI*1.75 + extraangle);    
    popMatrix();
  }


  void drawU(float x, float y, float a, float sz, 
  float stretch, boolean close) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    arc(0, 0, sz * stretch, sz, 0, PI);
    if (close)line(stretch * -sz/2, 0, stretch* sz/2, 0);
    popMatrix();
  }

  void drawCircle(float x, float y, float sz, float stretch) {
    ellipse(x, y, sz*stretch, sz);
  }

  void drawCircle(float x, float y, float sz) {
    ellipse(x, y, sz, sz);
  }

  void drawMFromBase(float x, float y, float a, float sz, float tall) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    drawM(-sz/2, 0, -sz/4, -sz*tall, 0, 0, sz/4, -sz*tall, sz/2, 0);
    popMatrix();
  }

  void drawM(float x1, float y1, 
  float x2, float y2, 
  float x3, float y3, 
  float x4, float y4, 
  float x5, float y5) {
    line(x1, y1, x2, y2);
    line(x2, y2, x3, y3);
    line(x3, y3, x4, y4);
    line(x4, y4, x5, y5);
  }
  void drawTriangle(float x, float y, float a, float sz) {
    pushMatrix();
    translate(x, y);
    rotate(a); 
    triangle(-sz, 0, -sz, sz, sz, sz);
    popMatrix();
  }
  void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    pushMatrix();
    translate(x, y);
    rotate(a); 
    triangle(-sz, 0, sz, 0, 0, -sz*tall);
    popMatrix();
  }
  void drawTriangleFromCorner(float x, float y, 
  float a, float sz, float scale) {
    pushMatrix();
    translate(x, y);
    rotate(a); 
    triangle(0, 0, -sz, sz*scale, sz, sz*scale);
    popMatrix();
  }
  void drawTriangleFromPoints(float x1, float y1, 
  float x2, float y2, float x3, float y3) {
    triangle(x1, y1, x2, y2, x3, y3);
  } 

  //draw from point of V
  void drawV(float x, float y, float sz, float ang, float angApart) {
    pushMatrix();
    translate(x, y);
    float x1 = sz * vXatAngle(PI+ang, angApart, true);
    float y1 = sz * vYatAngle(PI+ang, angApart, true);
    float x2 = sz * vXatAngle(PI+ang, angApart, false);
    float y2 = sz * vYatAngle(PI+ang, angApart, false);
    line(0, 0, x1, y1);
    line(0, 0, x2, y2);

    popMatrix();
  }

  //draw from point of V
  void drawVFillMedStroke(float x, float y, float sz, 
  float ang, float angApart, color c) {
    pushMatrix();
    translate(x, y);
    float x1 = sz * vXatAngle(PI+ang, angApart, true);
    float y1 = sz * vYatAngle(PI+ang, angApart, true);
    float x2 = sz * vXatAngle(PI+ang, angApart, false);
    float y2 = sz * vYatAngle(PI+ang, angApart, false);

    noStroke();
    fill(WHITE);
    triangle(0, 0, x1, y1, x2, y2);
    strokeMed();
    stroke(c);
    line(0, 0, x1, y1);
    line(0, 0, x2, y2);

    popMatrix();
  }

  //draw from point of V
  void drawVViaRects(float x, float y, float sz, float ang, float w) {

    pushMatrix();
    translate(x, y);
    rotate(-PI/2 + ang);
    rotate(PI /4);
    rect(w/2, -w/2, sz, w);
    rotate(-PI/2);
    rect(w/2, -w/2, sz, w);

    popMatrix();
  }

  float vXatAngle(float ang, float angApart, boolean reverse) {
    float mul = 1; 
    if (reverse) mul *= -1;
    return cos(PI/2 + ang + mul * angApart);
  }
  float vYatAngle(float ang, float angApart, boolean reverse) {
    float mul = 1; 
    if (reverse) mul *= -1;
    return sin(PI/2 + ang + mul * angApart);
  }

  void drawVByPoints(float x1, float y1, 
  float x2, float y2, 
  float x3, float y3) {
    line(x1, y1, x2, y2);
    line(x3, y3, x2, y2);
  }


  void draw3(float x, float y, float ang, float sz) {
    pushMatrix();
    translate(x, y);
    rotate(ang);
    arc(0, -sz/2, sz, sz, -PI*.75, PI/2);
    arc(0, sz/2, sz, sz, -PI*.5, PI*.75);
    popMatrix();
  }
  void drawBirdTrack(float x, float y, float sz, float a, float apart) {



    pushMatrix();

    translate(x, y + antizerod(10)); //magic

    rotate(a);
    line(0, 0, -sz/2 * apart, -sz);
    line(0, 0, 0, -sz);    
    line(0, 0, sz/2*apart, -sz);
    popMatrix();
  }

  void drawY(float x, float y, float sz, float a, float apart) {



    pushMatrix();

    translate(x, y); //magic

    rotate(a);
    line(0, 0, -sz/2 * apart, -sz/2);
    line(0, 0, 0, sz/2);    
    line(0, 0, sz/2*apart, -sz/2);
    popMatrix();
  }

  void drawYFromBase(float x, float y, float sz, float a, float apart) {



    pushMatrix();

    translate(x, y); //magic

    rotate(a);
    line(0, 0, 0, -sz/2);    
    line(0, -sz/2, -sz/2 * apart, -sz);
    line(0, -sz/2, sz/2*apart, -sz);
    popMatrix();
  }

  void drawSpiral(float x, float y, float a, float sz, float undo) {
    drawSpiral( x, y, a, sz, undo, 1);
  }
  void drawSpiral(float x, float y, float a, float sz, float undo, float dir) {

    pushMatrix();


    translate(x, y);
    x = cos(a)*sz*.3;
    y = sin(a)*sz*.3;
    beginShape();
    vertex(0, 0);
    vertex(x, y);
    float da = .1 * (1-undo);
    for (int i = 0; i < 30; i++) {
      float oldx = x;
      float oldy = y;

      a -= da * dir;
      da += .01 * (1-undo)  ;
      x += sz*.08*cos(a);
      y += sz*.08*sin(a); 


      vertex(x, y);
    }

    endShape();

    popMatrix();
  }

  float drawSine(float x1, float ybase, float ang, float size, 
  float startseed, float endseed, 
  int steps, float yscale) {
    pushMatrix();
    translate(x1, ybase);
    rotate(ang);
    float lastx, lasty;
    float seed = startseed;
    float x = -size/2;

    beginShape();

    for (int i = 0; i < steps ; i++) {
      x += size / steps;
      float y =sin(seed) * yscale;
      vertex(x, y);
      seed += (endseed -startseed) / steps;
    }
    endShape();

    popMatrix();

    while (seed > PI * 2) {
      seed -= PI * 2;
    }

    return seed;
  }



  //i guess x, y is middle of j
  void drawJ(float x, float y, float ang, float sz, 
  float lineMul, float extraAng) {
    pushMatrix();
    translate(x, y);
    rotate(ang);
    arc(0, 0, sz, sz, 0, PI + extraAng);
    line(sz/2, 0, sz/2, -sz);
    popMatrix();
  }
  void drawFlipJ(float x, float y, float ang, float sz, 
  float lineMul, float extraAng, float unflip) {
    extraAng *= 1 - unflip;
    unflip = map(unflip, 0, 1, 1, -1);

    pushMatrix();
    translate(x, y);
    rotate(ang);
    arc(0, 0, abs(sz*unflip), sz, -extraAng, PI );
    line(-sz/2 * unflip, 0, -sz/2 * unflip, -sz);
    popMatrix();
  }


  void drawS(float x, float y, float ang, float sz) {
    drawSComplex(x, y, ang, sz, 0, 0, 1);
  }

  void drawSComplexTopCircle(float x, float y, float ang, float sz) {
    pushMatrix();
    translate(x, y);
    rotate(ang);
    ellipse(0, -sz/2, sz, sz);
    popMatrix();
  }

  void drawSComplex(float x, float y, float ang, float sz, 
  float angleCheat1, float angleCheat2, float scaleBottomCircle) {
    pushMatrix();
    translate(x, y);
    rotate(ang);    
    arc(0, -sz/2, sz, sz, PI*.5, PI*(1.8+angleCheat1) );

    arc(0, (sz*scaleBottomCircle)/2, 
    sz*scaleBottomCircle, sz * scaleBottomCircle, 
    -PI*.5, PI*(.8+angleCheat2));
    popMatrix();
  }

  void drawSquare(float x, float y, float w, float h) {
    rectMode(CORNER);
    rect(x, y, w, h);
  } 
  void drawSquareCentered(float x, float y, float w, float h) {
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w, h);
  }
  void drawSquareCenteredAngled(float x, float y, float w, float h, float a) {
    pushMatrix();
    rectMode(CORNER);
    translate(x, y);
    rotate(a);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }  
  void drawTriangleInSquareCentered(float x, float y, float w, float h, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    triangle(-w/2, -h/2, +w/2, -h/2, -w/2, +h/2);

    popMatrix();
  }

  //this should be adapated if outlines or transparency is important
  void drawL(float x, float y, float sz) {
    float h = sz, w = sz; 
    rectMode(CORNER);
    rect(x, y, w/2, h);
    rect(x, y+h/2, w, h/2);
  }
  void drawLBottomCorner(float x, float y, float sz) {
    float h = sz, w = sz; 
    rectMode(CORNER);
    rect(x, y, w, h/2);
    rect(x+w/2, y, w/2, h);
  }
}




color WHITE = color(255);
color LITEGREEN = color(128, 225, 128);
color GREEN = color(128, 225, 128);
color BLACK = color(1, 1, 1);
color PINK = color(255, 128, 128);
color RED = color(200, 64, 64);
color ORANGE = color(255, 128, 0);
color TAN = color(255, 200, 100);
color BROWN = color(200, 125, 60);
color GRAY = color(200);

color[] mainColors = 
{
  GREEN, PINK, ORANGE, TAN, BROWN
};
class Keeper {
  float scaleKey = .5;
  float scaleX; //-1 to 1, x cursor
  float scaleY; //-1 to 1, y cursor
  float scaleBut = 0; //0 to 1 how pressed the button is
  int mode; //APART


  boolean virgin = true;

  float  along = 0;
  float SZ = 500;

  float avg(float a, float b) {
    return avgHelper(a, b, along);
  }
  float avgHelper(float a, float b, float zeroToOne) {
    return (a * (1.0 - zeroToOne) + (b * zeroToOne) );
  }


  boolean zooming = false;
  boolean unzooming = false;
  void adv() {
    if (!virgin) {
      if (zooming) {
        float val = 1.0 - along;
        val *= .95;
        along = 1.0 - val;
      }  
      if (unzooming) {
        along *= .95;
      }
    } 
    if (k.mousePressed()) {
      float alt = 1.0 - scaleBut;
      alt *= .95;
      scaleBut = 1.0 - alt;
    } 
    else {
      scaleBut *= .95;
    }
  }
  void adjustMouse() {
    scaleX = map(mouseX, 0, 500, -1, 1);
    scaleY = map(mouseY, 0, 500, -1, 1);
  }
  void draw() {
    strokeWeight(2);
    if (mousePressed) {
      fill(0);
    } 
    else {
      fill(255);
    }
    stroke(2);
    //  rect(20, 20, 40, 40);
    line(80, 25, map(along, 0, 1, 80, 420), 25);      
    line(80, 35, map(scaleX, -1, 1, 80, 420), 35);      
    line(80, 45, map(scaleY, -1, 1, 80, 420), 45);
    line(80, 55, map(scaleBut, 0, 1, 80, 420), 55);

    drawButton();
  }

  float goButtonX = 250;
  float goButtonY = 200;
  float buttonInitialOver = 1;
  boolean everClicked = false;
  boolean overButton() {
    return dist(mouseX, mouseY, goButtonX, goButtonY) < 35;
  }
  
  boolean isMousePressed = false;
  boolean mousePressed(){
    return isMousePressed && !k.virgin;
  }
  
  void recordMousePressed() {
    if (overButton()) {
      if (k.virgin) {
        k.virgin = false;
        k.zooming = true;
      } 
      else {        
        k.zooming = !k.zooming;
        k.unzooming = !k.unzooming;
      }
    } else {
      isMousePressed = true;
    }
  }
  
  void recordMouseReleased(){
      isMousePressed = false;
      everClicked = true;
      if(k.virgin){
          k.virgin = false;
          k.zooming = true;
      }
      
  }
  
  void drawButton() {

    if (everClicked) buttonInitialOver /= 1.05;

    goButtonX = avgHelper(40, 250, buttonInitialOver);
    goButtonY = avgHelper(40, 200, buttonInitialOver);

    pushMatrix();
    translate(goButtonX, goButtonY);
    if (overButton()) {
      fill(255); 
      stroke(0);
    } 
    else {
      fill(0);
      stroke(255);
    }
    ellipse(0, 0, 70 , 70);

    translate(-12, 0);    

    //top of G - or top of arrow /
    line(figButX(-1, -1), figButY(-1, 0), figButX(1, 0), figButY(-1, -.5));
    //back of G | or arrow left -
    line(figButX(-1, -1), figButY(-1, 0), figButX(-1, -1), figButY(1, 0));
    //mid g - mid arrow -
    line(figButX(0, -1), figButY(0, 0), figButX(1, .5), figButY(0, 0));
    //chin of g | or right arrow -
    line(figButX(1, .5), figButY(0, 0), figButX(1, 1), figButY(1, 0));
    //bottom of g or bot of arrow \
    line(figButX(-1, -1), figButY(1, 0), figButX(1, 0), figButY(1, .5));

    translate(24, 0);   

    //top of O - or top of arrow \
    line(figButX(-1, 0), figButY(-1, -.5), figButX(1, 1), figButY(-1, -0));
    //left of O
    line(figButX(-1, 0), figButY(-1, -.5), figButX(-1, 0), figButY(1, -.5));
    //right of O
    line(figButX(1, -1), figButY(-1, 0), figButX(1, 1), figButY(1, 0));
    //bottom of O 
    line(figButX(-1, 0), figButY(1, .5), figButX(1, 1), figButY(1, 0));



    popMatrix();
  }
  float figButX(float val, float val2) {
    return 8 * avg(val, val2);
  }
  float figButY(float val, float val2) {
    return 16 * avg(val, val2);
  }
}





void mousePressed() {
  k.recordMousePressed();
}
void mouseReleased() {
  k.recordMouseReleased();
}



void mouseMoved() {
  k.adjustMouse();
}
void mouseDragged() {
  k.adjustMouse();
}

float m, n;
int allTimeMaxPlace = 0;

