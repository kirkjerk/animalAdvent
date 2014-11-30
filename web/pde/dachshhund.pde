int BASECOUNT = 14; //dachshhund

Dach d = new Dach();
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

class Ang {
  float v; 
  Ang(float p){
    v = p;
   } 
   float val(){
      return v; 
   }
}

class Dach extends Animal {
  float x = 250, y = 250;
  int placeForDrops; 

  float cycle; 
  ArrayList<Ang> segAngle = new ArrayList<Ang>();
  int SEGMIN = 10;

  Dach() {
    super();
    BASE = 150;
    smallStrokeWeight = BASE/50;
    basicStrokeWeight = BASE/25;
    heavyStrokeWeight = BASE/10;
    PIECECOUNT = 20;
    x = 100; 
    y = 250;
    
    for(int i = 0; i < SEGMIN; i++){
      segAngle.add(new Ang(0));
    }
    
  }

  float lastminX, lastmaxX, lastminY, lastmaxY;


  void draw() { 

    super.draw();



    pushMatrix();
    if (true) {
      translate(zerod(x), zerod(y));

      strokeMin();



      drawButt(2);
      strokeMed();
      drawLegs(8,9);
      drawTail(12);
      strokeMin();
      drawBody(1);
      drawShoulders(3);
      strokeMed();
      drawLegs(10,11);
      strokeMin();
      drawHead(4, 5, 6, 7,13,14);
    }
    popMatrix();
  }
  void drawButt(int place) {
    stroke(TAN);
    fill(TAN, zerod(255));
    drawD(figX(place, 0), figY(place, 0), zerod(PI), avgd(20, BASE*.3), 1);
  }
  
  void drawLegs(int place1,int place2){
     
    line(figX(place1,-BASE*.05),figY(place1,0)-antizerod(10),
          figX(place1,-BASE*.1),figY(place1,BASE*.35)+antizerod(10)); 
    line(figX(place2,BASE*.05),figY(place2,0)-antizerod(10),
          figX(place2,BASE*.1),figY(place2,BASE*.35)+antizerod(10)); 
     
  }

  void drawTail(int place){
    noFill();
    
//drawC(float x, float y, float a, float sz, float stretch, float extraangle) {
    
  drawCFromBot(figX(place,BASE*-.096),figY(place,BASE*-.092),zerod(-PI/3 + k.scaleX/2),avgd(15,BASE*.25),1,zerod(-1));
  }




  void drawBody(int place) {
    fill(TAN);
int segcount = segAngle.size();    
//segcount ++;
    float w = avgd(20.0 / segcount, BASE*.05);
    float h = avgd(10, BASE*.3);
    //stroke(PINK); 


    translate(figX(place, 0) - antizerod(10), figY(place, 0));

    for (int i = 0; i < segcount; i++) {

      rect(0, -h/2, w, h);
      rotate(zerod(segAngle.get(i).val()));
      translate(w, 0);
    }

    translate(-(figX(place, 0)- antizerod(10))  - antizerod(20), -figY(place, 0));
    
    
    if(k.mousePressed()){
      
      //  if(mouseY < 250) segAngle.add(new Float(.1));
        //else
        segAngle.add(new Ang(map(mouseY,0,500,-.15,.15)));
    } else {
       if(segcount > SEGMIN){
          segAngle.remove(segcount-1);
       } 
    }

    
  }

  void drawShoulders(int place) {
    stroke(TAN);
    fill(TAN, zerod(255));
    drawD(figX(place, 0), figY(place, 0), 0, avgd(20, BASE*.3), 1);
  }
  void drawHead(int placeHead,int placeSnout,int placeEar1,int placeEar2, int placeEye, int placeNose){
    pushMatrix();
    rotate(zerod(PI/30+ k.scaleY/2));
    translate(zerod(BASE*.24),zerod(-BASE*.05));
    drawD(figX(placeHead, 0), figY(placeHead, 0), zerod(PI), avgd(20, BASE*.3), 1);
    //drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
    drawTriangleFromBase(figX(placeSnout,0) ,figY(placeSnout,0)+ antizerod(8),zerod(PI/2),avgd(8,BASE*.15),avgd(2,2.5));
    
    //float m = k.scaleX; float n = k.scaleY; println(m+"::"+n); 
    
    drawTriangleFromBase(figX(placeEar1,BASE*.036) ,figY(placeEar1,BASE*-.132)+ antizerod(8),zerod(PI/8),avgd(8,BASE*.05),avgd(2,2.5));
    drawTriangleFromBase(figX(placeEar2,BASE*.156) ,figY(placeEar2,BASE*-.09)+ antizerod(8),zerod(PI/8),avgd(8,BASE*.05),avgd(2,2.5));

    fill(BLACK);
    stroke(BLACK);
    //float m = k.scaleX; float n = k.scaleY; println(m+"::"+n);
    drawCircle(figX(placeEye,BASE*.14),figY(placeEye,BASE*-0.044),BASE*.03);
    drawCircle(figX(placeNose,BASE*.376),figY(placeNose,BASE*-.016),BASE*.03);

    
    popMatrix();
      
  }
}


//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
