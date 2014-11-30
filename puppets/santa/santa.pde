int BASECOUNT = 26; //santa



Santa santa = new Santa();
Keeper k = new Keeper();
float SZ = 500;
void setup() {
  size(500, 500);
  strokeCap(SQUARE);
  //frameRate(20);

}
void draw() {
   //println(frameRate);
  background(WHITE);
  santa.draw();
  k.draw();
  k.adv();
}

ArrayList<Gift> gifts = new ArrayList<Gift>();


 

class Gift{
  Santa s;
  float x,y,xs,ys,sz,a;
  color cMain,cRibbon;
    Gift(Santa ps,float px,float py){
      s = ps;
       sz = s.BASE * random(.2,.4);
       x= px; y = py;
       ys = s.BASE* -random(.02,.08); 
       xs = s.BASE * random(-.025,.025);
       a = 0;
       int i = mainColors.length;
       int r = floor(random(mainColors.length));
       //choose random main color and random ribbon, make sure not same color
       cMain = mainColors[r];
       while(cMain == mainColors[r]){
           r = floor(random(mainColors.length));
       }
       cRibbon = mainColors[r];
       
    }
    
    boolean draw(int place){
       ys += s.BASE * .0025;
      x += xs;
     y += ys;
     a += xs*.05; 
     if(a < PI * 2) a+= PI *2;
     if(a > PI * 2) a-= PI *2;
     
     
     
     
         pushMatrix();
         translate(s.zerod(x),s.zerod(y));
         if(k.along > .9)  rotate(s.zerod(a));
     noStroke();    
         fill(cMain);
         
        s.drawSquareCentered(s.figX(place,0),s.figY(place,0),s.avgd(12,sz),s.avgd(12,sz));
        fill(cRibbon);
        s.drawSquareCentered(s.figX(place+1,0),s.figY(place+1,0),s.avgd(6,sz*.4),s.avgd(12,sz));
        s.drawSquareCentered(s.figX(place+2,0),s.figY(place+2,0),s.avgd(12,sz),s.avgd(6,sz*.4));
        s.drawCircle(s.figX(place+3,0),s.figY(place+3,-sz*.6),s.avgd(10,sz*.4));
          
        
     popMatrix();
        //s.drawCircle(s.figX(1,x),s.figY(1,y),4);
       
       if(y > 500 + sz*2) return false;
       
       return true; 
    }
}
//boolean virgin = true;
class Santa extends Animal {
  float basex, basey;
    
  Santa() {

    super();
    //cache some sin values

    

    BASE = 120;
    smallStrokeWeight = BASE/60;
    basicStrokeWeight = BASE/40;
    heavyStrokeWeight = BASE/10;
    basex = 250; 
    basey = 250;


  }




  void draw() { 
    super.draw();
    pushMatrix();
    
    translate(zerod(basex), zerod(basey));
strokeMed();
    
    drawArms(15);
    drawLegs(21);
    drawBody(1);
      drawBelt(4);
    
    drawHead(2,3,6,7,8,12);
  
 
    
  
    popMatrix();
    
    if(k.mousePressed() &&random(1) < .2){

          float ang = map(k.scaleBut,0,1,0,.7);
         float dir = 1;
         if(random(1) < .5) dir = -1;
         
         
   
         float x = (basex +(BASE*0.076*dir) )+dir * (cos(ang) * BASE* 0.784);
         float y = (basey + BASE*-.264) + (sin(ang) * BASE*-0.78 );
   
      
       gifts.add(new Gift(this,x,y)); 
    }
    
    int giftplace = 27;
    ArrayList<Gift>  giftsToKill = new ArrayList<Gift>();
    for(Gift g : gifts){
       if(!g.draw(giftplace)){
         giftsToKill.add(g); 
       } 
       giftplace += 4;
    }
    gifts.removeAll(giftsToKill);
    
    
  }
  void drawLegs(int place){
         pushMatrix();
    float ang = map(k.scaleBut,0,1,0,.7);
    translate(zerod(BASE*-.2),zerod(BASE*.18));
    
    rotate(zerod(-PI/2+zerod(ang)));
    fill(RED);stroke(RED);
    //drawCircle(0,0,30);
    drawSquareCentered(figX(place+0,BASE*-.4),figY(place+0,0), avgd(12,BASE*.5),avgd(12,BASE*.3));
    
    fill(BLACK);stroke(BLACK);
    drawD(figX(place+2,BASE*-.644),figY(place+2,BASE*-.144 ), zerod(-PI/2), avgd(16,BASE*.25), avgd(1,2));
    drawSquareCentered(figX(place+4,BASE*-.6),figY(place+4,0), avgd(12,BASE*.33),avgd(12,BASE*.33));
    

    popMatrix();
    pushMatrix();
        
    fill(RED);stroke(RED);
    translate(zerod(BASE*.2),zerod(BASE*.18));
    rotate(zerod(-PI/2-zerod(ang)));
    //drawCircle(0,0,30);
    drawSquareCentered(figX(place+1,BASE*-.4),figY(place+1,0), avgd(12,BASE*.5),avgd(12,BASE*.3));

    fill(BLACK);stroke(BLACK);
    drawD(figX(place+3,BASE*-.644),figY(place+3,BASE*.144 ), zerod(PI/2), avgd(16,BASE*.25), avgd(1,2));
    drawSquareCentered(figX(place+5,BASE*-.6),figY(place+5,0), avgd(12,BASE*.33),avgd(12,BASE*.33));


    popMatrix();
  }
  void drawArms(int place){
    
     pushMatrix();
    float ang = map(k.scaleBut,0,1,0,.7);
    translate(zerod(BASE*-0.076),zerod(BASE*-.264));

  
    
    rotate(zerod(ang));
    fill(RED);stroke(RED);
    drawSquareCentered(figX(place+0,BASE*-.4),figY(place+0,0), avgd(12,BASE*.5),avgd(12,BASE*.3));
    
    fill(GREEN,zerod(255));stroke(GREEN);
    drawD(figX(place+2,BASE*-.652),figY(place+2,0 ), zerod(PI), avgd(16,BASE*.3), avgd(1,2));
    
    drawD(figX(place+3,BASE*-.704),figY(place+3,BASE*-.16 ), zerod(-PI/2), avgd(16,BASE*.1), avgd(1,1.5));
    
     
    popMatrix(); 
    
         pushMatrix();
    
    translate(zerod(BASE*0.076),zerod(BASE*-.264));
    
    rotate(zerod(-ang));
    fill(RED);stroke(RED);
    drawSquareCentered(figX(place+1,BASE*.4),figY(place+1,0), avgd(12,BASE*.5),avgd(12,BASE*.3));
    
    fill(GREEN,zerod(255));stroke(GREEN);
    drawD(figX(place+4,BASE*.652),figY(place+4,0 ), zerod(0), avgd(16,BASE*.3), avgd(1,2));
    
    drawD(figX(place+5,BASE*.704),figY(place+5,BASE*-.16 ), zerod(-PI/2), avgd(16,BASE*.1), avgd(1,1.5));
    
     
    popMatrix(); 
    
    
  } 
  
  void drawBody(int place){
        fill(RED);
    stroke(RED);

     drawCircle(figX(place,0),figY(place,0),avgd(12,BASE)); 
  }
  void drawHead(int placeHead, int placeNose ,int placeBeard, int placeMouth, int placeEyes, int placeHat){
        fill(PINK,zerod(255));
    stroke(PINK);

    pushMatrix();
translate(0, zerod(BASE*-.544));
rotate(zerod(k.scaleX/2));
      drawCircle(figX(placeHead,0),figY(placeHead,0),avgd(10,BASE*.58));
      
     // 
     
           stroke(GRAY);
      fill(GRAY);
//drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
  drawTriangleFromBase(figX(placeBeard,0 ),figY(placeBeard,0)+antizerod(4), zerod(PI), avgd(8,BASE*.35), 1.5);
  fill(RED); stroke(RED,zerod(255));
drawD(figX(placeMouth,0),figY(placeMouth,BASE*.06 ), zerod(PI/2), avgd(12,BASE*.15), avgd(1,.5+k.scaleBut));

      noFill();
      stroke(BLACK);
      
      //void drawC(float x, float y, float a,  float sz, float stretch, float extraangle) {
        
          drawC(figX(placeNose,0),figY(placeNose,BASE*-.064),zerod(-PI/2), avgd(12,BASE*.12),1,zerod(-.5));

      stroke(PINK);
      fill(WHITE);
      
      //drawC(float x, float y, float a, 
  //float sz, float stretch, float extraangle) {
    stroke(PINK);
      drawCircle(figX(placeEyes,BASE*-.148),figY(placeEyes,BASE*-.124),avgd(10,BASE*.16));
placeEyes++;
      drawCircle(figX(placeEyes,BASE*.148),figY(placeEyes,BASE*-.124),avgd(10,BASE*.16));
placeEyes++;

      noStroke();
      fill(BLACK);
 float off =  -(BASE*.04*k.scaleBut) ;// + BASE*.02;
      drawCircle(figX(placeEyes,BASE*-.148 -off),figY(placeEyes,BASE*-.124 + off),avgd(10,BASE*.06));
placeEyes++;
      drawCircle(figX(placeEyes,BASE*.148-off),figY(placeEyes,BASE*-.124+off),avgd(10,BASE*.06));
placeEyes++;
      
      pushMatrix();
      
      rotate(zerod(-.18));
      fill(RED);
      stroke(RED);
      //void drawTriangleFromBase(float x, float y, float a, float sz, float tall) {
      drawTriangleFromBase(figX(placeHat,BASE*0),figY(placeHat,BASE*-.276),0,avgd(12,BASE*.32),1);
      placeHat++;
      fill(GRAY);stroke(GRAY);
      drawSquareCentered(figX(placeHat,BASE*0),figY(placeHat,BASE*-.276),avgd(16,BASE*.68),avgd(8,BASE*.08));
      placeHat++;
      drawCircle(figX(placeHat,BASE*0),figY(placeHat,BASE*-.632),avgd(16,BASE*.12));
      popMatrix();
      
      
      
      popMatrix();
  }
  void drawBeard(){

  }
  
  void drawBelt(int place){
    fill(BLACK);stroke(BLACK);
     drawSquareCentered(figX(place,0 ),figY(place,0 ),avgd(10,BASE),avgd(4,BASE*.2)); 
     stroke(TAN); noFill();
     drawSquareCentered(figX(place+1,0 ),figY(place+1,0 ),avgd(4,BASE*.2),avgd(4,BASE*.2));
  }

}



//CUT HERE------------------------------------>8-------------

//ANIMAL ... copy line from below
