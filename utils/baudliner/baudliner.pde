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

Minim       minim;
AudioInput input;
FFT         fft;

void setup()
{
  size(512, 512, P2D);
  
  frameRate(100);
  
  minim = new Minim(this);
  
  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  input = minim.getLineIn(Minim.STEREO, 4096);
  
  // loop the file indefinitely
  input.mute();
  
  // create an FFT object that has a time-domain buffer 
  // the same size as input's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( input.bufferSize(), input.sampleRate() );
  background(0);
  
  println(fft.specSize());
  
}

void draw()
{
  stroke(255);
  
  // perform a forward FFT on the samples in input's mix buffer,
  // which contains the mix of both the left and right channels of the file
  
  fft.forward( input.mix );
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    float val = constrain(fft.getBand(i)*100,0,255); 
    stroke(val,12);
    // draw the line for frequency band i, scaling it up a bit so we can see it
    float x = map(i,0,fft.specSize()/2,0,width);
    line(x,height,x,height-1);
  }
  image(g,0,-1);
  
}


void stop()
{
  // always close Minim audio classes when you are done with them
  input.close();
  minim.stop();

  super.stop();
}
