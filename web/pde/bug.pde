int BASECOUNT = 13; //bug

Bug  b = new Bug();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  
}
void draw() {
  background(WHITE);
  b.draw();
  k.draw();
  k.adv();
}


class Bug extends Animal {
  float x,y;
  float ang;
  float mv;
  Bug() {
    super();
    BASE = 40;
    smallStrokeWeight = BASE/22;
    basicStrokeWeight = BASE/20;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 250; 
    y = 250;
    
    ang = 0;
    mv = 0;
    
  }


  void draw() { 
    super.draw();
  
    pushMatrix();
    translate(zerod(x),zerod(y));
    
    //void drawC(float x, float y, float a, 
     // float sz, float stretch, float extraangle) {
   
       float oldAng = ang;
       seek(mouseX,mouseY);
       float deltaAng = ang - oldAng; 
    if(k.mousePressed()){
      
        x += cos(ang);
        y += sin(ang);
        mv+=.3;
    }  else {
      
       if(abs(deltaAng) > .04) {
         mv += .3;
       } 
    }
       
       
   strokeMed();
   noFill(); stroke(BLACK);
     rotate(zerod(ang));
     pushMatrix();
     
     
     rotate(zerod(sin(mv)/10));
     drawLegs(8);
     popMatrix();
     drawBody(1);
     drawHead(2);
     drawEyes(3,4);
     noFill(); stroke(BLACK);
     drawStripe(5);
     drawAnts(6,7);
     
       popMatrix();
  }
  void drawBody(int place){
     fill(LITEGREEN); noStroke();
     drawCircle(figX(place,0),figY(place,0),avgd(15,BASE)); 
  }
  void drawHead(int place){
    fill(BLACK,zerod(255)); stroke(BLACK);
    //void drawD(float x, float y, float a, float sz, float stretch) {
    drawD(figX(place,BASE*.4),figY(place,0),0,avgd(15,BASE*.6),1);
  }
  void drawEyes(int place1, int place2){
     noStroke(); fill(ORANGE);
    // float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
     float x = .67; float y = -.26;
     drawCircle(figX(place1,BASE*x),figY(place1,BASE*-y),avgd(5,BASE*.2)); 
     drawCircle(figX(place2,BASE*x),figY(place2,BASE*y),avgd(5,BASE*.2)); 
  }
  void drawStripe(int place){
    //drawLine(float x, float y, float a, float sz) {
      
      drawLine(figX(place,0),figY(place,0), zerod(PI/2), avgd(20,BASE));
  }
  
  
  
  
  
    void drawAnts(int place1, int place2){
  
     //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
     float x = .928; float y = .332;
          drawJ(figX(place1,BASE*x),figY(place1,BASE*y)+antizerod(3),
              zerod(-PI/2),avgd(10,BASE*.5),1,zerod(-2)); 
          drawFlipJ(figX(place2,BASE*x),figY(place2,BASE*-y)+antizerod(3),
              zerod(-PI/2),avgd(10,BASE*.5),1,zerod(-2),avgd(1,0)); 
  }
  
  void drawLegs(int place){
      // void drawReverseC(float x, float y, float a, 
        //float sz, float stretch, float extraangle) {
        //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);  
          drawC(figX(place,BASE*-.432),figY(place,BASE*-.344),zerod(PI*.668),avgd(15,BASE*.35),1,zerod(-1));
          place++;
          drawC(figX(place,BASE*-.104),figY(place,BASE*-.46),zerod(PI*.824),avgd(15,BASE*.35),1,zerod(-1));
          place++;
          drawC(figX(place,BASE*.425),figY(place,BASE*-.368),zerod(PI*.3),avgd(15,BASE*.35),1,zerod(-1));
          place++;


          drawC(figX(place,BASE*-.432),figY(place,BASE*.344),zerod(PI*-.752),avgd(15,BASE*.35),1,zerod(-1));
          place++;
          drawC(figX(place,BASE*-.104),figY(place,BASE*.46),zerod(PI*-.88),avgd(15,BASE*.35),1,zerod(-1));
          place++;
          drawC(figX(place,BASE*.425),figY(place,BASE*.368),zerod(PI*-.252),avgd(15,BASE*.35),1,zerod(-1));
          place++;
          
  }
  
  
  
  
  
  
  float MAXTURN = .05;
   void seek(float rtx, float rty) { 
    float dx = (rtx - x);
    float dy = ( rty - y);
/*
    //this trick seems to work to deal with the overlap..
    //they consider the shortest path even if other side of screen
    if (abs(dx) > width/2) {
      dx *= -1.0;
    }
    if (abs(dy) > height/2) {
      dy *= -1.0;
    }
*/

    float wantangle = atan2(dy, dx);
    float anglediff = (ang - wantangle);  
    anglediff /= PI; //I prefer thinking in multiples of PI...
    //this next bit catches the "runaround"
    if (anglediff > 1) {
      anglediff -= 2;
    }
    if (anglediff < -1) {
      anglediff += 2;
    }
    if (abs(anglediff) > .1) {  //arbitrary value to ignore
       if (anglediff > 0) {
        ang -= smaller(abs(anglediff*PI),MAXTURN);
      } else {
        ang += smaller(abs(anglediff*PI),MAXTURN);;
      } //could just be MAXTURN if you don't mind oversteer
    }
  }
  
  
  float smaller(float a, float b){
 if(a < b) return a;
return b; 
}  
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
