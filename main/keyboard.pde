interface Keyboard {
  
  void display();
  void initializeKeys();
  
  // TODO Defeats the purpose of interfaces to have both of these. Must fix.
  String handleInput(float xOffset, float yOffset, int zoomScale);
  EmojiKey handleClick(float xOffset, float yOffset, int zoomScale);
}
