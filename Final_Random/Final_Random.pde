
float x, y;
int i = 0;
void setup() {
  background(0);
  size(1152, 720);
  noStroke();
  //strokeWeight(2);
  drawCircles(500,250,100,10);
}

void draw() {
  int level = 50;
  fill(random(255),random(120),random(80));
  float drip = random(10);
  ellipse(mouseX, mouseY, drip, drip);
  save("Final_Random_JackBrunner.tiff");
}

void mousePressed(){
  
  drawCircles(random(width - 50),random(height - 50),100,10); 
}

void drawCircles(float x, float y, int radius, int level){
 
 noStroke();
 float colTol = 150 * level /5.0;
 float colTol2 = 170 * level / 8.0;
 color c1 = color(colTol,200,random(200));
 color c2 = color(colTol2, random(255), 180);
 color c = lerpColor(c1,c2,1);

 fill(c);
 ellipse(x,y, radius*2, radius*2);
 if(level > 1){
  level--;
  int num = int(random(3,6));
  for(int i = 0; i < num; i++){
   float angle = random(0,TWO_PI);
   float nx = x + cos(angle) * 6.0 * level;
   float ny = y + sin(angle) * 6.0 * level;
   drawCircles(nx,ny,radius/2, level);
  }
 }
  
}
