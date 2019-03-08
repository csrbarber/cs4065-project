class Alphabet implements Keyboard {
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
  
  // TODO Deal with Enter, Shift, and Space keys
  void initializeKeys() {
    // 4 rows
    float hDiv = (endY - startY)/4;
    String[] firstRow = new String[]{"q", "w", "e", "r", "t", "y", "u", "i", "o", "p"};
    String[] secondRow = new String[]{"a", "s", "d", "f", "g", "h", "j", "k", "l", "Enter"};
    String[] thirdRow = new String[]{"z", "x", "c", "v", "b", "n", "m", ",", ".", "Shift"};
    String[] fourthRow = new String[]{"Space"};
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    rows.add(secondRow);
    rows.add(thirdRow);
    rows.add(fourthRow);

    
    for (int i = 0; i < rows.size(); i++) {
        float wDiv = (endX - startX)/rows.get(i).length;
        for (int j = 0; j < rows.get(i).length; j++) {
          keys.add(new Key(startX + wDiv*j, startY + hDiv*i, startX + wDiv*(j+1), startY + hDiv*(i+1), rows.get(i)[j]));
        }
    }
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }

}
