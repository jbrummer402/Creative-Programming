/**
 * This sketch demonstrates how to use an FFT to analyze
 * the audio being generated by an AudioPlayer.
 * <p>
 * FFT stands for Fast Fourier Transform, which is a
 * method of analyzing audio that allows you to visualize
 * the frequency content of a signal. You've seen
 * visualizations like this before in music players
 * and car stereos.
 * <p>
 * For more information about Minim and additional features,
 * visit http://code.compartmental.net/minim/
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

float hueOffset;
float op;


int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

int sampleRate = 256;

int fwidth = 120;
int numFrames = 4;
int whichFrame = 0;

PImage frames[];
PImage snap_frames[];
PImage cubertFrames[];

float x, y, angle;

Minim       minim;
AudioPlayer jingle;
FFT         fft;
float len;
float[] sum = new float[sampleRate];
void setup() {
  size(120, 600);
  colorMode(HSB,255,100,100,10);
  background(255);
  strokeWeight(1.5);
  w = 600 + 16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  frameRate(20);
  frames = new PImage[numFrames];
  snap_frames = new PImage[14];
  cubertFrames = new PImage[2];
  for (int i = 0; i < numFrames; i++) {
    String fileName = "PushHands/PUSH_" + i + ".png";
    frames[i] = loadImage(fileName);
    frames[i].resize(720, height);
  }
  for (int i = 0; i < 14; i++) {
    String fileName = "SnapHands/SNAP_" + (i+1) + ".png"; 
    snap_frames[i] = loadImage(fileName);
    snap_frames[i].resize(720, height);
  }
  cubertFrames[0] = loadImage("cubert0.png");
  cubertFrames[1] = loadImage("cubert1.png");
  minim = new Minim(this);

  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile("Local Natives - Dark Days.mp3", sum.length);  // change this to reduce # of fft bands

  jingle.play();

  // create an FFT object that has a time-domain buffer
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}


void draw() {

  background(0);
  stroke(255);
  if (millis() > 185000) {
    exit();
  }
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file

  if (fwidth < 600) {
    fwidth += 5;
    surface.setSize(fwidth, height); 
    image(frames[whichFrame], fwidth - 360, 0);
    whichFrame++;
    if (whichFrame == frames.length) {
      whichFrame = 0;
    }
  } else {
    if (millis() < 13000 && millis() > 11500) {
      snap();
    } else if(millis() > 13100){
      
      fft.forward(jingle.mix);
      frameRate(60);
      if(millis() > 20000){
        calcWave();
        renderWave();
        scene1();
      }
      fft();
      
      scene1();
      
      op += .005;
    }
  }
 
}

void calcWave(){
 theta += .02;
 float x = theta;
 for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  fill(255);
 
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    stroke((x+hueOffset/5+240)%360, width/5, height/10, op);
    line(x*xspacing, height/2+yvalues[x], width/2, 0);
    
  }
  hueOffset += 10;
}
