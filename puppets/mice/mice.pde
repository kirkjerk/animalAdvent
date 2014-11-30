int BASECOUNT = 39; //mice

Circle c1 = new Circle(150,250,100,0,PI*2, 1);
Circle c2 = new Circle(350,250,100,PI,-PI, -1);

ArrayList<Mouse> mice = new ArrayList<Mouse> ();
Keeper k = new Keeper();
float SZ = 500;


void setup() {
  size(500, 500);
  strokeCap(SQUARE);
/*  
mice.add(new Mouse(c1,PI*3/2,1));
mice.add(new Mouse(c1,PI*2,2));
mice.add(new Mouse(c1,PI/2,3));
mice.add(new Mouse(c1,PI,4));


 mice.add(new Mouse(c2,-PI/2  + PI/4,5));
 mice.add(new Mouse(c2,-PI+    PI/4,6));
mice.add(new Mouse(c2,0     +       PI/4,7));
mice.add(new Mouse(c2,PI/2+    PI/4,8));
*/
mice.add(new Mouse(c1,PI/4+PI*3/2,1));
mice.add(new Mouse(c2,PI/2,2));
mice.add(new Mouse(c1,PI/4+PI/2,3));
//mice.add(new Mouse(c2,-PI/4+0,4));



  
c1.next = c2;
c2.next = c1;

}
void draw() {
  background(WHITE);
  for(Mouse m : mice){
     m.draw(); 
  }

  k.draw();
  k.adv();
}


class Circle {
  float x,y,r,starta,stopa, dir;
  Circle next;
  Circle(float px, float py, float pr, float pstarta, float pstopa, float pdir){
     x = px; y = py;
     r = pr;
     starta = pstarta; stopa = pstopa;
     dir = pdir;
   }  
   boolean done(float a){
     if(dir > 0){
       //println(a+" vs "+stopa);
        return a >= stopa; 
     } else {
       return a <= stopa;
     }
   }
}

class Mouse extends Animal {
  float x, y;
  float ang;
int id;
  Circle c;
  
  Mouse(Circle pc, float pa, int pid) {
    super();
    BASE = 30;
    smallStrokeWeight = BASE/20;
    basicStrokeWeight = BASE/15;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    c = pc;
    id = pid;
    ang = pa;
   
  }


  void draw() { 
    super.draw();

    pushMatrix();
    
    // rotate(zerod(PI));
    //rotate(-zerod(k.scaleY)/3);


    
    
    if(c.done(ang)){

       c = c.next;
       ang = c.starta;
    }
    ang += c.dir * zerod(k.scaleBut/15);
    
    x = c.x + c.r * cos(ang);
    y = c.y + c.r * sin(ang);

//line(c.x,c.y, c.x + c.r * cos(ang),c.y + c.r * sin(ang));

    translate(zerod(x), zerod(y));
    rotate(zerod(ang +(c.dir *PI/2)));

    strokeMin();



    int bacePlace = (id - 1) * 13;
    strokeMicro();
    drawWhiskers(8+bacePlace);

    strokeMed();
    drawButt(1+bacePlace );
    drawBody(2+bacePlace);
    drawTail(3+bacePlace);
    drawEars(4+bacePlace, 5+bacePlace);
    drawEyes(6+bacePlace,7+bacePlace);
    
    //text(id,0,0);
    
    popMatrix();
  }

  void drawButt(int place) {
    //void drawD(float x, float y, float a, float sz, float stretch) {
    fill(TAN, zerod(255));
    stroke(TAN, antizerod(255));
    drawD(figX(place, 0), figY(place, 0), zerod(PI), avgd(20, BASE), avgd(1, .75));
  }
  void drawBody(int place) {
    fill(TAN);
    noStroke();
    //drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(place, 0), figY(place, 0)+antizerod(8), avgd(0, PI/2 ), avgd(12, BASE/2), 2);
  }
  void drawTail(int place) {
    stroke(TAN);
    noFill();
    //void drawS(float x, float y, float ang, float sz) {  
    drawSComplex(figX(place, -BASE*.80), figY(place, BASE*.1), zerod(PI/2), avgd(10, BASE*.6), zerod(-.2), 0, 1);
  }
  void drawEars(int place1, int place2) {
    fill(TAN); stroke(TAN);
     //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
     float x = .48; float y = .244;
     drawCircle(figX(place1, BASE*x),figY(place1, BASE*y),avgd(8,BASE*.2));
     drawCircle(figX(place2, BASE*x),figY(place2, BASE*-y),avgd(8,BASE*.2));
     
  }
    void drawEyes(int place1, int place2) {
    fill(BLACK); noStroke();
     float x = .62; float y = .076;
     drawCircle(figX(place1, BASE*x),figY(place1, BASE*y),avgd(8,BASE*.1));
     drawCircle(figX(place2, BASE*x),figY(place2, BASE*-y),avgd(8,BASE*.1));     
  }
  
    void drawWhiskers(int place){
       stroke(BLACK); noFill(); 
     //float m = k.scaleX; float n = k.scaleY; println(m+":"+n);
      
      drawLine(figX(place, BASE*.7),figY(place, BASE*-.224),zerod(-.2),avgd(15,BASE*.3)); 
      place++;
      drawLine(figX(place, BASE*.79),figY(place, BASE*-.2),zerod(-.17),avgd(15,BASE*.3)); 
      place++;
      drawLine(figX(place, BASE*.884),figY(place, BASE*-.156),zerod(-.14),avgd(15,BASE*.3)); 
      place++;
      drawLine(figX(place, BASE*.7),figY(place, BASE*.224),zerod(.2),avgd(15,BASE*.3)); 
      place++;
      drawLine(figX(place, BASE*.79),figY(place, BASE*.2),zerod(.17),avgd(15,BASE*.3)); 
      place++;
      drawLine(figX(place, BASE*.884),figY(place, BASE*.156),zerod(.14),avgd(15,BASE*.3)); 
      place++;
     }
  
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
