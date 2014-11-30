int BASECOUNT = 13; //octopus

Octopus o = new Octopus();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);
}
void draw() {
  background(WHITE);
  o.draw();
  k.draw();
  k.adv();
}

float smaller(float a, float b) {
  if (a < b) return a;
  return b;
}  


float MAXADJUST = PI/800;
float MAXANG = PI/16;
;

class ArmSeg {
  ArmSeg next = null;
  Octopus o;
  float sz;
  float a = 0;
  float basea;
  ArmSeg(Octopus po, int kids, float f, float sa) {
    o = po;
   

    basea = PI + sin(f) / .6 ;

    kids--;
    if (kids > 0) {
      next = new ArmSeg(o, kids, f + .6,sa);
    }
  } 
  void draw(float sx, float sy, float sa) {
    
    sz = o.avgd(2.5, o.BASE*.2);
    
    //  println("got "+sx+","+sy);
    //  noLoop();

    // stroke(BLACK, 100);
    // o.drawCircle(sx, sy, 10); 
    float relMouseX = mouseX-o.basex;
    float relMouseY = mouseY-o.basey;
    //  line(relMouseX, relMouseY, sx, sy);

    float realangle = sa + a; 
    float wa = basea - realangle;
    if (k.mousePressed()) {
      wa = atan2(relMouseY - sy, relMouseX - sx);
    }


    float delta = realangle - wa;
    delta /= PI;
    if (delta > 1) delta -= 2;
    if (delta < -1) delta += 2;

    if (abs(delta) > .1) {
      float change = smaller(abs(delta * PI), MAXADJUST);
      if (delta > 0) a -= change;
      else  a += change;
    }

    a = constrain(a, -MAXANG, MAXANG);
    //float ma = map(k.scaleX,-1,1,0,10);
    //println("MA is "+ma);
    //a = sin(basea) / ma ;

    float ex = sx+sz*cos(realangle +a);
    float ey = sy+sz*sin(realangle +a);
    stroke(GREEN);
    //line(sx,sy,ex,ey);
    vertex(ex, ey);
    //  println("line("+sx+","+sy+","+ex+","+ey);


    if (next != null) {
      next.draw( ex, ey, realangle + a);//,sy+sz*sin(realangle +a));
    }


    //  line(sx, sy, sx+cos(wa)*sz, sy + sin(wa) * sz);
  }
}

class Arm {
  ArmSeg root = null;
  float sx, sy;
  float sa;
  int place;
  
  Arm(Octopus po, int pplace, float bx, float by, float pang) {
    place = pplace;
    sx = bx;
    sy = by;
    sa = pang;
   // sa = PI/2;
    root = new ArmSeg(po, 10,+2.38,sa); //2.38
  //  println("M is "+k.scaleY*4);
    
    
  } 
  void draw() {
    float a = o.avgd(PI,sa);
    stroke(GREEN);
    beginShape();
    float nx = o.figX(place,sx) + o.antizerod(2); 
    float ny = o.figY(place,sy)- o.antizerod(8);
    vertex(nx, ny);
    root.draw(nx, ny, a);
    endShape();
//    stroke(PINK);
  //  line(nx,ny,nx+100*cos(a),ny+100*sin(a));

  }
}



class Octopus extends Animal {
  float basex, basey;
  float ang;
  float mv;
  ArrayList<Arm> arms = new ArrayList<Arm>();
  Octopus() {

    super();

    BASE = 100;
    smallStrokeWeight = BASE/30;
    basicStrokeWeight = BASE/20;
    heavyStrokeWeight = BASE/10;
    basex = 250; 
    basey = 250;

    ang = 0;
    mv = 0;
 
   int place = 6;
    arms.add(new Arm(this, place++, -.52 *BASE, -.316*BASE, PI*3/4));
    arms.add(new Arm(this, place++, -.5 *BASE, -.064*BASE, PI));
    arms.add(new Arm(this, place++, -.4 *BASE, -.064*BASE, PI/2));
    arms.add(new Arm(this, place++, -.2 *BASE, -.064*BASE, PI/4));
    arms.add(new Arm(this, place++, .2 *BASE, -.064*BASE, PI/2));
    arms.add(new Arm(this, place++, .4 *BASE, -.064*BASE, PI/4));

    arms.add(new Arm(this, place++, .5 *BASE, -.064*BASE, 0));

    arms.add(new Arm(this, place++, .52 *BASE, -.316*BASE, PI/6));
 
  }


  float angleEye1;
  float angleEye2;

  void draw() { 
    super.draw();


    float angleEye1 = atan2(mouseY - 204, mouseX - 236);
    float angleEye2 = atan2(mouseY - 204, mouseX - 269);
    
    pushMatrix();
    translate(zerod(basex), zerod(basey));
    strokeMax();
    stroke(GREEN);
    for (Arm a: arms) {
      a.draw();
    }
    drawBody(1);
    drawEye(2,-.132,-.452,.3,angleEye1);
    drawEye(3,.184,-.452,.35,angleEye1);
    noFill();
 



    popMatrix();
    
    
  }
  void drawBody(int place) {
    strokeMed();
    fill(GREEN, zerod(255));
    stroke(GREEN);
    drawD(figX(place, 0), figY(place, 0), zerod(-PI/2), avgd(16, BASE*1.2), avgd(1, 2));
  }
  void drawEye(int place, float x, float y, float sz, float a) {
    fill(WHITE);
    stroke(GREEN);
    drawCircle(figX(place, BASE*x), figY(place, BASE*y), avgd(14, BASE*sz));
    fill(BLACK);
    stroke(BLACK);


    drawCircle(figX(place+2, BASE*x + ( cos(a) * sz*20)), figY(place+2, BASE*y +sin(a)*sz*20 ), avgd(6, BASE*sz/8));
    //  drawCircle(figX(placeEye2,BASE*),figY(placeEye2,BASE*),avgd(14,BASE*.35));
  }
}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
