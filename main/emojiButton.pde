class EmojiButton extends Button {
  PImage img;
  
  EmojiButton(float startX, float startY, float endX, float endY, String text) {
    super(startX, startY, endX, endY, text);
    this.img = loadImage(text);
  }
  
  void display() {
    rectMode(CORNERS);
    stroke(0);
    fill(225);
    rect(startX, startY, endX, endY);
    fill(0);
    image(img, startX, startY, (endX-startX)/8, (endX-startX)/8);
  }
}
