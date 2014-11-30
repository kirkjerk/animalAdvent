int BASECOUNT = 12; //bat

Bat b = new Bat();
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

class Bat extends Animal {
  float x = 250, y = 250;
  int placeForDrops; 

  float cycle; 

  Bat() {
    super();
    BASE = 150;
    smallStrokeWeight = BASE/50;
    basicStrokeWeight = BASE/40;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
  }


  void draw() { 
    x = constrain(mouseX,100,400); y = constrain(mouseY,100,400);;
    super.draw();
    pushMatrix();
    if (true) {
      translate(zerod(x), zerod(y));
      rotate(zerod(k.scaleX+k.scaleY*PI));
      drawWings(3, 4, 5, 6, 7, 8, 9, 12);
      drawEyes(1, 2,10,11);
    }
    popMatrix();
    /*
        stroke(LITEGREEN);
    line(0,0,figX(5,0),400);
    line(0,0,figX(6,0),400);
    line(0,0,figX(7,0),400);
    line(0,0,figX(8,0),400);
    line(0,0,figX(9,0),400);
    println(
      (figX(6,0) - figX(5,0))+":"+
      (figX(7,0) - figX(6,0))+":"+
      (figX(8,0) - figX(7,0))+":"+
      (figX(9,0) - figX(8,0))+":");
*/
    
  }
  void drawEyes(int place1, int place2, int place3,int place4) {

    fill(LITEGREEN, zerod(255));
    setStrokeWeight();
    stroke(LITEGREEN);

    drawD(figX(place1, -BASE*.1), figY(place1, 0), zerod(PI*.6), avgd(20, BASE*.15), 1);
    drawD(figX(place2, BASE*.1), figY(place2, 0), zerod(PI*.4), avgd(20, BASE*.15), 1);
    fill(BLACK);
    noStroke();
    drawCircle(figX(place3, -BASE*.1), figY(place3, BASE*.05), BASE*.05);
    drawCircle(figX(place4, BASE*.1), figY(place4, BASE*.05), BASE*.05);
    
  }
  void drawWings(int place1, int place2, int place3, int place4, 
  int placeHand1, int placeHand2, int placeV, int placeLine) {
    noFill();
    stroke(BLACK);
    setStrokeWeight();
    //float reach = map(k.scaleX, -1, 1, 1, 2); // general stretch from mouse
    
    float reach = map(sin(cycle),-1,1,1,2);
    //if(mousePressed) cycle += .2;
    cycle += k.scaleBut / 3;

    float still = 1;

    float Ax = figX(place2, still * BASE * .05)+antizerod(-10);
    float Ay = figY(place2, BASE*.55)+antizerod(10);
    float Bx = figX(place2, still * BASE *.2)+antizerod(-5);
    float By = figY(place2, BASE*.25)+antizerod(-10);
    float Cx = figX(place2, reach * BASE * .3)+antizerod(0);
    float Cy = figY(place2, BASE *.5)+antizerod(10);
    float Dx = figX(place2, reach * BASE * .4)+antizerod(5);
    float Dy = figY(place2, BASE *.25)+antizerod(-10);
    float Ex = figX(place2, reach * BASE * .6)+antizerod(10);
    float Ey = figY(place2, BASE *.4)+antizerod(10);

    float Kx = figX(place1, still * -BASE * .05)+antizerod(10);
    float Ky = figY(place1, BASE*.55)+antizerod(10);
    float Lx = figX(place1, still * -BASE *.2)+antizerod(5);
    float Ly = figY(place1, BASE*.25)+antizerod(-10);
    float Mx = figX(place1, reach * -BASE * .3)+antizerod(0);
    float My = figY(place1, BASE *.5)+antizerod(10);
    float Nx = figX(place1, reach * -BASE * .4)+antizerod(-5);
    float Ny = figY(place1, BASE *.25)+antizerod(-10);
    float Ox = figX(place1, reach * -BASE * .6)+antizerod(-10);
    float Oy = figY(place1, BASE *.4)+antizerod(10);


    drawM(Ax, Ay, Bx, By, Cx, Cy, Dx, Dy, Ex, Ey);
    drawM(Kx, Ky, Lx, Ly, Mx, My, Nx, Ny, Ox, Oy);

    float Fx = figX(place4, still * BASE * 0)+antizerod(-10);
    float Fy = figY(place4, BASE*-.05)+antizerod(10);
    float Gx = figX(place4, still * BASE *.1)+antizerod(-5);
    float Gy = figY(place4, BASE*-.25)+antizerod(-10);
    float Hx = figX(place4, still * BASE * .2)+antizerod(0);
    float Hy = figY(place4, BASE *-.05)+antizerod(10);
    float Ix = figX(place4, reach * BASE * .3)+antizerod(5);
    float Iy = figY(place4, BASE *-.35)+antizerod(-10);
    float Sx = figX(place4, reach * BASE * .6)+antizerod(10);
    float Sy = figY(place4, BASE *.4)+antizerod(10);

    float Ux = figX(place3, still * -BASE * 0)+antizerod(10);
    float Uy = figY(place3, BASE*-.05)+antizerod(10);
    float Px = figX(place3, still * -BASE *.1)+antizerod(5);
    float Py = figY(place3, BASE*-.25)+antizerod(-10);
    float Qx = figX(place3, still * -BASE * .2)+antizerod(0);
    float Qy = figY(place3, BASE *-.05)+antizerod(10);
    float Rx = figX(place3, reach * -BASE * .3)+antizerod(-5);
    float Ry = figY(place3, BASE *-.35)+antizerod(-10);
    float Tx = figX(place3, reach * -BASE * .6)+antizerod(-10);
    float Ty = figY(place3, BASE *.4)+antizerod(10);


    float Xx = figX(placeV, still * -BASE * .05)+antizerod(-10);
    float Xy = figY(placeV, BASE*.55)+antizerod(-10);

    float Yx = figX(placeV, still * BASE * .0)+antizerod(0);
    float Yy = figY(placeV, BASE*.35)+antizerod(10);


    float Zx = figX(placeV, still * BASE * .05)+antizerod(10);
    float Zy = figY(placeV, BASE*.55)+antizerod(-10);



    drawM(Fx, Fy, Gx, Gy, Hx, Hy, Ix, Iy, Sx, Sy);
    drawM(Ux, Uy, Px, Py, Qx, Qy, Rx, Ry, Tx, Ty);


    drawVByPoints(Xx, Xy, Yx, Yy, Zx, Zy);

    float Vx = figX(placeLine, still * -BASE *.05)+antizerod(0);
    float Vy = figY(placeLine, BASE*-.125)+antizerod(-10);

    float Wx = figX(placeLine, still * BASE *.05)+antizerod(0);
    float Wy = figY(placeLine, BASE*-.125)+antizerod(10);

    line(Vx, Vy, Wx, Wy);
    float HandIx = figX(placeHand2, reach * BASE * .3);
    float HandIy = figY(placeHand2, BASE *-.35);
    float HandRx = figX(placeHand1, reach * -BASE * .3);
    float HandRy = figY(placeHand1, BASE *-.35);

drawBirdTrack(HandIx, HandIy, BASE*.1, 0, 1);
drawBirdTrack(HandRx, HandRy, BASE*.1, 0, 1);

    strokeWeight(1);

    fill(BLACK, zerod(255));

    stroke(BLACK, zerod(255));
    //setLightStrokeWeight();
    triangle(Tx, Ty, Rx, Ry, Nx, Ny);
    triangle(Sx, Sy, Ix, Iy, Dx, Dy);

    triangle(Rx, Ry, Nx, Ny, Mx, My);
    triangle(Ix, Iy, Dx, Dy, Cx, Cy);
    triangle(Rx, Ry, Mx, My, Lx, Ly);
    triangle(Ix, Iy, Cx, Cy, Bx, By);
    triangle(Rx, Ry, Qx, Qy, Lx, Ly);
    triangle(Ix, Iy, Hx, Hy, Bx, By);
    triangle(Qx, Qy, Px, Py, Lx, Ly);
    triangle(Hx, Hy, Gx, Gy, Bx, By);
    triangle(Lx, Ly, Ux, Uy, Kx, Ky);
    triangle(Bx, By, Fx, Fy, Ax, Ay);
    triangle(Px, Py, Ux, Uy, Lx, Ly);
    triangle(Gx, Gy, Fx, Fy, Bx, By);
    triangle(Kx, Ky, Yx, Yy, Ux, Uy);
    triangle(Ax, Ay, Yx, Yy, Fx, Fy);
    triangle(Ux,Uy,Vx,Vy,Wx,Wy);
  }
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
