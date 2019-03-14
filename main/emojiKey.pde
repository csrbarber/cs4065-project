class EmojiKey extends Key {
  PImage img;
  String filePath;
  
  EmojiKey(float startX, float startY, float endX, float endY, String value) {
    super(startX, startY, endX, endY, value);
    this.filePath = "emojis/" + value;
  }

  void display() {
    rectMode(CORNERS);
    stroke(0);
    fill(225);
    rect(startX, startY, endX, endY);
    fill(0);
    // TODO This is loading the image on every draw(), must fix
    img = loadImage(filePath);
    image(img, (startX+((endX-startX)/4)), startY, ((endX-startX)/2), ((endX-startX)/2));
  }
  
  String printKey() {
    if(value.substring(0, 1).equals("2"))
      return value.substring(0, 4);
    else
      return value.substring(0, 5);
  }
}
