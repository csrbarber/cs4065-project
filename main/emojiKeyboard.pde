class Emoji implements Keyboard {
  float startX, startY,  endX, endY;
  ArrayList<Key> keys;

  Emoji(float startX, float startY, float endX, float endY) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    this.keys = new ArrayList<Key>();
    initializeKeys();
  }

  void display() {
    for (Key kkey : keys) {
      ((EmojiKey)kkey).display();
    }
  }
  
  // TODO Deal with Enter, Shift, and Space keys
  void initializeKeys() {
    // 4 rows
    float hDiv = (endY - startY)/4;
    String[] firstRow = new String[]{"1f61e.png", "1f618.png", "1f92e.png", "1f61c.png", "1f602.png", "1f62c.png", "1f600.png", "1f621.png", 
                                     "1f642.png", "1f60d.png", "1f970.png", "1f60e.png", "1f60f.png", "1f612.png", "1f609.png"};
    // vaishu: will add all of the other emojis once we can get the first row to print out properly
    //String[] secondRow = new String[]{"a", "s", "d", "f", "g", "h", "j", "k", "l", "Enter"};
    //String[] thirdRow = new String[]{"z", "x", "c", "v", "b", "n", "m", ",", ".", "Shift"};
    //String[] fourthRow = new String[]{"Space"};
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    //rows.add(secondRow);
    //rows.add(thirdRow);
    //rows.add(fourthRow);

    
    for (int i = 0; i < rows.size(); i++) {
        float wDiv = (endX - startX)/rows.get(i).length;
        for (int j = 0; j < rows.get(i).length; j++) {
          keys.add(new EmojiKey(startX + wDiv*j, startY + hDiv*i, startX + wDiv*(j+1), startY + hDiv*(i+1), rows.get(i)[j]));
        }
    }
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }
  
  String handleInput() {
    String ret = "";
    for (Key kkey : getKeys()) {
      if (kkey.overKey()) {
        ret = kkey.printKey();
        break;
      }
    }
    return (new StringBuilder()).append("\\").append("u").append(ret).toString();
  }
}
