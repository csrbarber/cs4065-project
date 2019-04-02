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
  
  void initializeKeys() {
    // Vaishu: will add all of the other emojis once we can get the first row to print out properly
    String[] firstRow = new String[]{"1f61e.png", "1f618.png", "1f92e.png", "1f61c.png",  
                                      "1f951.png", "1f351.png", "1f34e.png", "1f34c.png",
                                     "1f3e5.png", "1f6a6.png", "1f6b2.png", "1f6f4.png", 
                                     "1f525.png", "26a1.png", "2744.png", "1f308.png"};
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
    String[] fifthRow = new String[]{"1f3a4.png", "1f3ae.png", "1f3b1.png", "1f3be.png",
                                     "267b.png", "2122.png", "2764.png", "203c.png",
                                     "1f389.png", "23f3.png", "231a.png", "2709.png", 
                                     "1f54b.png", "1f303.png", "1f304.png", "26e9.png"};
    String[] sixthRow = new String[]{"1f3c0.png", "1f3c6.png", "1f3c8.png", "1f3cb.png",
                                     "1f496.png", "1f507.png", "1f514.png", "26a0.png",
                                     "1f50d.png", "1f52a.png", "1f52b.png", "1f381.png", 
                                     "1f5fc.png", "1f5fd.png", "1f5fe.png", "1f30b.png"};
    String[] seventhRow = new String[]{"1f3cf.png", "1f3d0.png", "1f3d2.png", "1f6b4.png",
                                       "1f4a4.png", "1f4ac.png", "1f4af.png", "1f6ab.png",
                                       "1f9f9.png", "1f4b0.png", "1f4bb.png", "1f4be.png", 
                                       "1f3d4.png", "1f3d5.png", "1f3d6.png", "1f3db.png"};
    String[] eighthRow = new String[]{"1f947.png", "26bd.png", "26be.png", "26f7.png", 
                                      "1f6d1.png", "1f50a.png", "1f198.png", "1f494.png",
                                      "1f4de.png", "1f4fa.png", "1f6bf.png", "1f6cc.png", 
                                      "1f3dd.png", "1f3df.png", "1f3f0.png", "1f5fb.png"};                                  
    ArrayList<String[]> rows = new ArrayList<String[]>();
    rows.add(firstRow);
    rows.add(secondRow);
    rows.add(thirdRow);
    rows.add(fourthRow);
    rows.add(fifthRow);
    rows.add(sixthRow);
    rows.add(seventhRow);
    rows.add(eighthRow);
     
    float hDiv = (endY - startY)/rows.size();
    for (int i = 0; i < rows.size(); i++) {
        float wDiv = (endX - startX)/rows.get(i).length;
        for (int j = 0; j < rows.get(i).length; j++) {
          boolean ifLandmark = false;
          if((i%4==1) && (j%4==1))
            ifLandmark = true;
          keys.add(new EmojiKey(startX + wDiv*j, startY + hDiv*i, startX + wDiv*(j+1), startY + hDiv*(i+1), rows.get(i)[j], ifLandmark));
        }
    }
  }
  
  ArrayList<Key> getKeys() {
    return keys;
  }
  
  PImage handleClick(float xOffset, float yOffset, int zoomScale) {
    PImage ret = null;
    for (Key kkey : getKeys()) {
      if (kkey.overKey(xOffset, yOffset, zoomScale)) {
        ret = ((EmojiKey)kkey).printEmoji();
        break;
      }
    }
    return ret;
  }
  
  String handleInput(float xOffset, float yOffset, int zoomScale) {
    // Just trying to fix things up before video
    return "";
  }
}
