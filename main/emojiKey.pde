class EmojiKey extends Key {
  PImage img;
  
  EmojiKey(float startX, float startY, float endX, float endY, String value) {
    super(startX, startY, endX, endY, value);
    if(!value.equals(""))
      this.img = loadImage("emojis/" + value);
  }

  void display() {
    rectMode(CORNERS);
    stroke(0);
    fill(225);
    rect(startX, startY, endX, endY);
    fill(0);
    if(!value.equals(""))
      image(img, startX + ((endX-startX)/4), startY, (endX-startX)/2, (endX-startX)/2);
  }
  
  // TODO printKey doesn't work for EmojiKey 
  PImage printEmoji() {
    return img;
  }
}
