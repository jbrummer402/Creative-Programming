int origX, origY;

float size;
float mouseSpeed = 0;
float smoothedSpeed = 0;
float sizeMultiplier = 6;
float penX,penY;
float minSize = 5;
color c1, c2, newC1, newC2;
boolean color1 = true;
boolean color2 = true;

void setup(){
 background(0);
 fullScreen();
 noStroke();
  c1 = color(255,20,10);
  c2 = color(200,25,255);
  newC1 = c1;
  newC2 = c2;
}

void draw(){
  
  background(0);
  
  make_dots();
  mouseSpeed = dist(mouseX,mouseY, pmouseX,pmouseY);
  mouseSpeed *= sizeMultiplier;
  fill(255);
  smoothedSpeed = lerp(smoothedSpeed, mouseSpeed,0.05);
  
  penX = lerp(penX,mouseX,0.15);
  penY = lerp(penY, mouseY, 0.15);
  size = minSize+smoothedSpeed;
  ellipse(penX,penY, size,size);
  if(!color1){
   c1 = 0;
  }else c1 = newC1;
  if(!color2){
   c2 = 0; 
  }else c2 = newC2;
}

void mouseDragged(){
 
}

void mousePressed(){
  if(mouseButton == LEFT){
    newC1 = color((int)random(255),100,(int)random(255));
  }else if(mouseButton == RIGHT){
   newC2 = color(80, (int)random(255), (int)random(50)); 
  }
}

void keyPressed(){
 if(key == ' '){
   color1 = !color1;
 }
 if(key == TAB){
   color2 = !color2; 
 }
  
}
void make_dots(){
  float pos = map(mouseX+mouseY,0,width+height,0,1);
  
  color c = lerpColor(c1,c2,pos);
  fill(c);
  for(int i = 0; i < width; i+= 20){
    for(int j = 0; j < height; j+= 20){
       ellipse(i,j, 10,10); 
    }
 }
}
