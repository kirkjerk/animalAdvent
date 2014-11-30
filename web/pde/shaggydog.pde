int BASECOUNT = 13; //shaggydog

Shaggydog d = new Shaggydog();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);
}
void draw() {
  background(WHITE);
  d.draw();
  k.draw();
  k.adv();
}

class Scribline {
  float x1, y1;//, x2, y2;
  Scribline(float a, float b) {
    x1 = a; 
    y1 = b;

  } 
  void drawVertex(float w, float h){
    vertex(x1*w, y1*h);
  }
}
class ValPair {
  float x, y;
  ValPair(float px, float py) {
    x = px; 
    y = py;
  }
}


class Shaggydog extends Animal {
  float basex, basey;
  float ang;
  float mv;
  
  int numCorners = 10;
  ArrayList<Scribline> linesBody = null;
  ArrayList<Scribline> linesHead = null;
  ArrayList<Scribline> linesTail = null;
  ArrayList<Scribline> linesEar1 = null;
  ArrayList<Scribline> linesEar2 = null;

  ArrayList<Scribline> linesLeg1 = null;
  ArrayList<Scribline> linesLeg2 = null;
  ArrayList<Scribline> linesLeg3 = null;
  ArrayList<Scribline> linesLeg4 = null;
  float tailMove = 0;
  ArrayList <ValPair> sinVals = new ArrayList<ValPair>();
  float recalcChance = .01;
  Shaggydog() {

    super();
    //cache some sin values

    for (int i = 1; i < numCorners+2; i++) {
      float y = map(i, 0, numCorners, 0, 1.0); 
      float a = map(y, 0, 1, 0, PI);
      float x = sin(a);
      sinVals.add(new ValPair(x, y));
    }


    BASE = 175;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/35;
    heavyStrokeWeight = BASE/20;
    PIECECOUNT = 20;
    basex = 250; 
    basey = 225;

    ang = 0;
    mv = 0;
  }


  void draw() { 
    
    super.draw();

    float r = 0;

    pushMatrix();


    translate(zerod(basex), zerod(basey));



    strokeMin();
    stroke(TAN);
    drawBody(1);
    drawHead(2,8,10);
    stroke(TAN);
    drawTail(3);
    drawLegs(4);

    popMatrix();
  }
  int getLineCount(int lo, int hi){
    int res = round(avgd(lo,hi));
    if(res % 2 == 1) res++;
    return res;
  }
  boolean figureRecalc(ArrayList<Scribline> lines, int linesWanted ){
    return lines == null 
      || linesWanted * (numCorners+1) != lines.size()  
      ||  random(1) < recalcChance;
  }

  
  
  void drawBody(int place) {
    int lineCount =  getLineCount(8,45);
    if(figureRecalc(linesBody, lineCount)) linesBody = recalcScribbleBox(lineCount, 0);
    drawScribbleBox(linesBody, figX(place, 0), figY(place, 0), avgd(24, BASE), avgd(16, BASE*.5), 0);
  }

  void drawHead(int place, int placeEars, int placeOther){
    int lineCount =  getLineCount(6,16);
    
    pushMatrix();
    translate(zerod(BASE*.64),zerod(BASE*-.18));
    rotate(zerod(-PI*.06 + k.scaleX*.5));
    if(figureRecalc(linesHead, lineCount)) linesHead = recalcScribbleBox(lineCount, 0);
    drawScribbleBox(linesHead, figX(place, 0), figY(place, 0), avgd(16, BASE*.35), avgd(16, BASE*.5), 0);

    drawEars(placeEars);
    
    
    //nose
    fill(BLACK);
    stroke(BLACK);
    
    //  drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
        drawTriangleFromBase(figX(placeOther,0),figY(placeOther,0)+antizerod(6),zerod(-PI),avgd(8,BASE*.06),1.5);
        placeOther++;
    //eyes
    
      drawCircle(figX(placeOther,BASE*-.052),figY(placeOther,BASE*-.1),avgd(4,BASE*.02));
        placeOther++;
      drawCircle(figX(placeOther,BASE*.052),figY(placeOther,BASE*-.1),avgd(4,BASE*.02));
        placeOther++;
    //mouth
    //drawY(float x, float y, float sz, float a, float apart) {
    
      drawY(figX(placeOther,BASE*.004),figY(placeOther,BASE*.144), avgd(15,BASE*.1), zerod(-PI), 1);
      
    noFill();
    
    popMatrix();    
  }
    void drawEars(int place){
    //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
    
    float earTilt = k.scaleY*-.3;

      
    int lineCount =  getLineCount(4,8);
    if(figureRecalc(linesEar1, lineCount)) linesEar1 = recalcScribbleBox(lineCount, 0);
    drawScribbleBoxFromMidEdge(linesEar1, figX(place, -BASE*.144) , figY(place, BASE*-.228 ) - antizerod(8), avgd(12, BASE*.15), avgd(18, BASE*.4), zerod(PI* (.152)  + earTilt));    
    place++;
    if(figureRecalc(linesEar2, lineCount)) linesEar2 = recalcScribbleBox(lineCount, 0);
    drawScribbleBoxFromMidEdge(linesEar2, figX(place, BASE*.144) , figY(place, BASE*-.228 )- antizerod(8), avgd(12, BASE*.15), avgd(18, BASE*.4), zerod(-PI*.152 - earTilt));    
    
  }

  void drawTail(int place){
    int lineCount =  getLineCount(4,8);

    tailMove += k.scaleBut*.3;
    
    if(figureRecalc(linesTail, lineCount)) linesTail = recalcScribbleBox(lineCount, .4);
    drawScribbleBoxFromMidEdge(linesTail, figX(place, BASE*-.448) + antizerod(4), figY(place, BASE*-.192)- antizerod(8), avgd(12, BASE*.15), avgd(18, BASE*.5), zerod((PI*.8  ) + sin(tailMove)*.5  ));    
  }

  void drawLegs(int place){
   linesLeg1 =  drawLeg(place++,linesLeg1,1,-0.496 );
    linesLeg2 = drawLeg(place++,linesLeg2,-1, -0.216 );
    linesLeg3 = drawLeg(place++,linesLeg1,1, .216);
    linesLeg4 = drawLeg(place++,linesLeg2,-1, .476 );
     
  }
  ArrayList<Scribline> drawLeg(int place,ArrayList<Scribline> lines, float dir , float over){
    int lineCount =  getLineCount(4,8);
    float curve = dir * .2;
    float a = dir * .084;
    
    if(figureRecalc(lines, lineCount)) lines = recalcScribbleBox(lineCount, curve);
    drawScribbleBox(lines, figX(place, BASE*over) + antizerod(4), figY(place, BASE*.44), avgd(12, BASE*.15), avgd(18, BASE*.4), zerod(PI*a));    
    return lines;
  }
  


  //returns scribbles in a box, with x values going from x to 1

  ArrayList<Scribline> recalcScribbleBox(float numStrokes, float curve) {

    float w = 1.0; 
    float h = 1.0; 

    ArrayList<Scribline> lines = new ArrayList<Scribline>();
    float step = w / numStrokes;
    float wiggle = step / 4;

    boolean up = false;

      float oldXEnd = random(-wiggle, wiggle);

    for (int i = 0; i < numStrokes ; i++) {

      float xEnd = (i* step) + random(-wiggle, wiggle);


      for (ValPair sinVal : sinVals) {
        float x = lerp(oldXEnd, xEnd, sinVal.y) + sinVal.x * curve;
        float y = sinVal.y;
        if (up) {
          y = 1.0 - y;
        } 
        y = constrain(y,0,1.0);
        lines.add(new Scribline(x, y));
        
      }
      up = !up;
      oldXEnd = xEnd;
    }
    return lines;
  }


  void drawScribbleBoxFromMidEdge( ArrayList<Scribline> lines, float x, float y, float w, float h, float a) {
    pushMatrix();
    
    translate(x, y);
    rotate(a);
    translate(0,h/2);

    drawScribbleBox(lines,0,0,w,h,0);


    popMatrix();
  }

  void drawScribbleBox( ArrayList<Scribline> lines, float x, float y, float w, float h, float a) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    translate(-w/2, - h/2);
    beginShape();
    //  line(0,0,w,0);line(w,h,w,0);line(w,h,0,h);line(0,0,0,h);
    for (Scribline s : lines) {
      s.drawVertex(w, h);
    }
    endShape();

    popMatrix();
  }
}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
