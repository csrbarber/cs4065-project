interface Keyboard {
  
  void display();
  void initializeKeys();
  String handleInput(float xOffset, float yOffset, int zoomScale);
  EmojiKey handleClick(float xOffset, float yOffset, int zoomScale);
}
