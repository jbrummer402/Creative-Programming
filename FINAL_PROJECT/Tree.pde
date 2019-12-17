
class Tree{
  float posX, posY;
  float rSizeX,rSizeY;
  float eSizeX,eSizeY;
  
  
  public Tree(float posX, float posY, float rSizeX, float rSizeY, float eSizeX, float eSizeY){
     noStroke();
     fill(80);
     rect(posX,posY, rSizeX,rSizeY - 10);
     fill(200);
     ellipse(posX + 5,posY - 10, eSizeX,eSizeY);
     ellipse(posX + 5, posY + 10, eSizeX + 10,eSizeY + 10);
     
     this.posX = posX;
     this.posY = posY;
     this.rSizeX = rSizeX;
     this.rSizeY = rSizeY;
     this.eSizeX = eSizeX;
     this.eSizeY = eSizeY;
     /*noStroke();
    fill(80);
     rect(15,30,10,50);
     fill(200);
     ellipse(20,20,20,20);
     ellipse(20,40,30,30);*/
  }
  
  float getPosX(){
     return posX;
  }
  float getPosY(){
     return posY;
  }
  float getRSizeX(){
     return rSizeX; 
  }
  float getRSizeY(){
     return rSizeY; 
  }
  float getESizeX(){
     return eSizeX;
  }
  float getESizeY(){
    return eSizeY; 
  }
  
  
}
