Face It Syllabus
================

A "syllabus" and repository of Processing examples for ITP fall workshop about face detection, recognition, and miscellaneous tracking methods.

## 10:00 AM - Overview
* Detection vs. Recognition vs. Tracking

## 10:15 AM - Reference Projects

* Face Detection
    * [Drawing faces as instructed by facial detection](http://plummerfernandez.tumblr.com/post/54596732227/drawing-faces-as-instructed-by-facial-recognition)
    * [Portrait – Discovering centric figure(s) of movies using facial recognition](http://ssbkyh.com/works/portrait/)
    * [Cloud Faces](http://ssbkyh.com/works/cloud_face/)
    * [Google Earth Faces](http://www.onformative.com/lab/googlefaces/)
    * [CVDazzle](http://cvdazzle.com/)
* Face Recognition 
* Face Tracking
    * [Dance with your face](http://www.youtube.com/watch?v=dplBh_rxoUc)
    * [Face Substitution](https://vimeo.com/29279198) [Source](https://github.com/arturoc/FaceSubstitution)
    * [Kamio IOS app](https://itunes.apple.com/us/app/kamio/id668849062?mt=8)
    * [All the Universe is Full of the Lives of Perfect Creatures](https://vimeo.com/35262930)
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

## 12:00 PM - Lunch

## 1:00 PM - Face Recognition
* How it works
    * [Eigenfaces](http://jeremykun.wordpress.com/2011/07/27/eigenfaces/)
        * [Processing example](https://github.com/atduskgreg/Processing-Eigenfaces) from Greg Borenstein using [Processing-Eigenfaces](https://github.com/atduskgreg/Processing-Eigenfaces)
    * [More algorithms and stuff](http://www.face-rec.org/)
* But let's just use an API!
    * [Rekognition](http://rekognition.com/), [Sign up for API key](http://rekognition.com/register/)
    * [Lambda Labls](http://www.lambdal.com/)
    * [Rekognition for Processing Library](https://github.com/shiffman/RekognitionProcessing/releases/tag/0.1)
        * requires [HTTProcessing](https://www.dropbox.com/s/fqzddqqfhzt7580/HTTProcessing.zip)
        * [Detect a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceDetectExample)
        * [Train a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceTrainExample)
        * [Recognize a Face](https://github.com/shiffman/Faces/tree/master/FaceRekognition/FaceRecognizeExample)


FaceOSC
-------
* FaceTracker: https://github.com/kylemcdonald/ofxFaceTracker
* All FaceOSC downloads: https://github.com/kylemcdonald/ofxFaceTracker/downloads
* FaceOSC + Syphon: https://github.com/downloads/kylemcdonald/ofxFaceTracker/FaceOSC-osx+Syphon.zip
* Blink detection: https://github.com/downloads/kylemcdonald/ofxFaceTracker/BlinkExample-osx.zip
* oscp5: http://www.sojamo.de/libraries/oscP5/ (install through Processing library manager)
* Osculator: http://www.osculator.net/
* Interview with Kyle McDonald about FaceTracker: http://makematics.com/research/facetracker/
* [Deformable Model Fitting by Regularized Landmark Mean-Shift](http://link.springer.com/article/10.1007%2Fs11263-010-0380-4)

Eigenfaces from @atduskgreg
---------------------------
* Processing example: https://github.com/atduskgreg/Processing-Eigenfaces
* Uses library: https://code.google.com/p/p-eigenface/
* Explanation: http://jeremykun.wordpress.com/2011/07/27/eigenfaces/
* All from syllabus: http://makematics.com/syllabus/2012-fall/

FaceShift
---------
* http://www.faceshift.com/
* https://github.com/kylemcdonald/ofxFaceShift/downloads

FaceMorphing
------------
* How it works: https://ccrma.stanford.edu/~jacobliu/368Report/
* Michael Jackson Black or White video: http://www.youtube.com/watch?feature=player_detailpage&v=bBAiZcNWecw#t=330s
