class NumberSymbol implements Keyboard {
  float startX, startY,  endX, endY;
  ArrayList<Key> keys;

  NumberSymbol(float startX, float startY, float endX, float endY) {
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
    String[] firstRow = new String[]{"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "[", "]", "{", "}", "#", "%", "^", "*", "+", "="};
    String[] secondRow = new String[]{"-", "/", ":", ";", "(", ")", "$", "&", "@", "\"", "_", "\\", "|", "~", "<", ">", "€", "£", "¥", "•"};
    String[] thirdRow = new String[]{".", ",", "?", "!", "'"};
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    rows.add(secondRow);
    rows.add(thirdRow);
    
    float hDiv = (endY - startY)/rows.size();
    for (int i = 0; i < rows.size(); i++) {
        float wDiv = (endX - startX)/rows.get(i).length;
        for (int j = 0; j < rows.get(i).length; j++) {
          keys.add(new Key(startX + wDiv*j, startY + hDiv*i, startX + wDiv*(j+1), startY + hDiv*(i+1), rows.get(i)[j], false));
        }
    }
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }
  
  String handleInput(float xOffset, float yOffset, int zoomScale) {
    String ret = "";
    for (Key kkey : getKeys()) {
      if (kkey.overKey(xOffset, yOffset, zoomScale)) {
        ret = kkey.printKey();
        break;
      }
    }
    return ret;
  }
  
  EmojiKey handleClick(float xOffset, float yOffset, int zoomScale) {
    return null;
  }
}
