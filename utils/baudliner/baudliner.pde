import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fftL,fftR;

void setup()
{
  size(512, 800, P2D);

  frameRate(100);

  minim = new Minim(this);

  input = minim.getLineIn(Minim.STEREO, 1024);
  input.mute();

  fftL = new FFT( input.bufferSize(), input.sampleRate() );
  fftR = new FFT( input.bufferSize(), input.sampleRate() );

  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftL.logAverages( 22, 8 );
  fftR.logAverages( 22, 8 );

  background(0);

  println(fftL.specSize());

}

void draw()
{
  stroke(255);

  fftL.forward( input.left );
  fftR.forward( input.right );

  for(int i = 0; i < fftL.specSize(); i++)
  {
    float valL = constrain(log(1+fftL.getBand(i)/8.0)*127,0,255); 
    float valR = constrain(log(1+fftR.getBand(i)/8.0)*127,0,255); 
    float x = map(i,0,fftL.specSize(),0,width);

    stroke(valL,20,20,30);
    line(x,height,x,height-1);
    stroke(20,valR,20,30);
    line(x,height,x,height-1);}
  image(g,0,-1);

}


void stop()
{
  input.close();
  minim.stop();
  super.stop();
}
