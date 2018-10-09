import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;



Minim gestor;
AudioPlayer musica_fondo;


Box2DProcessing box2d;
Plataforma suelo;
PFont font;
PImage textura;
PImage image;
PImage image1;
PImage image2;
PImage image3;
PImage image4;
ArrayList<Box> boxes;
float y = 0;
float dy = 1;
int t = 100;
float x = 0;
float dx = 5;

int pant = 0;





void setup () {
size(1000,1000);

gestor = new Minim(this);
musica_fondo = gestor.loadFile("Blues_Infusion.mp3");
musica_fondo.setGain(-10);
musica_fondo.loop();




font = loadFont("SweetNothings-40.vlw");
  textura = loadImage("edificio1.png");
   image = loadImage("cielo3.jpg");
      image1 = loadImage("portada.png");
           image2 = loadImage("titulo.png");
                 image3 = loadImage("iman.png");
                   image4 = loadImage("nube.png");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -1000);
  boxes = new ArrayList<Box>();
  suelo = new Plataforma(500,1000,200,40);
  

}

void draw(){

switch (pant){
case 0:
background(#ffe65d);
image(image2,50,30);
image(image1,200,200);
pushMatrix();

textSize(40);
stroke(30);
fill(0);
text("Presiona E para empezar", 300, random(905,910) );
fill(255);
text("Presiona E para empezar", 300, random(900,910) );
frameRate(6);
popMatrix();
 break;
  case 1:
  background(#ffe65d);
  textFont(font, 45);
  fill(0);
  text("INSTRUCCIONES",350,random(105,110));
  text("Presionando la letra S dejas caer los bloques que formaran",100,305);
text("el edificio deben caer en la plataforma Si cae un bloque",100,355);
text("fuera de esta superficie se perdera el juego",100,405);
text("divierteteeee y mucha suerte",100,455);
text("Presiona R para empezar", 300, random(905,910) );
  fill(255);
text("INSTRUCCIONES",350,random(100,105));
text("Presionando la letra S dejas caer los bloques que formaran",100,300);
text("el edificio deben caer en la plataforma Si cae un bloque",100,350);
text("fuera de esta superficie se perdera el juego",100,400);
text("divierteteeee y mucha suerte",100,450);
text("Presiona R para empezar", 300, random(900,910) );

 break;
  case 2:
  
    
  pushMatrix();
    background(image);
     image(image4,100,400);
 image(image4,600,200);
 image(image3,y,-5);
  suelo.display();
  box2d.step();
  for (Box b: boxes) {
    b.display();
   
  }
   popMatrix();
  
  
  }
  pushMatrix();
     frameRate(t);
     t++;
   y+= dy;
  if (y>1000){
    dy *= -1;
  }
  else if (y<0){
    dy *=-1;
    
  }
  
   popMatrix();
   
   
}



void keyPressed()
{
  if (key=='e'||key=='e')
  {
   pant=1;
  }
    if (key=='r'||key=='r')
  {
   pant=2;
  }
     if (key=='s'||key=='s')
  {
   
   Box p = new Box(y,6);
    boxes.add(p);
    
  }
}
