class EmojiButton extends Button {
  PImage img;
  String filePath;
  
  EmojiButton(float startX, float startY, float endX, float endY, String text) {
    super(startX, startY, endX, endY, text);
    this.filePath = text;
  }
  
  void display() {
    rectMode(CORNERS);
    stroke(150);
    fill(100);
    rect(startX, startY, endX, endY);
    textSize(32);
    fill(0);
    img = loadImage(filePath);
    image(img, (startX+((endX-startX)/4)), startY, ((endX-startX)/2), ((endX-startX)/2));
  }
}
