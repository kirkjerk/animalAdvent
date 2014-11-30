int BASECOUNT = 62; //dragon

Dragon d = new Dragon();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  d.draw();
  k.draw();
  k.adv();
}


class Smoke {
   float x,y,xs,ys;
   float r ;
   Dragon d;
   Smoke(Dragon pd){
      d = pd;
      
    //  float m = k.scaleY; println(m);
      
      float myScale = random(4,6);
      /*
      pushMatrix();
      translate(d.x + d.BASE * .656 , d.y +  d.BASE * -.576 );
      line(0,0,d.fireScale * cos(d.fireAngle -PI/2) * d.BASE * d.fireBase,d.fireScale * sin(d.fireAngle -PI/2) * d.BASE * d.fireBase);
      popMatrix();
      
      */
   
float nd = d.BASE* .368;
float na = -.124;
if(random(1) < .5){
  nd = d.BASE * .432;
  na = -0.044;
}
 x = d.x + d.zerod(d.BASE*.644) +  nd * cos(d.headAngle  + na);
 y = d.y + d.zerod(d.BASE*-.54)+   nd * sin(d.headAngle  + na);

  // line(d.x + d.zerod(d.BASE*.644), d.y + d.zerod(d.BASE*-.54),x,y);

      //println(x);
      r = d.BASE * random(.05,.06);
      //line(0,0,x,y);
      
      float mul = d.BASE*.04;
      
      float a = -PI/2 + random(-.1,.1);
      xs = mul *cos(a)/2;
      ys = mul * sin(a)/4;
   }
   
   boolean move(){
      x += xs;
     y += ys;
    // ys += .1;
    if(y  < -r * 2) {
      
      return false;
    }
   return true; 
   }
   void draw(){
     
 // r *= 1.02;
 
     d.drawCircle(d.figX(d.placeForSmokes,x),d.figY(d.placeForSmokes,y),d.avgd(10,r));
     d.placeForSmokes++;
   }
}



class Dragon extends Animal {
  float x, y;
  float ang;
  float mv;
  
  int placeForSmokes;
   float fireX = .656;
  float fireY = -.576;
  float fireBase = .1;
  float fireAngle = 1.75;
 float fireScale; 
 float headAngle;
  ArrayList<Smoke> smokes = new ArrayList<Smoke>();
  Dragon() {
    super();
    BASE = 180;
    smallStrokeWeight = BASE/100;
    basicStrokeWeight = BASE/60;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 200; 
    y = 250;

    ang = 0;
    mv = 0;
  }


  void draw() { 
    
    //noLoop();
    super.draw();

    pushMatrix();
    translate(zerod(x-BASE*.5), zerod(y));
    //rotate(k.scaleX);
    translate(zerod(BASE*.5),0);
    strokeMin();
    

placeForSmokes = 63;
 fireScale = random(3,8);
    if(k.mousePressed()){
      
      
      drawFire(placeForSmokes++,fireScale);
      
    }
fill(GREEN); 
    stroke(GREEN);
    drawBody(1, 2, 3, 4, 5, 6, 8, 61);
    drawTailSpike(7);
    drawMouthTop(9, 14, 19,31,47);
    drawLegs(10,32,49);
    
    drawBackSpikes(36);    
    drawWings(27,29);

    
    
        popMatrix();

    stroke(BLACK);
    fill(BLACK);
       
    ArrayList<Smoke> smokesToKill = new ArrayList<Smoke>();
    for(Smoke d : smokes){
      if(!d.move()){
         smokesToKill.add(d); 
      }
      d.draw(); 
    }
    smokes.removeAll(smokesToKill);
    //if(random(1) < k.scaleBut){
      
       if(k.mousePressed())smokes.add(new Smoke(this)); 
    
  }
  

  void drawFire(int place, float sz){
    stroke(ORANGE);
    fill(ORANGE);
    
    
    //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(place,BASE*fireX) , figY(place,BASE*fireY)+antizerod(6), zerod(fireAngle), avgd(8,BASE*fireBase), avgd(2,sz)) ;
  }
  
  void drawWings(int place1, int place2){
    // void drawC(float x, float y, float a, 
  //float sz, float stretch, float extraangle) {
    
    float a = map(k.scaleX,-1,1,-1.5,0);
    
    stroke(BLACK);
    fill(BLACK,zerod(255));
    //
   // line(0,0,BASE*m,BASE*n);
    pushMatrix();
    translate(zerod(BASE*.12),zerod(BASE*-0.476));
   // line(0,0,0,200);
    rotate(zerod(a));
    float x = .056; float y = -.104;
    
    drawC(figX(place1, BASE*x),figY(place1, BASE*y), zerod(PI),
    avgd(12 ,BASE*.25),.7,zerod(-.25));
    drawMWithCenter(figX(place1+1, BASE*x),figY(place1+1, BASE*y)- antizerod(8), zerod(PI/2), avgd(15,BASE*-.228), avgd(15,BASE*.056),BLACK );
    //drawMWithCenter(float x, float y, float a, float w, float h){
   
     popMatrix();
    pushMatrix();
    translate(zerod(BASE*-.048),zerod(BASE*-.496));
  //  line(0,0,0,200);
    rotate(zerod(a));  
       x = .048 ; y = -.108;
      stroke(BLACK);
    drawC(figX(place2, BASE*x),figY(place2, BASE*y), zerod(PI),
    avgd(12 ,BASE*.25),.7,zerod(-.25));
    drawMWithCenter(figX(place2+1, BASE*x),figY(place2+1, BASE*y)- antizerod(8), zerod(PI/2), avgd(15,BASE*-.228), avgd(15,BASE*.056),BLACK );
 
   popMatrix();
    
    
  }
  
  
  void drawBackSpikes(int place){
    
    
    fill(GREEN);
    stroke(GREEN);
    
    //tail
drawSpike(place++,BASE*-0.8249999,BASE*-0.13599998,PI*-0.099999994);
drawSpike(place++,BASE*-0.69,BASE*-0.25199997,PI*-0.25);

drawSpike(place++,BASE*-0.55,BASE*-0.352,PI*-0.2);


//body    
    drawSpike(place++,BASE*-.3,BASE*-.396,PI*-.22);
    drawSpike(place++,BASE*-.185,BASE*-.468,PI*-.1);
    drawSpike(place++,BASE*.06,BASE*-.488,PI*0.05);
    drawSpike(place++,BASE*.3,BASE*-.396,PI*.22);
drawSpike(place++,BASE*0.42500004,BASE*-0.264,PI*0.35000002);
//neck
drawSpike(place++,BASE*0.615,BASE*-0.19199997,PI*-0.65000004);
drawSpike(place++,BASE*0.485,BASE*-0.412,PI*-0.70000005);
drawSpike(place++,BASE*0.46000004,BASE*-0.532,PI*-0.3);

    //drawSpike(place++,BASE*m,BASE*n,PI*k.scaleKey);
  }
  void drawSpike(int place, float x, float y, float a){
    //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
      drawTriangleFromBase(figX(place, x),figY(place,y)+antizerod(8),zerod(a),avgd(8,BASE*.03),avgd(2,3));
  }
  

  void drawClaw(int place, float x, float y, float a){
// void drawC(float x, float y, float a, float sz, float stretch, float extraangle) {
  stroke(GREEN);
  noFill();
    drawC(figX(place,x),figY(place,y),zerod(PI*a),avgd(15,BASE*.1),avgd(1,.66),avgd(0,-PI*.25));
  }
  
  
  void drawMWithCenter(float x, float y, float a, float w, float h, color c){
    noFill();
    stroke(c);
    pushMatrix();
    translate(x,y);
    rotate(a );
    line(-w/2,h,-w/4,0);
    line(-w/4,0,0,h);
    line(0,h,w/4,0);
    line(w/4,0,w/2,h);
    
    stroke(c, zerod(255));
    fill(c, zerod(255));
    quad(-w/4,0,0,-h/2,w/4,0,0,h);
    
    
    popMatrix();
  }
  

  
  void drawLegs(int placeLegs, int placeShins, int placeClaws) {
    stroke(GREEN);
    
    //drawLeg(placeLegs++,-.436);
    //  drawLeg(placeLegs++,-.232);
    drawLeg(placeLegs++,placeShins++,placeClaws, -.412,.25);
    drawLeg(placeLegs++,placeShins++,placeClaws+3, -.196,-.25);
    drawLeg(placeLegs++, placeShins++,placeClaws+6,.228,-.5);
    drawLeg(placeLegs++,placeShins++,placeClaws+9, .444,.5);
    
   // drawClaws(placeClaws);
  }
  void drawLeg(int placeLeg, int placeShin, int placeClaws, float x, float dir) {
    //drawTriangleFromBase(float x, float y, float a, float sz, float tall) { 
      fill(GREEN);
    drawTriangleFromBase(figX(placeLeg, BASE*x), 
                          figY(placeLeg, BASE*-0.032)+antizerod(8), 
                            zerod(PI), avgd(8, BASE*.13), 1.5);
    pushMatrix();
    translate(zerod(BASE*x),zerod(BASE*.168));
    rotate(zerod(PI/4 + PI*k.scaleY*dir));
   
    drawLineFromEndpoint(figX(placeShin,0),figY(placeShin,0)-antizerod(8),antizerod(PI/2),avgd(16,BASE*.175));
    //drawClaw(int place, float x, float y, float a){
    
      drawClaw(placeClaws,BASE*.228,0,PI * .136 );
      
     drawClaw(placeClaws+1,BASE*.216,BASE*.036,PI * .848 );

     drawClaw(placeClaws+2,BASE*.184,BASE*.056,PI * .28 );
    
    
    popMatrix();
    
    
  }

  void drawTailSpike(int place) {
    fill(GREEN);
    stroke(GREEN);
    strokeMin();

    //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(place, BASE*-.972), 
    figY(place, BASE*-0.228)+antizerod(8), zerod(PI*.056), 
    avgd(8, BASE*0.076), 2);
  }

  void drawMouthTop(int placeTopJaw, int placeTeeth,
  int placeOther, int placeBrow, int placePupils) {

    //stroke(BLACK);
    pushMatrix();

    translate(zerod(BASE*.644), zerod(BASE*-.54));
    headAngle = map(constrain(k.scaleY,-1,.8),-1,1,-1,0);
    rotate(zerod(headAngle));
    drawTriangleFromPoints(figX(placeTopJaw, 0) +antizerod(4), figY(placeTopJaw, 0)+antizerod(4), 
    figX(placeTopJaw, BASE*.392), figY(placeTopJaw, 0)-antizerod(6), 
    figX(placeTopJaw, BASE*0)-antizerod(4), figY(placeTopJaw, BASE*-.148)+antizerod(4));

    stroke(BLACK);
    //void drawV(float x, float y, float sz, float ang, float angApart) {
    drawV(figX(placeTeeth, BASE*.316), figY(placeTeeth, BASE*.104)+antizerod(8), avgd(15, BASE*.1), 0, .25);
    placeTeeth++;
    drawV(figX(placeTeeth, BASE*.388), figY(placeTeeth, BASE*.104)+antizerod(8), avgd(15, BASE*.1), 0, .25);
    placeTeeth++;

    line(figX(placeTeeth, BASE*.18), figY(placeTeeth, BASE*.008) - antizerod(8), 
    figX(placeTeeth, BASE*.18), figY(placeTeeth, BASE*.056)+ antizerod(8));
    placeTeeth++;

    line(figX(placeTeeth, BASE*.216), figY(placeTeeth, BASE*.008)- antizerod(8), 
    figX(placeTeeth, BASE*.216), figY(placeTeeth, BASE*.056)+ antizerod(8));
    placeTeeth++;

    line(figX(placeTeeth, BASE*.26), figY(placeTeeth, BASE*.008)- antizerod(8), 
    figX(placeTeeth, BASE*.26), figY(placeTeeth, BASE*.056)+ antizerod(8));
    placeTeeth++;

    
    //EYES
    noStroke();
    fill(ORANGE);
    drawCircle(figX(placeOther, BASE*.088), figY(placeOther, BASE*-0.148), avgd(10, BASE*.065));
    placeOther++;
    drawCircle(figX(placeOther, BASE*.164), figY(placeOther, BASE*-.124), avgd(10, BASE*.065));
    placeOther++;
    noFill();
    stroke(GREEN);
    drawCircle(figX(placeOther, BASE*0.36), figY(placeOther, BASE*-0.044), avgd(10, BASE*.045));
    placeOther++;
    drawCircle(figX(placeOther, BASE*.42), figY(placeOther, BASE*-.012), avgd(10, BASE*.042));
    placeOther++;

    noStroke();
    fill(BLACK);
    drawCircle(figX(placePupils, BASE*.088), figY(placePupils, BASE*-0.148), avgd(6, BASE*.032));
    placePupils++;
    drawCircle(figX(placePupils, BASE*.164), figY(placePupils, BASE*-.124), avgd(6, BASE*.032));
    placePupils++;

    strokeMin();

    singleS(avgd(20, BASE*.15), avgd(8, BASE*.06), avgd(PI*-.332, PI*-.688), 
    figX(placeOther, BASE*.004) - antizerod(4), figY(placeOther, BASE*-0.144) +antizerod(8), GREEN, 0, .7, 1);
    placeOther++;
    //stroke(BLACK);
    line(figX(placeOther, BASE*-.104), figY(placeOther, BASE*-.204)-antizerod(8), figX(placeOther, BASE*.02), figY(placeOther, BASE*-.148)+antizerod(8));
    placeOther++;

    float curve = zerod(.512);

    singleS(avgd(20, BASE*.125), avgd(8, BASE*.05), avgd(PI*-.332, PI*-.188), 
    figX(placeOther, BASE*.172) - antizerod(4), figY(placeOther, BASE*-.028) +antizerod(8), GREEN, curve, curve+.7, curve+1);
    placeOther++;
    
     //stroke(BLACK);
    line(figX(placeOther, BASE*.224), figY(placeOther, BASE*-.068)-antizerod(8), figX(placeOther, BASE*.336), figY(placeOther, BASE*-.076)+antizerod(8));
    placeOther++;

    //eyebrows
//drawV(float x, float y, float sz, float ang, float angApart) {
  stroke(BLACK);
  
    drawV(figX(placeBrow, BASE*.124), figY(placeBrow, BASE*-0.132)+antizerod(7), avgd(15,BASE*.1),zerod(.276),avgd(.4,.6));


    popMatrix();
  }

  void drawBody(int place, int placeTail1, int placeTail2, 
  int placeNeck1, int placeNeck2, int placeJaw, int placeJawLine, int placeTeeth) {
    //void drawD(float x, float y, float a, float sz, float stretch) {
    fill(GREEN, zerod(255));
    drawD(figX(place, 0), figY(place, 0), zerod(-PI/2), avgd(15, BASE), 1); 
    noFill();
    //tail


    doubleS(avgd(20, BASE*.5), avgd(8, BASE*.2), zerod(BASE * .3), avgd(PI*-.332, PI*-.816), 
    figX(placeTail1, BASE*-.54) - antizerod(4), figY(placeTail1, 0) +antizerod(8), 
    figX(placeTail2, BASE*-.54)- antizerod(4), figY(placeTail2, 0)+antizerod(8), GREEN);

//neck
    doubleS(avgd(20, BASE*.5), avgd(8, BASE*.2), zerod(BASE * .4), avgd(PI*-.332, PI*-.3), 
    figX(placeNeck1, BASE*.4) - antizerod(4), figY(placeNeck1, BASE*-.12) +antizerod(8), 
    figX(placeNeck2, BASE*.4)- antizerod(4), figY(placeNeck2, BASE*-.12)+antizerod(8), GREEN);

    singleS(avgd(20, BASE*.25), avgd(8, BASE*.1), avgd(PI*-.332, PI*.388), 
    figX(placeJaw, BASE*.668) - antizerod(4), figY(placeJaw, BASE*-0.54) +antizerod(8), GREEN, 0, .7, 1);

    line(figX(placeJawLine, BASE*.832), figY(placeJawLine, BASE*-0.396)-antizerod(8), 
    figX(placeJawLine, BASE*.656), figY(placeJawLine, BASE*-0.54)+antizerod(8));

stroke(BLACK);
strokeMin();

drawLine(figX(placeTeeth, BASE*.784),  figY(placeTeeth, BASE*-.476), zerod(PI*.264), BASE*.05) ;
placeTeeth++;
drawLine(figX(placeTeeth, BASE*.824),  figY(placeTeeth, BASE*-.444), zerod(PI*.264), BASE*.05) ;
placeTeeth++;


  }
  // 0, .7, 1.0

  void singleS(float stretchOut, float stretchUp, float ang, float x1, float y1, color c, float startCurve, float midCurve, float endCurve ) {
    //,
    //  println(ang); 
    pushMatrix();
    translate(x1, y1);
    rotate(ang);
    fill(GREEN, zerod(255)); //hardcode :-(
    stroke(c);
    strokeMed();
    beginShape();
    float step = .04;

    for (float i = startCurve; i <= midCurve; i += step ) { //hardcode ;-)
      vertex(doubleSxHelper(i, stretchOut), doubleSyHelper(i, stretchUp));
    }
    endShape();
    noFill();
    beginShape();
    for (float i = startCurve; i <= endCurve; i += step ) {
      vertex(doubleSxHelper(i, stretchOut), doubleSyHelper(i, stretchUp));
    }
    endShape();    
    popMatrix();
  }


  void doubleS(float stretchOut, float stretchUp, float stretchThick, float ang, 
  float x1, float y1, float x2, float y2, color c) {



    pushMatrix();
    translate(x1, y1);
    rotate(ang);
    /*
    //arrow
     line(0, 0, stretchOut, 0);
     line(stretchOut, 0, stretchOut*.8, stretchOut*.2);
     line(stretchOut, 0, stretchOut*.8, stretchOut*-.2);*/
    noFill();
    stroke(c);
    strokeMed();
    float step = .04;
    //first S
    beginShape();
    for (float i = 0; i <= 1.0; i += step ) {
      vertex(doubleSxHelper(i, stretchOut), doubleSyHelper(i, stretchUp));
    }
    endShape();
    strokeMin();
    fill(c, zerod(255));
    stroke(c, zerod(255));

    for (float i = 0; i <= 1.0 - step; i += step ) {
      float xa = doubleSxHelper(i, stretchOut);
      float ya1 = doubleSyHelper(i, stretchUp); 
      float ya2 =ya1 + doubleSthickHelper(i, stretchThick);

      float xb = doubleSxHelper(i + step, stretchOut);
      float yb1 = doubleSyHelper(i + step, stretchUp); 
      float yb2 = yb1 + doubleSthickHelper(i + step, stretchThick);

      quad(xa, ya1, xa, ya2, xb, yb2, xb, yb1);
    }
    popMatrix();

    strokeMed();
    stroke(c);
    noFill(); 

    pushMatrix();
    translate(x2, y2);
    rotate(ang);
    //second S
    beginShape();

    for (float i = 0; i <= 1.0; i += step ) {
      vertex(doubleSxHelper(i, stretchOut), 
      doubleSyHelper(i, stretchUp) + doubleSthickHelper(i, stretchThick));
    }
    endShape();
    popMatrix();
  }
  float doubleSxHelper(float i, float stretchOut) {
    return  i * stretchOut;
  }
  float doubleSyHelper(float i, float stretchUp) {
    return  sin(map(i, 0, 1, PI, PI*3)) * - stretchUp;
  }
  float doubleSthickHelper(float i, float stretchThick) {
    return map(i, 0, 1, stretchThick, 0);
  }
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
