class EmojiKey extends Key {
  PImage img;
  boolean isLandmark;

  
  EmojiKey(float startX, float startY, float endX, float endY, String value, boolean isLandmark) {
    super(startX, startY, endX, endY, value);
    this.isLandmark = isLandmark;
    this.img = loadImage("emojis/" + value);
  }

  void display() {
    rectMode(CORNERS);
    stroke(0);
    if(isLandmark) {
      fill(175);
    } else {
      fill(225);
    }
    rect(startX, startY, endX, endY);
    fill(0);
    image(img, startX + ((endX-startX)/4), startY, (endX-startX)/2, (endX-startX)/2);
  }
  
  PImage printEmoji() {
    return img;
  }
  
  String getImagePath() {
    return value;
  }
}
