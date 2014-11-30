int BASECOUNT = 15; //spider

Spider  s = new Spider();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  
}
void draw() {
  background(WHITE);
  s.draw();
  k.draw();
  k.adv();
}


class Spider extends Animal {
  float x,y;
  float cx, cy, xs, ys;
  Spider() {
    super();
    BASE = 40;
    smallStrokeWeight = BASE/22;
    basicStrokeWeight = BASE/20;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 250; 
    y = 250;
    cx = 250;
    cy = 150;
    
  }


  void draw() { 
    super.draw();
    
    if(k.mousePressed()){
       x = mouseX;
      y  = mouseY; 
    } else {
      xs += (cx - x) / 100;
      xs *= .96;
      ys += (cy - y )/ 100;
      ys *= .96;
      ys += .6;
      x += xs;
      y += ys;

    }
    
//println("x:"+x+"  "+"y:"+y+"  "+"xs:"+xs+"  "+"ys:"+ys);  
    pushMatrix();
    strokeMin();
    stroke(BLACK);
    noFill();
        drawWeb(14);
    
    translate(zerod(x),zerod(y));
    
    rotate(zerod(atan2(cy-y,cx -x)+PI/2));
    
    
    noStroke();
    
    drawBody(1);
    drawEyes(2,3,4,5);
    drawLegs(6);

    drawSmile(15);
    strokeMed();
    popMatrix();
  }
  void drawBody(int place){
    fill(ORANGE);
    drawCircle(figX(place,0),figY(place,0),avgd(20,BASE));
  }  
  void drawEyes(int place1, int place2, int place3, int place4){
      float x = .33; float y = -.448;
      fill(LITEGREEN,225);
      drawCircle(figX(place1,BASE*-x),figY(place1,BASE*y),avgd(10,BASE*.4));
      drawCircle(figX(place2,BASE*x),figY(place2,BASE*y),avgd(10,BASE*.4));
      fill(BLACK);
      drawCircle(figX(place3,BASE*-x),figY(place3,BASE*y),avgd(5,BASE*.2));
      drawCircle(figX(place4,BASE*x),figY(place4,BASE*y),avgd(5,BASE*.2));
  }
  void drawLegs(int place){
      //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
//m*= 2;
    noFill();
    strokeMax();
    stroke(ORANGE);
    //void drawC(float x, float y, float a, float sz, float stretch, float extraangle) {
    drawC(figX(place,BASE*-.95),figY(place,BASE*-.084),zerod(PI*.576),avgd(15,BASE),1,zerod(-1));
    place++;

    drawC(figX(place,BASE*-.85),figY(place,BASE*.204),zerod(PI*.424),avgd(15,BASE),1,zerod(-1));
    place++;

    drawC(figX(place,BASE*-.652),figY(place,BASE*.528),zerod(PI*.196),avgd(15,BASE),1,zerod(-1));
    place++;

    drawC(figX(place,BASE*-.188),figY(place,BASE*.632),zerod(PI*-0.024),avgd(15,BASE),1,zerod(-1));
    place++;



    drawC(figX(place,BASE*.95),figY(place,BASE*-.084),zerod(PI*.38),avgd(15,BASE),1,zerod(-1));
    place++; 

    drawC(figX(place,BASE*.85),figY(place,BASE*.204),zerod(PI*.568),avgd(15,BASE),1,zerod(-1));
    place++;

    drawC(figX(place,BASE*.652),figY(place,BASE*.528),zerod(PI*.78),avgd(15,BASE),1,zerod(-1));
    place++;

    drawC(figX(place,BASE*.188),figY(place,BASE*.632),zerod(PI*.992),avgd(15,BASE),1,zerod(-1));
    place++;



  }
  
  void drawSmile(int place){
 //drawU(float x, float y, float a, float sz, float stretch, boolean close) {
    stroke(BLACK); noFill();
      drawU(figX(place,0),figY(place,-BASE*.15)-antizerod(8),0,avgd(30,BASE*.9),avgd(.4,.6),false);
  }
  void drawWeb(int place){
     line(figX(place,cx),figY(place,cy)-antizerod(10),figX(place,x),figY(place,y)+antizerod(10)); 
  }

}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
