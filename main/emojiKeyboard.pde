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
    float hDiv = (endY - startY)/8;
    String[] firstRow = new String[]{"1f61e.png", "1f618.png", "1f92e.png", "1f61c.png",  
                                      "1f951.png", "1f351.png", "1f34e.png", "1f34c.png", 
                                     "1f3e5.png", "1f6a6.png", "1f6b2.png", "1f6f4.png", 
                                     "1f525.png", "26a1.png", "2744.png", "1f308.png"};
    // vaishu: will add all of the other emojis once we can get the first row to print out properly
    String[] secondRow = new String[]{"1f602.png", "1f62c.png", "1f600.png", "1f621.png",
                                      "1f355.png", "1f354.png", "1f336.png", "1f346.png", 
                                      "26ea.png", "26f5.png", "2708.png",  "1f3e1.png", 
                                      "1f31e.png", "1f31d.png", "1f319.png", "1f30f.png"};
    String[] thirdRow = new String[]{"1f642.png", "1f60d.png", "1f970.png", "1f60e.png", 
                                      "1f370.png", "1f366.png", "1f371.png", "1f373.png", 
                                     "1f54c.png", "1f680.png", "1f682.png", "1f691.png", 
                                     "1f436.png", "1f431.png", "1f435.png", "1f4a6.png"};
    String[] fourthRow = new String[]{"1f60f.png", "1f612.png", "1f609.png", "1f60e.png",
                                      "1f37e.png", "2615.png", "1f37a.png", "1f369.png", 
                                      "1f692.png", "1f693.png", "1f695.png", "1f697.png", 
                                      "1f384.png", "1f333.png", "1f40d.png", "1f425.png"};
                                      
    // replicated the first four rows until I can organize the emojis again
    
    String[] fifthRow = new String[]{"1f61e.png", "1f618.png", "1f92e.png", "1f61c.png",  
                                      "1f951.png", "1f351.png", "1f34e.png", "1f34c.png", 
                                     "1f3e5.png", "1f6a6.png", "1f6b2.png", "1f6f4.png", 
                                     "1f525.png", "26a1.png", "2744.png", "1f308.png"};
    String[] sixthRow = new String[]{"1f602.png", "1f62c.png", "1f600.png", "1f621.png",
                                      "1f355.png", "1f354.png", "1f336.png", "1f346.png", 
                                      "26ea.png", "26f5.png", "2708.png",  "1f3e1.png", 
                                      "1f31e.png", "1f31d.png", "1f319.png", "1f30f.png"};
    String[] seventhRow = new String[]{"1f642.png", "1f60d.png", "1f970.png", "1f60e.png", 
                                      "1f370.png", "1f366.png", "1f371.png", "1f373.png", 
                                     "1f54c.png", "1f680.png", "1f682.png", "1f691.png", 
                                     "1f436.png", "1f431.png", "1f435.png", "1f4a6.png"};
    String[] eighthRow = new String[]{"1f60f.png", "1f612.png", "1f609.png", "1f60e.png",
                                      "1f37e.png", "2615.png", "1f37a.png", "1f369.png", 
                                      "1f692.png", "1f693.png", "1f695.png", "1f697.png", 
                                      "1f384.png", "1f333.png", "1f40d.png", "1f425.png"};                                  
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    rows.add(secondRow);
    rows.add(thirdRow);
    rows.add(fourthRow);
    rows.add(fifthRow);
    rows.add(sixthRow);
    rows.add(seventhRow);
    rows.add(eighthRow);

    
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
