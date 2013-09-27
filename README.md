Face It Syllabus
================

A "syllabus" and repository of Processing examples for ITP fall workshop about face detection, recognition, and miscellaneous tracking methods.

## 10:00 AM - Overview of day
* Detection vs. Recognition vs. Tracking

## 10:15 AM - Reference Projects

* Face Detection
    * [Drawing faces as instructed by facial detection](http://plummerfernandez.tumblr.com/post/54596732227/drawing-faces-as-instructed-by-facial-recognition)
    * [Portrait – Discovering centric figure(s) of movies using facial recognition](http://ssbkyh.com/works/portrait/)
    * [Cloud Faces](http://ssbkyh.com/works/cloud_face/)
    * [Google Earth Faces](http://www.onformative.com/lab/googlefaces/)
    * [CVDazzle](http://cvdazzle.com/)
* Face Recognition 
    * [Spurious Memories](http://deweyhagborg.com/spurious/)
* Face Tracking
    * [Dance with your face](http://www.youtube.com/watch?v=dplBh_rxoUc)
    * [Face Substitution](https://vimeo.com/29279198), [Source](https://github.com/arturoc/FaceSubstitution)
    * [Kamio IOS app](https://itunes.apple.com/us/app/kamio/id668849062?mt=8)
    * [All the Universe is Full of the Lives of Perfect Creatures](https://vimeo.com/35262930)
    * [Typface](http://www.rhymeandreasoncreative.com/portfolio/index.php?project=typeface)
* Other
    * [Split Faces](http://www.mymodernmet.com/profiles/blogs/split-family-faces) by http://www.ulriccollette.com/
    * [Blind self-portrait](https://vimeo.com/40279845) and [Self-Portrait Machine](http://we-make-money-not-art.com/archives/2009/07/selfportrait-machine.php#.UkQ27WTXhTs)
    * The Human Face Documentary: [Part 1](http://www.youtube.com/watch?v=8HlqbSDqmE4), [Part 2](http://www.youtube.com/watch?v=dEocYZmuxbs), [Part 3](http://www.youtube.com/watch?v=HJpqoAkWgXI), [Part 4](http://www.youtube.com/watch?v=IDAsQQE0Il4)

## 11:00 AM - OpenCV Face Detection
* How it works
    * [Processing OpenCV library](https://github.com/atduskgreg/OpenCVPro)
    * [Interview with Adam Harvey re: Face Detection](http://makematics.com/research/viola-jones/)
    * [Haarcascade Visualizer](https://github.com/adamhrv/HaarcascadeVisualizer) -- Note this requires Processing 1.5.1
* Examples
    * [Detect face in image](https://github.com/shiffman/Faces/tree/master/OpenCV/SimpleFaceDetect)
    * [Detect face in live video](https://github.com/shiffman/Faces/tree/master/OpenCV/LiveFaceDetect)
        * [scale down resolution for performance](https://github.com/shiffman/Faces/tree/master/OpenCV/LiveFaceDetect_scaled)
        * [save face as JPG](https://github.com/shiffman/Faces/tree/master/OpenCV/LiveFaceDetect_saveimages)
        * [track faces over time](https://github.com/shiffman/Faces/tree/master/OpenCV/FaceDetectMemory)
        * [save faces as images](https://github.com/shiffman/Faces/tree/master/OpenCV/SaveFaces)

## 12:00 PM - Lunch

## 1:00 PM - Face Recognition
* How it works
    * [Eigenfaces](http://jeremykun.wordpress.com/2011/07/27/eigenfaces/)
        * [Processing example](https://github.com/atduskgreg/Processing-Eigenfaces) from Greg Borenstein using [Processing-Eigenfaces](https://github.com/atduskgreg/Processing-Eigenfaces)
    * [More algorithms and stuff](http://www.face-rec.org/)
* But let's just use an API!
    * [Rekognition](http://rekognition.com/), [Sign up for API key](http://rekognition.com/register/)
        * [Rekognition for Processing Library](https://github.com/shiffman/RekognitionProcessing/releases/tag/0.1)
        * also requires [HTTProcessing](https://www.dropbox.com/s/fqzddqqfhzt7580/HTTProcessing.zip)
        * Examples
          * [Detect a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceDetectExample)
          * [Train a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceTrainExample)
          * [Recognize a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceRecognizeExample)
          * [Look at raw JSON](https://github.com/shiffman/Faces/tree/master/FaceRekognition/RawJSONExample)
          * [Threaded request](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceRecognizeExampleThread)
          * [Putting it all together with Live OpenCV](https://github.com/shiffman/Faces/tree/master/FaceRekognition/Greeter)
    * [Lambda Labs](http://www.lambdal.com/)
        * [Processing library in progress](https://github.com/shiffman/LambdaProcessing) -- talk to me if you want to use this.

## 2:30 PM - Face Tracking
* [FaceTracker](https://github.com/kylemcdonald/FaceTracker) by [Jason Saragih](http://jsaragih.org/).
   * [Interview with Kyle McDonald about FaceTracker](http://makematics.com/research/facetracker/)
   * Original "[Deformable Model Fitting by Regularized Landmark Mean-Shift](http://link.springer.com/article/10.1007%2Fs11263-010-0380-4)" paper.
   * [ofxFaceTracker](https://github.com/kylemcdonald/ofxFaceTracker) for direct use in OF.
      * [FaceOSC Downloads](https://github.com/kylemcdonald/ofxFaceTracker/downloads) for use with Processing and other applications
      * [FaceOSC + Syphon to get image into Processing](https://github.com/downloads/kylemcdonald/ofxFaceTracker/FaceOSC-osx+Syphon.zip)
      * [Blink detection OSC](https://github.com/downloads/kylemcdonald/ofxFaceTracker/BlinkExample-osx.zip)
      * OSC
         * [oscp5](http://www.sojamo.de/libraries/oscP5/) (install through Processing library manager)
         * [Osculator](http://www.osculator.net/) for help with debugging OSC
    * Examples
      * [Simple Tracker Data Demo](https://github.com/shiffman/Faces/tree/master/FaceOSC/FaceOSCDemo)
      * [All Points](https://github.com/shiffman/Faces/tree/master/FaceOSC/FaceOSCAllPoints)
      * [Triangle Mesh](https://github.com/shiffman/Faces/tree/master/FaceOSC/FaceOSCTriangleMesh)
      * [Blink Particles](https://github.com/shiffman/Faces/tree/master/FaceOSC/BlinkParticles) - requies: [BlinkExample](https://github.com/kylemcdonald/ofxFaceTracker/downloads)
      * [All OF Examples](https://github.com/kylemcdonald/ofxFaceTracker)
* [FaceShift](http://faceshift.com/)
   * [download free trial](http://www.faceshift.com/get-trial/) - 30 days only, noncommercial license avaialble for $150 and there will be a faceshift laptop in ER for checkout with academic license.
   * [ofxFaceShift](https://github.com/kylemcdonald/ofxFaceShift) for direct use in OF
   * [FaceShiftOSC tutorial](https://vimeo.com/46916078) from Kyle (note the tutorial uses an older version of FaceShift but concepts still apply).
   * [FaceShiftOSC download](https://github.com/kylemcdonald/ofxFaceShift/downloads)
   * [Simple OSC Processing Example](https://github.com/shiffman/Faces/tree/master/FaceShift)
* Face Morphing
   * [How it works](https://ccrma.stanford.edu/~jacobliu/368Report/)
   * [Michael Jackson Black or White video](http://www.youtube.com/watch?feature=player_detailpage&v=bBAiZcNWecw#t=330s)
   * [Processing Example](https://github.com/shiffman/Faces/tree/master/FaceMorph)

## 4:00 PM - Wrap-Up / Project Idea Discussion

