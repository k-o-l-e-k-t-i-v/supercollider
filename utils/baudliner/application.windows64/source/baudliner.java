import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.analysis.*; 
import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class baudliner extends PApplet {




Minim       minim;
AudioInput input;
FFT         fft;

public void setup()
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

public void draw()
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


public void stop()
{
  input.close();
  minim.stop();

  super.stop();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "baudliner" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
