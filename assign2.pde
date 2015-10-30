final int GAME_START=1, GAME_RUN=2, GAME_END=3;
int gameState;

int x, y, z, m, n, r, q, d;

float p;
float l;
float speed = 5; 

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;



PImage Img0;
PImage Img1;
PImage Img2;
PImage Img3;
PImage Img4;
PImage Img5;
PImage Img6;
PImage Img7;
PImage Img8;
PImage Img9;



void setup () {
  size(640, 480) ;

  
  n=0;
  r=640;


  x=40;
  y=floor(random(50, 540));
  z=floor(random(50, 440));
  q=floor(random(50, 440));
  m=0;
  l=580;
  p=240;
  d=floor(random(-200, 200));



  Img0 = loadImage("img/fighter.png"); 
  Img1 = loadImage("img/hp.png");
  Img2 = loadImage("img/treasure.png");
  Img3 = loadImage("img/enemy.png");
  Img4 = loadImage("img/bg1.png");
  Img5 = loadImage("img/bg2.png");
  Img6= loadImage("img/end1.png");
  Img7 = loadImage("img/end2.png");
  Img8 = loadImage("img/start1.png");
  Img9 = loadImage("img/start2.png");


  gameState = GAME_START;


}

void draw() {
  
    switch (gameState){
      
    case GAME_START:
    image(Img9, 0, 0); 
    if (mouseY > 370 && mouseY < 420 && mouseX >200 && mouseX < 440){
    image(Img8, 0, 0);
    
    if (mousePressed){
      gameState = GAME_RUN;}
    
    }
    
  
       
    break;
    
    
    case GAME_RUN:
  
  image(Img4, n, 0);
  image(Img5, r, 0);
 
   n++;
   r++;
   if(n>640){n=-640;n++;}
   if(r>640){r=-640;r++;}
 
   stroke(225, 0, 0);
 fill(225, 0, 0);
 rect(25, 25, x, 20);
  
  
  image(Img0, l, p);
  image(Img1, 20, 20);
  image(Img2, y, z);
  image(Img3, m, q);
  
  m+=3;
  m %=640;
  
  if(m>640){
  m=-20;
  q=floor(random(50, 440));
}
  
  if (upPressed) { 
     p -= speed; 
   } 
   if (downPressed) { 
     p += speed; 
   } 
   if (leftPressed) { 
     l -= speed; 
   } 
   if (rightPressed) { 
     l += speed; 
   } 
   
   
   
   if(l>width-55){
   l=width-55;}
   if(l<0){
   l=0;}
   if(p>height-55){
   p=height-55;}
   if(p<0){
   p=0;}
   
   
   
   if(l>m-45 && l<m+45 && p>q-45 && p<q+45){
   x=x-40;
   m=-20;
   m++;
   q=floor(random(50, 440));}
   
   if(l>y-45 && l<y+45 && p>z-45 && p<z+45){
   x=x+20;
   y=floor(random(50, 540));
   z=floor(random(50, 440));
 }
  
   if(x>200){x=200;};
   
   if(q<p){q+=2;};
   if(q>p){q-=2;};
   
   if(x<20){
   gameState = GAME_END;}

    break;
    
    
    case GAME_END:
    image(Img7, 0, 0);
    if (mouseY > 310 && mouseY < 360 && mouseX >200 && mouseX < 440){
    image(Img6, 0, 0);
    if (mousePressed){
      gameState = GAME_RUN;
      x=40;
      l=580;
      p=240;}
      
    break;
}
    }  
  
}
void keyPressed(){
  if (key == CODED){
  switch(keyCode){
    case UP:
    upPressed = true;
    break;
    case DOWN:
    downPressed = true;
    break;
    case LEFT:
    leftPressed = true;
    break;
    case RIGHT:
    rightPressed = true;
    break;
  
  }
  }
  

}
void keyReleased(){
if (key == CODED){
  switch(keyCode){
    case UP:
    upPressed = false;
    break;
    case DOWN:
    downPressed = false;
    break;
    case LEFT:
    leftPressed = false;
    break;
    case RIGHT:
    rightPressed = false;
    break;
  
  }
  }
 
  
}
