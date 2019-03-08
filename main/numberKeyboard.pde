class Number implements Keyboard {
  float startX, startY,  endX, endY;
  ArrayList<Key> keys;

  Number(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.keys = new ArrayList<Key>();
    initializeKeys();
  }

  void display() {
    for (Key kkey : keys) {
      kkey.display();
    }
  }
  
  void initializeKeys() {
    String[] numbers = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
    float hDiv = (endY - startY)/4;
    float wDiv = (endX - startX)/numbers.length;

    for (int i = 0; i < numbers.length; i++) {
      keys.add(new Key(startX + wDiv*i, startY, startX + wDiv*(i+1), startY + hDiv, numbers[i]));
    }
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }
}
