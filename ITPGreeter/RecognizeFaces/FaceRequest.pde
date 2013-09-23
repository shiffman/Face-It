
class FaceRequest extends Thread {

  boolean running;

  SimpleThread () {
    running = false;
  }

  void start () {
    running = true;
    super.start();
  }


  void run () {
    System.out.println(id + " thread is done!");  // The thread is done when we get to the end of run()
  }

}

