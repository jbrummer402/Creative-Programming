int numFrames = 29; // how many frames are in the animation?
int whichFrame = 0; // a variable to keep track of which frame
                    // to display; gets updated in draw()
                    
PImage[] frames;    // a list of images
float x, y;         // position of the sprite


void setup() {
  fullScreen();
  // start the sprite in the center
  // of the screen
  
  // load the frames of the animation!
  // first we initialize the array to the number
  // of frames in our animation
  frames = new PImage[numFrames];
  frameRate(25);
  for (int i=1; i<=frames.length; i++) {
    
    // for each one, create the filename of the
    // frame we want to load, then load the image
    // and add it to our array
    String filename = "Photoshop Hands/Hand_" + i + ".png";
    frames[i-1] = loadImage(filename);
    
    frames[i-1].resize(width/2,height);
    
  }
  
  // alteratively, use this function to cut a "sprite
  // sheet" into individual frames (see the challenge above
  // to try doing this yourself)
  // arguments: path to image, # tiles wide and high, and
  // if the frames should be saved to file
  // frames = cutSpriteSheet("ExplosionSpriteSheet.png", 8,6, true);
}


void draw() {
  background(255);
  
  // draw the current image (at index "whichFrame")
  // at the sprite's x/y position
  
  image(frames[whichFrame], x + width/4,y);
  
  // update which frame we want to display
  // if we've reached the end of the array,
  // reset the count to 0 and start over
  whichFrame += 1;
  if (whichFrame == frames.length) {
    whichFrame = 0;
    
    // start animation again at a random location, ensuring
    // that the frames aren't off the edges (you might not want
    // to do this if you're doing an idle cycle, for example)
    
  }
}
