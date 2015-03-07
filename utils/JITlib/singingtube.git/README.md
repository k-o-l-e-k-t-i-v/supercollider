## Singing Tubes
first setup for the singing Tube
programmed by Till Bovermann, Jan. 2015


      input
        |
        +-----> looper
        |         |
        +----+----+
             |      preEfx
        +---------+----------+
        |         |          |
     pitcher    delay        |
        |         |          |
        +----+----+----------+
             |      postEfx
           output

To get it to run, 

1. either install this repository via git, or download the zip-file [here](http://3dmin-code.org/instrument-sketching/singingtube/repository/archive.zip).
2. download SuperCollider for your operating system [here](http://supercollider.sourceforge.net/).
3. install sc-plugins (for the GreyHole delay) from [here](https://github.com/supercollider/sc3-plugins). For your convinience, there is a pre-built plugin directory available in this repository. It has to go to 
4. install JITLibExtension from the Quarks repositories (see Quarks helpfile for details)

```
~/Library/Application Support/SuperCollider/Extensions
```
