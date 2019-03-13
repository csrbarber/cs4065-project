class EmojiKey extends Key{
  PImage img;
  String filePath;
  

  EmojiKey(float startX, float startY, float endX, float endY, String value) {
    super(startX, startY, endX, endY, value);
    this.filePath = "Emojis/" + value;
  }

  void display() {
    rectMode(CORNERS);
    stroke(150);
    fill(100);
    rect(startX, startY, endX, endY);
    textSize(16);
    fill(0);
    img = loadImage(filePath);
    image(img, (startX+((endX-startX)/4)), startY, ((endX-startX)/2), ((endX-startX)/2));
  }
  
  String printKey() {
    return value.substring(0, 5);
  }
   
}
