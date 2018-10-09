class Box {
  
  Body body;
  float w;
  float h;
  int s;

  Box(float x, float y) {
    w = 200;
    h = 150;
    s=1;
    makeBody(new Vec2(x, y), w, h);
  }
 
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    imageMode(CENTER);
    image(textura,0,0);
    popMatrix();
    println(s);
  if (pos.y>1000){
    fill(#ffe65d);
   text("Perdiste Presiona E para empezar de nuevo",100,305);}
if  (pos.y<=5){
   text("Haz Ganado c:",200,405);
}
  }
  
   

  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 0.0001;
    fd.friction = 4;
    fd.restitution = 0;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-0,0), random(10)));
    body.setAngularVelocity(random(0,0));
  }
}
