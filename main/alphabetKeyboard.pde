class Alphabet implements Keyboard {
  public static final String ENTER = "Enter";
  
  float startX, startY,  endX, endY;
  ArrayList<Key> keys;
  boolean isCapital;

  Alphabet(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.keys = new ArrayList<Key>();
    this.isCapital = false;
    initializeKeys();
  }

  void display() {
    for (Key kkey : keys) {
      kkey.isCapital = isCapital;
      kkey.display();
    }
  }
  
  void initializeKeys() {
    String[] firstRow = new String[]{"q", "w", "e", "r", "t", "y", "u", "i", "o", "p"};
    String[] secondRow = new String[]{"a", "s", "d", "f", "g", "h", "j", "k", "l"};
    String[] thirdRow = new String[]{"Shift", "z", "x", "c", "v", "b", "n", "m"};
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    rows.add(secondRow);
    rows.add(thirdRow);
  
    float hDiv = (endY - startY)/4;
    for (int i = 0; i < rows.size(); i++) {
        float wDiv = (endX - startX)/rows.get(i).length;
        for (int j = 0; j < rows.get(i).length; j++) {
          keys.add(new Key(startX + wDiv*j, startY + hDiv*i, startX + wDiv*(j+1), startY + hDiv*(i+1), rows.get(i)[j], false));
        }
    }
    
    float wDiv = (endX - startX)/4;
    keys.add(new Key(startX, startY + hDiv*3, startX + wDiv*3, startY + hDiv*4, "Space"));
    keys.add(new Key(startX + wDiv*3, startY + hDiv*3, startX + wDiv*4, startY + hDiv*4, ENTER));
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }
  
  String handleInput(float xOffset, float yOffset, int zoomScale) {
    String ret = "";
    for (Key kkey : getKeys()) {
      if (kkey.overKey(xOffset, yOffset, zoomScale)) {
        if (kkey.value == "Space") {
          ret = " ";
        } else if (kkey.value == "Shift") {
          if (alphabetKeyboard.isCapital) {
            isCapital = false;
          } else {
            isCapital = true;
          }
        } else {
          ret = kkey.printKey();
          isCapital = false;
          break;
        }
      }
    }
    
    return ret;
  }
  
  EmojiKey handleClick(float xOffset, float yOffset, int zoomScale) {
    return null;
  }
}
