
float posX = random(600, 900);

int cubertSize = 20;

PGraphics cubert;
void snap() {
  frameRate(10);
  image(snap_frames[whichFrame], width - 560, 0);
  whichFrame++;
  if (whichFrame == snap_frames.length) {
    whichFrame = 0;
  }
}
void scene1() {
  cubert = createGraphics(20,cubertSize);
  
  fill(255); 
  rect(0, height - height/4 - 10, width, height/4 + 10);

  //cubert
  stroke(5);
  frameRate(60);
  fill(200);
  
  if(frameCount%60 == 0)image(cubertFrames[0], width/2 - 10, height - height/4 - 33);
  else if(frameCount%60 > 0)image(cubertFrames[1], width/2 - 10, height - height/4 - 33);
  tree();
  posX--;
}

void tree() {
  Tree tree = new Tree(posX, height - height/4 - 60, 10, 50, 20, 20);
}
