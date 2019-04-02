interface Keyboard {
  
  void display();
  void initializeKeys();
  ArrayList<Key> getKeys();
  String handleInput(float xOffset, float yOffset, int zoomScale);
  
  // Just trying to get things fix for video
  PImage handleClick(float xOffset, float yOffset, int zoomScale);
}
