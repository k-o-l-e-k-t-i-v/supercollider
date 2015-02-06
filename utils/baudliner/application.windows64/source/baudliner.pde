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
  
  input = minim.getLineIn(Minim.STEREO, 4096);
  input.mute();
  fft = new FFT( input.bufferSize(), input.sampleRate() );
  background(0);
  
  println(fft.specSize());
  
}

void draw()
{
  stroke(255);
  
  fft.forward( input.mix );
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    float val = constrain(fft.getBand(i)*100,0,255); 
    stroke(val,12);
    float x = map(i,0,fft.specSize()/2,0,width);
    line(x,height,x,height-2);
  }
  image(g,0,-1);
  
}


void stop()
{
  input.close();
  minim.stop();

  super.stop();
}
