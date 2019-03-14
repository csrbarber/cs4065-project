interface Keyboard {
  
  void display();
  void initializeKeys();
  ArrayList<Key> getKeys();
  String handleInput(float xOffset, float yOffset, int zoomScale);
}
