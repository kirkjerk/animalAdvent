int BASECOUNT = 32; //gorilla

Gorilla g = new Gorilla();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
}
void draw() {
  background(WHITE);
  g.draw();
  k.draw();
  k.adv();
}



class Gorilla extends Animal {
  float x = 250, y = 250;
  Gorilla() {
    super();
    BASE = 180;
    smallStrokeWeight = BASE/50;
    basicStrokeWeight = BASE/40;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
  }


  void draw() {   
    super.draw(); 

    BASE = 180 *(( k.scaleBut*5)+1);
    y = 200 + 600*k.scaleBut;

    pushMatrix();
    if (true) {
      setStrokeWeight();
      translate(zerod( x), zerod( y));
      drawBody(1);

      pushMatrix();  //head
      if (true) {
        translate(zerod( 0), zerod( -BASE/2));
        rotate(zerod( k.scaleX*.5));
        float headSz =  BASE*.37;
        drawHeadAndEars(4, 2, 3, headSz);
        drawMouth(5, headSz);
        drawEyesAndNose(6, 7, 8, headSz);
        if(k.mousePressed()){
           drawEyebrows(33); 
        }
      }
      popMatrix();
      drawLimbs(9, 10, 11, 12, 13);
    }
    popMatrix();
  }
  void drawBody(int place) {
    stroke(TAN);
    fill(TAN, zerod( 255));
    drawSquareCentered(figX(place, 0), figY(place, 0), 
    avgd(10, BASE*.8), avgd(10, BASE));
  }
  void drawHeadAndEars(int placeHead, int placeEar1, int placeEar2, float headSz) {

    stroke(TAN);
    fill(WHITE);
    drawCircle(figX(placeHead, 0), figY(placeHead, 0), avgd(20, headSz));
    stroke(TAN, zerod(255));
    fill(TAN, zerod(255));
    drawD(figX(placeHead, 0), figY(placeHead, 0), PI*1.5, avgd(20, headSz), 1);
    stroke(TAN);
    fill(WHITE); 
    drawCircle(figX(placeEar1, -headSz*.63), figY(placeEar1, -headSz*.18), avgd(10, headSz*.3));
    drawCircle(figX(placeEar2, headSz*.63), figY(placeEar2, -headSz*.18), avgd(10, headSz*.3));
  }

  void drawMouth(int place, float headSz) {

    float mouthSz = headSz * .65;
    noFill();
    stroke(TAN);

    //drawU(float x, float y, float a, float sz, float stretch, boolean close) {
    drawU(figX(place, 0), figY(place, 0) - antizerod(6), 0, avgd(25, mouthSz), avgd(.5, 1), false);
    //drawCircle(figX(place,0),figY(place,0),mouthSz);
  }

  void drawEyesAndNose(int placeEye1, int placeEye2, int placeNose, float headSz) {
    noStroke();
    fill(BLACK);
    drawCircle(figX(placeEye1, -headSz*.15), figY(placeEye1, -headSz*.15), avgd(5, headSz/10), 1);
    drawCircle(figX(placeEye2, headSz*.15), figY(placeEye2, -headSz*.15), avgd(5, headSz/10), 1);


    drawCircle(figX(placeNose, 0), figY(placeNose, 0), avgd(10, headSz/10), avgd(1, 1.5));
  }
  void drawLimbs(int placeArm1, int placeArm2, int placeLeg1, int placeLeg2, int placeFinger) {
    placeFinger--;//for counting from 1 not 0


    setLightStrokeWeight();

    //LESSON SLOWLY LEARNING: THE TRANSLATE FOR THE WHOLE ARM 
    //CAN NOT INVOLVE THE "PLACE" OF THE L COMPONENT...

    fill(TAN); 
    noStroke();
    pushMatrix();
    translate(zerod(-BASE*.3), zerod(-BASE/2));
    rotate(zerod(PI/2 - map(k.scaleY, -1, 1, -.3, .3)));

    drawL(figX(placeArm1, 0) -antizerod(7), figY(placeArm1, 0) -antizerod(7), avgd(15, BASE / 2));

    noFill();
    stroke(TAN);
    pushMatrix();
    if (true) {//hand
      translate(zerod(BASE*.5), zerod(BASE*.36));
      rotate(zerod(-PI/2));


      drawC(figX(placeFinger+1, BASE*.15), figY(placeFinger+1, 0), zerod(PI *.712), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+2, BASE*-.170), figY(placeFinger+2, BASE*.028), zerod(PI * .244), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+3, BASE*-.1), figY(placeFinger+3, BASE*.028), zerod(PI * .208), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+4, BASE*-.05), figY(placeFinger+4, BASE*.028), zerod(PI * .188), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+5, BASE*.008), figY(placeFinger+5, BASE*.028), zerod(PI * .188), avgd(10, BASE*.1), .5, -.3);
    }
    popMatrix();
    popMatrix();



    fill(TAN); 
    noStroke();
    pushMatrix();
    translate(zerod(BASE*.3), zerod(-BASE/2));
    rotate(avgd(0, -map(k.scaleY, -1, 1, -.3, .3)));

    pushMatrix(); 
    if (true) { //for arm itself
      translate(figX(placeArm2, 0), figY(placeArm2, 0));
      translate (avgd(15, 0) -antizerod(7), avgd(15, 0) -antizerod(7)); //for bottom
      rotate(avgd(PI, 0));
      fill(TAN); 
      drawLBottomCorner(0, 0, avgd(15, BASE / 2));
    }
    popMatrix();

    noFill();
    stroke(TAN);
    pushMatrix();
    if (true) {//hand
      translate(zerod( BASE*.38), zerod( BASE*.5));

      drawC(figX(placeFinger+6, BASE*-.15), figY(placeFinger+6, 0), zerod(PI *.34), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+7, BASE*.15), figY(placeFinger+7, BASE*.028), zerod(PI * .724), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+8, BASE*.1), figY(placeFinger+8, BASE*.028), zerod(PI * .896), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+9, BASE*.05), figY(placeFinger+9, BASE*.028), zerod(PI * .896), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+10, BASE*-.008), figY(placeFinger+10, BASE*.028), zerod(PI * .896 ), avgd(10, BASE*.1), .5, -.3);
    }
    popMatrix();
    popMatrix();    




    fill(TAN); 
    noStroke();
    pushMatrix();
    translate(zerod(-BASE*.35), zerod(BASE*.30));
    rotate(zerod(PI/4 + map(k.scaleY, -1, 1, -.3, .3))); 

    drawL(figX(placeLeg1, 0) -antizerod(7), figY(placeLeg1, 0) -antizerod(7), avgd(15, BASE / 2));

    noFill();
    stroke(TAN);
    pushMatrix();
    if (true) {//foot
      translate(zerod(BASE*.5), zerod( BASE*.374));
      rotate(zerod(-PI/2));


      drawC(figX(placeFinger+11, BASE*.148), figY(placeFinger+11, BASE*.008), zerod(PI *.712), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+12, BASE*-.136), figY(placeFinger+12, BASE*-.004), zerod(PI * .4), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+13, BASE*-.136), figY(placeFinger+13, BASE*-.054), zerod(PI * .4), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+14, BASE*-.136), figY(placeFinger+14, BASE*-.104), zerod(PI * .4), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+15, BASE*-.136), figY(placeFinger+15, BASE*-.154), zerod(PI * .4), avgd(10, BASE*.1), .5, -.3);
      //drawC(figX(placeFinger+13,BASE*-.136),figY(placeFinger+2,BASE*m),zerod(PI * .244),avgd(10,BASE*.1),.5,-.3);
    }
    popMatrix();
    popMatrix();   


    fill(TAN); 
    noStroke();
    pushMatrix();
    translate(zerod(BASE*.35), zerod(BASE*.30));
    rotate(zerod(PI/4 + map(k.scaleY, -1, 1, -.3, .3))); 

    pushMatrix();
    if (true) { //strictly knee!
      translate(figX(placeLeg2, 0), figY(placeLeg2, 0));
      translate (avgd(15, 0) -antizerod(7), avgd(15, 0) -antizerod(7)); //for bottom      
      rotate(avgd(PI, 0));

      drawLBottomCorner(0, 0, avgd(15, BASE / 2));
    }
    popMatrix();
    noFill();
    stroke(TAN);
    pushMatrix();
    if (true) {//foot
      translate(zerod(BASE*.38), zerod( BASE*.5));
      //rotate(zerod(-PI/2));



      drawC(figX(placeFinger+16, BASE*-.148), figY(placeFinger+16, BASE*.008), zerod(PI *.343), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+17, BASE*.136), figY(placeFinger+17, BASE*-.004), zerod(PI * .584), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+18, BASE*.136), figY(placeFinger+18, BASE*-.054), zerod(PI * .584), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+19, BASE*.136), figY(placeFinger+19, BASE*-.104), zerod(PI * .584), avgd(10, BASE*.1), .5, -.3);
      drawC(figX(placeFinger+20, BASE*.136), figY(placeFinger+20, BASE*-.154), zerod(PI * .584), avgd(10, BASE*.1), .5, -.3);
    }
    popMatrix();
    popMatrix();
  }
  void drawEyebrows(int place){
    
   /* 
    float m =k.scaleX;// map(k.scaleX, -1, 1, 0, 2);
      float n =k.scaleY;// map(k.scaleX, -1, 1, 0, 2);
      println("m:"+m);
         println("n:"+n);
    */     
   stroke(BLACK);
   //setLightStrokeWeight(); 
  //setHeavyStrokeWeight(); 
  noStroke();
    
   drawVViaRects(figX(place,0),figY(place,BASE*-.072),avgd(10,BASE*.1),0,avgd(1,BASE*-.012)); 
  }
}

//CUT HERE------------------------------------>8-------------

//ANIMAL
